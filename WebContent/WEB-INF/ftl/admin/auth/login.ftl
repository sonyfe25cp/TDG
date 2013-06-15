<#include "/admin/common/template-head.ftl">
<link href="/css/admin/login.css" rel="stylesheet">
    <div class="container">
      <form class="form-signin" action="/adminlogin" method="post">
        <h2 class="form-signin-heading"><@spring.message "seller.login.hello"/></h2>
        <input type="text" class="input-block-level" placeholder="Email address" name="email">
        <input type="password" class="input-block-level" placeholder="Password" name="password">
        <button class="btn btn-large btn-primary" type="submit"><@spring.message "button.login"/></button>
      </form>
    </div> <!-- /container -->

<#include "/admin/common/template-bottom.ftl">