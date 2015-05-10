package bbiw.web

import org.apache.solr.client.solrj.impl.HttpSolrServer
import org.apache.solr.client.solrj.SolrServerException;
import org.apache.solr.client.solrj.impl.HttpSolrServer;
import org.apache.solr.client.solrj.SolrQuery;
import org.apache.solr.client.solrj.response.QueryResponse;
import org.apache.solr.client.solrj.response.SpellCheckResponse;
import org.apache.solr.common.SolrDocumentList;

class SearchController {

    def searchService

    def index() {

    }

    def query() {
        int start = (params.start ?: 0) as int
        String q = params.q

        QueryResponse response = searchService.search(q, start)
        SolrDocumentList results = response.getResults()

        //Check if query was spelled correctly
        SpellCheckResponse scResponse = null;
        try {
            scResponse = response.getSpellCheckResponse();
        } catch(Exception e) {
            log.info 'Property exception: ' + e
        }
        //report any spelling suggestions/query collations
        String suggest = null;
        if(scResponse) {
            if(!scResponse.isCorrectlySpelled()) {
            	suggest = scResponse.getCollatedResult()
            }
            //refine spelling suggestion?s
        }

        [query: params.q, results: results, start: start, suggest: suggest]
    }
}
