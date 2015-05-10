<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>${query} | Big Brother is Watching</title>
    <meta name="layout" content="main" />
</head>

<body>
    <div class="page-header">
        <h2>Search Results</h2>
        <div class="text-center">
            <h3 class="lead">
                <strong class="text-danger">
                    ${results.getNumFound()}
                </strong>
                results were found for the query of
            </h3>
            <g:form class="input-group col-xs-6 col-xs-offset-3" action="query" method="get">
                <g:hiddenField name="start" value="${start}" />
                <g:if test="${params.category}">
                    <g:hiddenField name="category" value="${params.category}" />
                </g:if>
                <g:if test="${params.publisher}">
                    <g:hiddenField name="publisher" value="${params.publisher}" />
                </g:if>

                <g:textField value="${query}" class="form-control col-xs-6" name="q" />
                <span class="input-group-btn">
                    <button class="btn btn-success">
                        <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                    </button>
                </span>
            </g:form>
			<g:if test="${suggest != null}">
        	<h2 class="lead">
            	Did you mean <g:link action="query" params="${params + [q: suggest]}"><strong class="text-info">${suggest}</strong></g:link>?
	        </h2>
    	    </g:if>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-3">
            <div class="well">
                <g:form action="query" method="get">
                    <g:hiddenField name="q" value="${query}" />
                    <g:hiddenField name="start" value="${start}" />
                    <div class="form-group">
                        <label for="category">Category:</label>
                        <g:select class="form-control select2" multiple="multiple" optionKey="key" optionValue="value"
                                  from="${allCategories}" name="category" value="${params.list('category')}" />
                    </div>

                    <div class="form-group">
                        <label for="publisher">Publisher:</label>
                        <g:select class="form-control select2" multiple="multiple" optionKey="key" optionValue="value"
                                  from="${allPublishers}" name="publisher" value="${params.list('publisher')}" />
                    </div>

                    <div class="form-group">
                        <button class="btn btn-primary">Filter</button>
                    </div>

                </g:form>
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
                        <div class='btn-group'>
                            <a class="btn btn-info btn-xs">Links</a>
                            <a href="#" class="btn btn-info btn-xs dropdown-toggle" data-toggle="dropdown"><span class="caret"></span></a>
                            <ul class="dropdown-menu">
                            <!--Dataset Links-->
                            <g:if test="${result.links}">
                                <g:each in="${result.links}" var="link">
                                <li><a href="${link}">${link}</a></li>
                                </g:each>
                            </g:if>
                            <g:else>
                                <li><a>None provided</a></li>
                            </g:else>
                        </ul>
                        </div>

                        <g:each in="${result.category}">
                            <span class="label label-default">${it}</span>
                        </g:each>
                        <p>${result.desc.join(' ')}</p>
                    </div>
                    <span class="clearfix border"></span>
                </article>
            </g:each>

            <g:if test="${results.size() < results.getNumFound()}">
                <g:set var="page" value="${results.start / 10}" />
                <g:set var="page_lower" value="${page>5?page-4:1}" />
                <g:set var="page_upper" value="${page<results.getNumFound()/10 - 5?page+5:results.getNumFound()/10+1}" />
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
                        <g:each in="${page_lower..page_upper}" var="i">
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
