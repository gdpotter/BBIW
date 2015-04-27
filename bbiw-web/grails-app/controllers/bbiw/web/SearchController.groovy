package bbiw.web

import org.apache.solr.client.solrj.impl.HttpSolrServer
import org.apache.solr.client.solrj.SolrServerException;
import org.apache.solr.client.solrj.impl.HttpSolrServer;
import org.apache.solr.client.solrj.SolrQuery;
import org.apache.solr.client.solrj.response.QueryResponse;
import org.apache.solr.common.SolrDocumentList;

class SearchController {

    def index() {

    }

    def query() {
        HttpSolrServer solr = new HttpSolrServer(grailsApplication.config.sorl.url);

        SolrQuery query = new SolrQuery();
        query.setQuery("cdc");
        query.addFilterQuery("publisher:data.cdc.gov");
        query.setFields("title","desc", "publisher", "url");
        query.setStart(0);    
        query.set("defType", "edismax");

        QueryResponse response = solr.query(query);
        SolrDocumentList results = response.getResults();

        [query: params.q, result: results.get(0).toString()]
    }
}
