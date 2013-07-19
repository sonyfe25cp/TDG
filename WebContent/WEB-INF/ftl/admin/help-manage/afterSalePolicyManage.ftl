<script charset="utf-8" src="/js/kindeditor-4.1.7/kindeditor.js"></script>
<script charset="utf-8" src="/js/kindeditor-4.1.7/lang/zh_CN.js"></script>
<script>
        KindEditor.ready(function(K) {
                window.editor = K.create('#description',{
                	uploadJson : '/seller/upload/image',
                	filePostName : 'image',
                });
        });
</script>

<#include "/customer/common/template-head.ftl"/>
<link href="/css/admin/help-manage.css" rel="stylesheet">
<#include "/customer/common/top-banner.ftl"/>
<div class="container">
  <!-- nav and images -->
  <#include "/customer/common/nav.ftl"/>
  <#include "/admin/help-manage/help-left.ftl">
  <div class="help-right">
     <h3 class="helt-tit">
        <strong>售后政策</strong>
     </h3>
     <div class="help-box">
         <form action="/admin/manageHelp/updateAfterSalePolicy">
               <div id="content">
                 <textarea id="description" rows="20" name="afterSalePolicy" class="field span12" placeholder="input some description about this product"></textarea>
               </div>
               <div id="submit">
                 <button type="submit" class="btn btn-primary">提交修改</button>
               </div>  
         </form>
     </div>
  </div>
</div>