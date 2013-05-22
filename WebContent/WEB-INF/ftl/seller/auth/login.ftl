<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title><@spring.message "seller.login.title"/></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

	<#include "/common/bootstrap-css.ftl">
	<link href="/css/seller/login.css" rel="stylesheet">

    <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="../assets/js/html5shiv.js"></script>
    <![endif]-->

  </head>

  <body>

    <div class="container">

      <form class="form-signin">
        <h2 class="form-signin-heading"><@spring.message "seller.login.hello"/></h2>
        <input type="text" class="input-block-level" placeholder="Email address">
        <input type="password" class="input-block-level" placeholder="Password">
        <a href="/sellerforgetpwd"><@spring.message "seller.login.forget"/></a>
        <a href="/sellerregister"><@spring.message "seller.login.register"/></a>
        <button class="btn btn-large btn-primary" type="submit"><@spring.message "seller.login.button"/></button>
      </form>

    </div> <!-- /container -->

   <#include "/common/bootstrap-js.ftl">

  </body>
</html>
