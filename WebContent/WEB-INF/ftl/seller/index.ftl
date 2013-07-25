<<<<<<< HEAD
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>Template &middot; Bootstrap</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <link href="/css/seller/seller-common.css" rel="stylesheet">
    <script "text/javascritpt" src="/js/jquery.js"></script>
    <script "text/javascritpt" src="/js/seller/index.js"></script>
    
    
    <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="/js/html5shiv.js"></script>
    <![endif]-->
   
  </head>
  <body>

<#include "/seller/common/template-front-head.ftl">
    <div class="container">
      <#include "/seller/help/seller-help-top-nav.ftl"/>
      <div class="seller-index">
         <div class="picture-content">
           <div id= "pic-pre" class="direction"><a href="javascript:;" title="previous" class="fp-direction fp-prev" hidefocus="true" style="height: 100%" onclick="pre_pic()"></a></div>
              <div class="pictures">
                 <ul class="picture-list">
                   <#if picturePath?? >
                      <#list picturePath as picture>
                          <li class= ><img src="/img/seller/${picture}" width=100% height=100% /></li>
                      </#list>
                   </#if>
                 </ul>
              </div>
           <div id= "pic-next" class="direction"><a href="javascript:;" title="next" class="fp-direction fp-next" hidefocus="true" style="height: 100%" onclick="next_pic()"></a></div>  
         </div>
         <div class="text-content">
            ${textContent}
         </div>
      </div>
      <#include "/seller/common/footer.ftl">
    </div> <!-- /container -->
	<#include "/common/bootstrap-js.ftl">
  </body>
</html>