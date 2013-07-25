<script charset="utf-8" src="/js/kindeditor-4.1.7/kindeditor.js"></script>
<script charset="utf-8" src="/js/kindeditor-4.1.7/lang/zh_CN.js"></script>
<script>
        KindEditor.ready(function(K) {
                window.editor = K.create('#shoppingProcess',{
                	uploadJson : '/seller/upload/image',
                	filePostName : 'image',
                });
        });
</script>

<link href="/css/admin/help-manage.css" rel="stylesheet">
<#include "/admin/common/template-head.ftl">
<#include "/admin/common/top-banner.ftl">

<div class= "admin-manage-body">
   <div class="admin-manage-left">
      <div><#include "/admin/common/left-nav.ftl"></div>
   </div>
   <div class = "admin-manage-right">
      <div class="help-manage-tit"><h2><@spring.message "customer.help.manage"/></h2></div>
      <#include "/admin/help-manage/help-left.ftl">
      <div class="help-right">
     <h3 class="helt-tit"><strong><@spring.message "help.model.shoppingProcess"/></strong></h3>
     <div>
         <form action="/admin/manageHelp/updateTradeRules">
               <div class="admin-update-box">
                 <textarea id="shoppingProcess" rows="22" name="shoppingProcess" class="field span12" placeholder="input some description about this product">${shoppingProcessManage}</textarea>
               </div>
               <div id="submit">
                 <button type="submit" class="btn btn-primary"><@spring.message "button.update"/></button>
                 <span id="updateResultSpan">${updateResult}</span>
               </div>  
         </form>
     </div>
  </div>
   </div>
</div>


