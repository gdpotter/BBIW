class UrlMappings {

	static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(controller:'search', action:'index')
        "/query"(controller:'search',action:'query')
        "500"(view:'/error')
	}
}
