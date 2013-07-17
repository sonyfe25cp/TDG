<#include "/customer/common/template-head.ftl">
<link href="/css/admin/login.css" rel="stylesheet">
    <div class="container">
      <form class="form-signin" action="/customerlogin" method="post">
        <h2 class="form-signin-heading"><@spring.message "seller.login.hello"/></h2>
        <input type="text" class="input-block-level" placeholder="Email address" name="email">
        <input type="password" class="input-block-level" placeholder="Password" name="password">
        <a href="/customerforgetpwd"><@spring.message "link.login.forget"/></a>
        <a href="/registascustomer"><@spring.message "link.login.register"/></a>
        <button class="btn btn-large btn-primary" type="submit"><@spring.message "button.login"/></button>
      </form>
	<#include "/customer/common/template-bottom.ftl">
    </div> <!-- /container -->