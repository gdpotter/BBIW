<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>${query} | Big Brother is Watching</title>
    <meta name="layout" content="main" />
</head>

<body>
    <div class="page-header">
        <h2>Search Results</h2>
        <h2 class="lead">
            <strong class="text-danger">${results.size()}</strong> results were found for the query of <strong class="text-danger">${query}</strong>
        </h2>
    </div>
    <div class="row">
        <div class="col-lg-3">
            <div class="well">
                Filters
            </div>
        </div>
        <div class="col-lg-9">
            <g:each in="${results}" var="result">
                <article class="search-result row">
                    <div class="col-xs-12 col-sm-12 col-md-3">
                        <a href="${result.url[0]}" title="Lorem ipsum" class="thumbnail">
                            <img src="${resource(dir:'images', file:'justice.png')}" alt="Department of Justice" />
                        </a>
                    </div>
                    <div class="col-xs-12 col-sm-12 col-md-9">
                        <h3><a href="${result.url[0]}" title="">${result.title[0]}</a></h3>
                        <p>${result.desc.join(' ')}</p>
                    </div>
                    <span class="clearfix border"></span>
                </article>
            </g:each>
        </div>
    </div>
</body>
</html>
