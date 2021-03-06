<script charset="utf-8" src="/js/kindeditor-4.1.7/kindeditor.js"></script>
<script charset="utf-8" src="/js/kindeditor-4.1.7/lang/zh_CN.js"></script>
<script>
        KindEditor.ready(function(K) {
                window.editor = K.create('#aboutUs',{
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
      <div  class="help-manage-content">
       <h3><@spring.message "seller.home.aboutus" /></h3>
       <div>
         <form action="/admin/manageHelp/seller/updateAboutUs" method="POST">
             <div  class="admin-update-box">
                <textarea id="aboutUs" rows="20" name="aboutUs"  class="field span11" placeholder="input some description about this product">${aboutUsManage}</textarea>
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
