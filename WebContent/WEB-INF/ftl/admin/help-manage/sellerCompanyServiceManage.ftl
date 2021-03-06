<script charset="utf-8" src="/js/kindeditor-4.1.7/kindeditor.js"></script>
<script charset="utf-8" src="/js/kindeditor-4.1.7/lang/zh_CN.js"></script>
<script>
        KindEditor.ready(function(K) {
                window.editor = K.create('#companyService',{
                	uploadJson : '/admin/upload/image',
                	filePostName : 'image',
                });
        });
</script>

<link href="/css/admin/help-manage.css" rel="stylesheet">
<#include "/admin/common/template-head.ftl">
<#include "/admin/common/top-banner.ftl">
<div class= "admin-manage-body">
   <div class="admin-manage-left">
      <div>
         <#include "/admin/common/left-nav.ftl">
      </div>
   </div>
   <div class="admin-manage-right">
      <#include "/admin/help-manage/seller-help-top-nav.ftl"/>
      <div>
       <h3><@spring.message "seller.home.services" /></h3>
       <div>
         <form action="/admin/manageHelp/seller/updateCompanyService" method="POST">
             <div  class="admin-update-box">
                <textarea id="companyService" rows="20" name="companyService"  class="field span11" placeholder="input some description about this product">${companyServiceManage}</textarea>
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
