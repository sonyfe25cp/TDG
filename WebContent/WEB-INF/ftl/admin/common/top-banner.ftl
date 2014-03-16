<div class="navbar navbar navbar-fixed-top">
  <div class="navbar-inner">
    <div class="container">
      <button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="brand" href="/admin/welcome">World China Town</a>
      <div class="nav-collapse collapse">
        <div class="pull-right">
          <#if admin?exists>
	          <span>${admin.email}，<@spring.message "admin.menu.welcome"/>
	          <a href="/admin/logout">[<@spring.message "link.menu.logout"/>]</a>
	          </span>
          </#if>
        </div>
      </div><!--/.nav-collapse -->
    </div>
  </div>
</div>