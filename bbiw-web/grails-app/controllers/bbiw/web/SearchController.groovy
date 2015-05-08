package bbiw.web

import org.apache.solr.client.solrj.impl.HttpSolrServer
import org.apache.solr.client.solrj.SolrServerException;
import org.apache.solr.client.solrj.impl.HttpSolrServer;
import org.apache.solr.client.solrj.SolrQuery;
import org.apache.solr.client.solrj.response.QueryResponse;
import org.apache.solr.common.SolrDocumentList;

class SearchController {

    def searchService

    def index() {

    }

    def query() {
        int start = (params.start ?: 0) as int
        String q = params.q
        [query: params.q, results: searchService.search(q, start), start: start]
    }
}
