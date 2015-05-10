package bbiw.web

import groovy.util.logging.Log4j
import org.apache.solr.client.solrj.SolrQuery
import org.apache.solr.client.solrj.impl.HttpSolrServer
import org.apache.solr.client.solrj.response.QueryResponse
import org.apache.solr.client.solrj.response.SpellCheckResponse
import org.apache.solr.client.solrj.response.SpellCheckResponse.Suggestion
import org.apache.solr.common.SolrDocumentList

class SearchService {

    def grailsApplication

    QueryResponse search(String q, int start = 0) {
        HttpSolrServer solr = new HttpSolrServer(grailsApplication.config.solr.url);

        SolrQuery query = new SolrQuery();
        query.setQuery(q);
        query.set("qt", "/select");
        query.set("spellcheck", "on");
//        query.addFilterQuery("publisher:data.cdc.gov");
//        query.setFields("title","desc", "publisher", "url");
        query.setStart(start);
        query.set("defType", "edismax");

        QueryResponse response = solr.query(query);

        return response;
    }
}
