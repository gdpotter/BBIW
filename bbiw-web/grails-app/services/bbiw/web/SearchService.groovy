package bbiw.web

import org.apache.solr.client.solrj.SolrQuery
import org.apache.solr.client.solrj.impl.HttpSolrClient
import org.apache.solr.client.solrj.response.QueryResponse

class SearchService {

    def grailsApplication

    QueryResponse search(String q, int start = 0, List<String> categories = [], List<String> publishers) {
        HttpSolrClient solr = new HttpSolrClient(grailsApplication.config.solr.url);

        SolrQuery query = new SolrQuery();
        query.setQuery(q)
        query.set("qt", "/select")
        query.set("spellcheck", "on")
        if (categories) {
            query.addFilterQuery("category:${categories.collect { "\"${it}\"" }.join(' OR ')}")
        }
        if (publishers) {
            query.addFilterQuery("publisher:${publishers.collect { "\"${it}\"" }.join(' OR ')}")
        }

        query.setStart(start);
        query.set("defType", "edismax")

        QueryResponse response = solr.query(query);

        return response;
    }

    FilterData getFilterData(String q) {
        HttpSolrClient solr = new HttpSolrClient(grailsApplication.config.solr.url);
        SolrQuery query = new SolrQuery();
        query.setQuery(q)
        query.set("qt", "/select")
        query.addFacetField("category")
        query.addFacetField("publisher")
        query.set("defType", "edismax")
        QueryResponse response = solr.query(query)
        return new FilterData(
                categories: response.getFacetField("category")?.getValues()?.collectEntries { [it.getName(), "${it.getName()} (${it.getCount()})"] },
                publishers: response.getFacetField("publisher")?.getValues()?.collectEntries { [it.getName(), "${it.getName()} (${it.getCount()})"] }
        )
    }

    static class FilterData {
        Map<String, String> categories
        Map<String, String> publishers
    }
}
