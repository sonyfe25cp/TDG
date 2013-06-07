<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>Bootstrap, from Twitter</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <#include "/common/bootstrap-css.ftl"/>

    <style type="text/css">
      body {
        padding-top: 60px;
        padding-bottom: 40px;
      }
    </style>
  </head>

  <body>
  
   <div class="container">
	   <#include "/customer/common/header.ftl"/>
      <!-- nav and images -->
      <#include "/customer/common/nav.ftl"/>

      <#include "/customer/product/list-for-index.ftl"/>
      
      <br/>
	  <#include "/customer/common/footer.ftl"/>
      
    </div> <!-- /container -->

    <#include "/common/bootstrap-js.ftl"/>

  </body>
</html>
