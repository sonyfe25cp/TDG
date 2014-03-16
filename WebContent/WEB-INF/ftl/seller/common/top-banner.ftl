<div class="navbar navbar navbar-fixed-top">
  <div class="navbar-inner">
    <div class="container">
      <button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="brand" href="/seller/welcome">World China Town</a>
      <div class="nav-collapse collapse">
        <div class="pull-right">
          <#if seller?exists>
	          <span>
	          <#if Session.shopName??>
	          	ShopName : ${Session.shopName}, 
	          </#if>
	          Store ID: ${seller.id}  , ${seller.email}，<@spring.message "seller.menu.welcome"/>
	          <a href="/seller/logout">[<@spring.message "link.menu.logout"/>]</a>
	          </span>
          <#else>
	          <span><@spring.message "seller.menu.welcome"/></span>
	          <a href="/loginasseller">[<@spring.message "link.menu.login"/>]</a>
	          <a href="/registasseller">[<@spring.message "link.menu.register"/>]</a>
          </#if>
        </div>
      </div><!--/.nav-collapse -->
    </div>
  </div>
</div>