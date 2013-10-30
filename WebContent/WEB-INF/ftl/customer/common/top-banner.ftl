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
			  		<span class="hidden" id="customerId">${customer.id}</span>
			        <span>${customer.email}, <@spring.message "customer.menu.welcome"/></span>
			        <a href="/customer/auth/welcome">[<@spring.message "link.menu.center"/>]</a>
			        <a href="/logoutascustomer">[<@spring.message "link.menu.logout"/>]</a>
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
