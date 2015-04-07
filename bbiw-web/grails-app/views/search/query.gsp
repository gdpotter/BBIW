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
            <strong class="text-danger">3</strong> results were found for the query of <strong class="text-danger">${query}</strong>
        </h2>
    </div>
    <div class="row">
        <div class="col-lg-3">
            <div class="well">
                Filters
            </div>
        </div>
        <div class="col-lg-9">

            <article class="search-result row">
                <div class="col-xs-12 col-sm-12 col-md-3">
                    <a href="#" title="Lorem ipsum" class="thumbnail"><img src="${resource(dir:'images', file:'justice.png')}" alt="Department of Justice" /></a>
                </div>
                <div class="col-xs-12 col-sm-12 col-md-9">
                    <h3><a href="http://catalog.data.gov/dataset/national-crime-victimization-survey" title="">National Crime Victimization Survey</a></h3>
                    <p>eu of Justice Statistics' National Crime Victimization Survey (NCVS) collects data on personal and household victimization by conducting an ongoing national survey of residential addresses. Begun in 1973, the survey compliments what is known about crime from...</p>
                </div>
                <span class="clearfix border"></span>
            </article>

            <article class="search-result row">
                <div class="col-xs-12 col-sm-12 col-md-3">
                    <a href="#" title="Lorem ipsum" class="thumbnail"><img src="${resource(dir:'images', file:'justice.png')}" alt="Department of Justice" /></a>
                </div>
                <div class="col-xs-12 col-sm-12 col-md-9">
                    <h3><a href="http://catalog.data.gov/dataset/sexual-victimization-of-college-women" title="">Sexual Victimization of College Women</a></h3>
                    <p>This report presents the results of a 1997 survey of female college students’ experiences of sexual victimization since school began in the fall of 1996 and compared findings with rape estimates taken from a sample of college women who completed...</p>
                </div>
                <span class="clearfix borda"></span>
            </article>

            <article class="search-result row">
                <div class="col-xs-12 col-sm-12 col-md-3">
                    <a href="#" title="Lorem ipsum" class="thumbnail"><img src="${resource(dir:'images', file:'justice.png')}" alt="Department of Justice" /></a>
                </div>
                <div class="col-xs-12 col-sm-12 col-md-9">
                    <h3><a href="http://catalog.data.gov/dataset/campus-sexual-assault-csa-study" title="">Campus Sexual Assault (CSA) Study</a></h3>
                    <p>Conducted by RTI International to inform the development of targeted intervention strategies, this 2007 study examined the prevalence, nature, and reporting of sexual assault on campus.</p>
                </div>
                <span class="clearfix borda"></span>
            </article>





        </div>
    </div>
</body>
</html>
