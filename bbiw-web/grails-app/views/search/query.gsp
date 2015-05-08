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
            <strong class="text-danger">${results.getNumFound()}</strong> results were found for the query of <strong class="text-danger">${query}</strong>
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
                        <a href="${result.url[0]}" title="${result.publisher[0]}" class="thumbnail">
                            <g:resultImage publisher="${result.publisher[0]}" category="${result.category}"/>
                        </a>
                    </div>
                    <div class="col-xs-12 col-sm-12 col-md-9">
                        <h3><a href="${result.url[0]}" title="">${result.title[0]}</a></h3>
                        <p>${result.desc.join(' ')}</p>
                    </div>
                    <span class="clearfix border"></span>
                </article>
            </g:each>

            <g:if test="${results.size() < results.getNumFound()}">
                <g:set var="page" value="${results.start / 10}" />
                <div class="text-center">
                    <ul class="pagination">
                        <g:if test="${page == 0}">
                            <li class="disabled">
                                <span>
                                    <span aria-hidden="true">&laquo;</span>
                                </span>
                            </li>
                        </g:if>
                        <g:else>
                            <li>
                                <g:link controller="${params.controller}" action="${params.action}" params="${params + [start: start - 10]}">
                                    <span>&laquo;</span>
                                </g:link>
                            </li>
                        </g:else>
                        <g:each in="${1..(results.getNumFound() / 10 + 1)}" var="i">
                            <li class="${page + 1== i ? 'active' : ''}">
                                <g:link controller="${params.controller}" action="${params.action}" params="${params + [start: (i - 1) * 10]}">
                                    <span>${i}</span>
                                </g:link>
                            </li>
                        </g:each>
                        <g:if test="${page == results.getNumFound() / 10}">
                            <li class="disabled">
                                <span>
                                    <span aria-hidden="true">&laquo;</span>
                                </span>
                            </li>
                        </g:if>
                        <g:else>
                            <li>
                                <g:link controller="${params.controller}" action="${params.action}" params="${params + [start: start + 10]}">
                                    <span>&raquo;</span>
                                </g:link>
                            </li>
                        </g:else>
                    </ul>
                </div>
            </g:if>
        </div>
    </div>
</body>
</html>
