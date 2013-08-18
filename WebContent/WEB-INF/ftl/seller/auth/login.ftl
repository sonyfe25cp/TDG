<#include "/seller/common/template-front-head.ftl">
	<#include "/common/bootstrap-css.ftl">
	<link href="/css/seller/login.css" rel="stylesheet">
    <div class="container">
      <#include "/seller/help/seller-help-top-nav.ftl"/>
      <form class="form-signin" action="/sellerlogin" method="post">
        <h2 class="form-signin-heading"><@spring.message "seller.login.hello"/></h2>
        <input type="text" class="input-block-level" placeholder=<@spring.message "seller.model.email"/> name="email" access="email">
        <input type="password" class="input-block-level" placeholder=<@spring.message "seller.model.password"/> name="password" access="password">
        <div>
	        <a href="/sellerforgetpwd"><@spring.message "link.login.forget"/></a>
	        <a href="/registerasseller"><@spring.message "link.login.register"/></a>
        </div>
        <button class="btn btn-large btn-primary" id="submit"><@spring.message "button.login"/></button>
      </form>
      <#include "/seller/common/footer.ftl">
    </div> <!-- /container -->
   <#include "/common/bootstrap-js.ftl">
  </body>
</html>
