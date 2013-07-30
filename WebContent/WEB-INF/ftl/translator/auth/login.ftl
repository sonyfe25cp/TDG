<#include "/translator/common/template-head.ftl">
<link href="/css/admin/login.css" rel="stylesheet">
<script src="/js/omartech.check.input.js"></script>
<script src="/js/translator/auth.login.js"></script>
<div class="container">
	<form class="form-signin" action="/translatorlogin" method="post">
    	<h2 class="form-signin-heading"><@spring.message "seller.login.hello"/></h2>
        <input type="text" class="input-block-level" placeholder=<@spring.message "translator.model.email"/> name="email" access="email">
        <input type="password" class="input-block-level" placeholder=<@spring.message "translator.model.password"/> name="password" access="password">
        <div>
	        <!-- 
	        	<a href="/translatorforgetpwd"><@spring.message "link.login.forget"/></a>
	        -->
	        <a href="/registastranslator"><@spring.message "link.login.register"/></a>
        </div>
        <button class="btn btn-large btn-primary" id="submit"><@spring.message "button.login"/></button>
      </form>
	<#include "/translator/common/template-bottom.ftl">
</div> <!-- /container -->