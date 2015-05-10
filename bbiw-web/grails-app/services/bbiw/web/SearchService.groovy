package bbiw.web

import org.apache.solr.client.solrj.SolrQuery
import org.apache.solr.client.solrj.impl.HttpSolrClient
import org.apache.solr.client.solrj.response.QueryResponse

class SearchService {

    def grailsApplication

    QueryResponse search(String q, int start = 0, List<String> categories = [], List<String> publishers) {
        HttpSolrClient solr = new HttpSolrClient(grailsApplication.config.solr.url);

        SolrQuery query = new SolrQuery();
        query.setQuery(q);
        query.set("qt", "/select");
        query.set("spellcheck", "on");
        if (categories) {
            query.addFilterQuery("category:${categories.join(' OR ')}")
        }
        if (publishers) {
            query.addFilterQuery("publisher:${publishers.join(' OR ')}")
        }

        query.setStart(start);
        query.set("defType", "edismax");

        QueryResponse response = solr.query(query);

        return response;
    }

    List<String> facetQuery(String facet) {
        HttpSolrClient solr = new HttpSolrClient(grailsApplication.config.solr.url);
        SolrQuery query = new SolrQuery();
        query.addFacetField(facet)
        QueryResponse response = solr.query(query)
        response.getFacetFields().get(0).getValues().collect { it.getName() }
    }

    List<String> getCategories() {
        facetQuery('category')
    }

    List<String> getPublishers() {
        facetQuery('publisher')
    }
}
