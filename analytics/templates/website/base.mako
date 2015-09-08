## coding: utf-8
 <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
 <html>
  <header>
    <title>${_(u'SciELO Estatísticas')}</title>
    <link rel="stylesheet" href="/static/bootstrap-3.2.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="/static/bootstrap-3.2.0/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="/static/css/style.css">
    <link rel="stylesheet" href="/static/daterangepicker/daterangepicker.css" />
    <script src="/static/jquery-1.11.1/jquery-1.11.1.min.js"></script>
  </header>
  <body>
    <div class="row">
      <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="container-fluid">
          <div class="navbar-header">
            <a class="navbar-brand" href="#">
              <span class="glyphicon glyphicon-stats"></span>
              ${_(u"SciELO Estatísticas")}
            </a>
          </div>
          <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
              <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">${_(u'Coleções')} <span class="caret"></span></a>
                <ul class="dropdown-menu" role="menu">
                  % for acron, name in sorted(collections.items(), key=lambda x: x[1]):
                    <li role="presentation"><a role="menuitem" tabindex="-1" href="?collection=${acron}">${name}</a></li>
                  % endfor
                </ul>
              </li>
            </ul>
            <button type="submit" class="btn navbar-btn" data-toggle="modal" data-target="#journal_selector_modal">${_(u'selecionar periódico')}</button>
          </div> <!-- collapse -->
        </div> <!-- container-fluid -->
      </nav>
    </div>
    <div class="row">
      <div class="header-col level1">
        <div class="container-fluid">
            <span id="collection_name">${selected_collection}</span>
        </div>
      </div>
    </div>
    <div class="row">
      % if selected_journal:
      <div class="header-col level2">
        <div class="container-fluid">
            ${selected_journal} (${selected_journal_code})
            <a href="?journal=clean" class="remove_session">
              <span class="glyphicon glyphicon-remove-circle navbar-right"/>
            </a>
        </div>
      </div>
      % endif
    </div>
    <div class="row">
      % if selected_document:
      <div class="header-col level3">
        <div class="container-fluid">
            ${selected_document.original_title()}
            <a href="?document=clean" class="remove_session">
              <span class="glyphicon glyphicon-remove-circle navbar-right"/>
            </a>
        </div>
      </div>
      % endif
    </div>
    <div class="row">
      <nav class="navbar navbar-default" role="navigation">
        <div class="container-fluid">
          <ul class="nav navbar-nav">
            <li class="${'active' if page == 'accesses' else ''}">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">${_(u'Acessos')} <span class="caret"></span></a>
              <ul class="dropdown-menu">
                <li><a href="${request.route_url('accesses_web')}">${_(u'Gráficos')}</a></li>
                <li><a href="${request.route_url('accesses_list_journals_web')}">${_(u'Periódicos')}</a></li>
                <li><a href="${request.route_url('accesses_list_issues_web')}">${_(u'Top 100 Issues')}</a></li>
                <li><a href="${request.route_url('accesses_list_articles_web')}">${_(u'Top 100 Artigos')}</a></li>
              </ul>
            </li>
            <li class="${'active' if page == 'publication' else ''}">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">${_(u'Publicação')} <span class="caret"></span></a>
              <ul class="dropdown-menu">
                <li><a href="${request.route_url('publication_article_web')}">${_(u'Gráficos de documentos')}</a></li>
                <li><a href="${request.route_url('publication_journal_web')}">${_(u'Gráficos de periódicos')}</a></li>
              </ul>
            </li>
          </ul>
        </div> <!-- div container-fluid -->
      </nav>
    </div> <!-- div row -->

    <div class="row container-fluid">
      <%block name="central_container" />
    </div><!-- div row -->
    <div class="modal fade" id="journal_selector_modal" tabindex="-1" role="dialog" aria-labelledby="journal_selector_modal" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">${_(u'fechar')}</span></button>
            <h4 class="modal-title" id="myModalLabel">${_(u'selecionar periódico')}</h4>
          </div>
          <form role="form" method="GET">
            <div class="modal-body">
                ${_(u'selecionar um periódico')}:
                <select class="form-control" name="journal">
                  % for issn, title in sorted(journals.items(), key=lambda x: x[1]):
                    <option value="${issn}">${title}</option>
                  % endfor
                </select>
            </div>
            <div class="modal-footer">
              <button type="submit" class="btn btn-primary">${_(u'selecionar')}</button>
            </div>
          </form>
        </div>
      </div>
    </div>
    <script src="/static/bootstrap-3.2.0/js/bootstrap.min.js"></script>
    <script src="/static/moment/moment.min.js"></script>
    <script src="/static/highcharts/highcharts.min.js"></script>
    <script src="/static/highcharts/plugins/export-csv-master/export-csv.js"></script>
    <script src="/static/daterangepicker/daterangepicker.js"></script>
    <script>$('.collapse').collapse()</script>
    <%block name="extra_js" />
  </body>
</html>