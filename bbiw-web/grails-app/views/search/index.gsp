<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Big Brother is Watching</title>
    <meta name="layout" content="main" />
</head>
<body>
    <div class="search-box">
        <div class="row">
            <div class="col-md-6 col-md-offset-3 well">
                <h3>Let's Search</h3>
                <g:form class="bs-component" action="query" method="get">
                    <div class="form-group">
                        <input class="form-control" type="text" name="q" />
                    </div>
                    <div class="form-group">
                        <input type="submit" value="Search Now" class="btn btn-success pull-right clearfix" />
                    </div>
                </g:form>
            </div>
        </div>
    </div>
</body>
</html>