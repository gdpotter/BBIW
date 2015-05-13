package bbiw.web

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

        QueryResponse response = searchService.search(q, start, params.list('category'), params.list('publisher'))
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

        SearchService.FilterData filterData = searchService.getFilterData(q)
        [
                allCategories: filterData.categories,
                allPublishers: filterData.publishers,

                query: params.q,
                results: results,
                start: start,
                suggest: suggest
        ]
    }
}
