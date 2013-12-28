<#include "/customer/common/template-head.ftl">
<link href="/css/admin/login.css" rel="stylesheet">
<div class="container">
	<form class="form-signin" action="/customerForgetPwd" method="post">
    	<h2 class="form-signin-heading">找回密码</h2>
        	<input type="text" class="input-block-level" placeholder=<@spring.message "customer.model.email"/> name="email" access="email">
        	<button class="btn btn-large btn-primary" id="submit"><@spring.message "button.submit"/></button>
      </form>
	<#include "/customer/common/template-bottom.ftl">
</div> <!-- /container -->