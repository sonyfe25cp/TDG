<link href="/css/customer/top-banner.css" rel="stylesheet">
<div class="navbar navbar navbar-fixed-top">
  <div class="navbar-inner">
    <div class="container">
      <button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="brand" href="/customerindex">TDG</a>
      <div class="nav-collapse collapse">
        <div class="pull-right">
        	<#if customer?exists>
	          <span>${customer.email}, <@spring.message "customer.menu.welcome"/></span>
	          <a href="/customer/auth/welcome">[<@spring.message "link.menu.center"/>]</a>
	          <a href="/customer/logout">[<@spring.message "link.menu.logout"/>]</a>
	        <#else>
	        	<span><@spring.message "customer.menu.welcome"/></span>
	          <a href="/loginascustomer">[<@spring.message "link.menu.login"/>]</a>
	          <a href="/registascustomer">[<@spring.message "link.menu.register"/>]</a>
	         </#if>
        </div>
      </div><!--/.nav-collapse -->
    </div>
  </div>
</div>
<div id="customer-header" class="customer-index-header">
	<div id="logo" class="logo">
		<img src="/img/jd-logo.png"/>
	</div>
	<div id="searcher" class="searcher">
		<div class="form">
			<input type="text" id="key" autocomplete="false"/>
			<input type="button" value="搜索" class="button">
		</div>
	</div>
	<div id="cart" class="cart">
		去购物车结算
	</div>
</div>