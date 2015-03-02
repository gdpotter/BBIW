package bbiw.web

class SearchController {

    def index() {

    }

    def query() {
        [query: params.q]
    }
}
