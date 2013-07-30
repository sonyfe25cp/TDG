<div class="navbar navbar navbar-fixed-top">
  <div class="navbar-inner">
    <div class="container">
      <button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="brand" href="/translator/welcome">TDG</a>
      <div class="nav-collapse collapse">
        <div class="pull-right">
          <#if translator?exists>
	          <span>${translator.email}，<@spring.message "translator.menu.welcome"/>
	          <a href="/translator/logout">[<@spring.message "link.menu.logout"/>]</a>
	          </span>
          <#else>
	          <span><@spring.message "translator.menu.welcome"/></span>
	          <a href="/loginastranslator">[<@spring.message "link.menu.login"/>]</a>
	          <a href="/registastranslator">[<@spring.message "link.menu.register"/>]</a>
          </#if>
        </div>
      </div><!--/.nav-collapse -->
    </div>
  </div>
</div>