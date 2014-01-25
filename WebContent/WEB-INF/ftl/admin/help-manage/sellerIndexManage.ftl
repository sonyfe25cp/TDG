<script charset="utf-8" src="/js/kindeditor-4.1.7/kindeditor.js"></script>
<script charset="utf-8" src="/js/kindeditor-4.1.7/lang/zh_CN.js"></script>
<script>
        KindEditor.ready(function(K) {
                window.editor = K.create('#joinUs',{
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
       <h3><@spring.message "seller.home.root"/></h3>
       <div>
        <form action="/admin/manageHelp/seller/indexManage" method="POST">
           <div class="admin-update-box">
              <textarea id="joinUs" rows="20" name="indexManage" class="field span12"><#if sellerIndex.textContent??>${sellerIndex.textContent}</#if></textarea>
           </div>
           <div id="submit">
              <button type="submit" class="btn btn-primary">提交修改</button>
              <#if flag == "true">
             	 <span id="updateResultSpan">更新成功</span>
              </#if>
           </div>
       </form>  
     </div><!-- text-content -->
   </div><!-- admin-manage-right -->
</div>
