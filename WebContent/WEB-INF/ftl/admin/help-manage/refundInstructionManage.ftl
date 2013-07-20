<script charset="utf-8" src="/js/kindeditor-4.1.7/kindeditor.js"></script>
<script charset="utf-8" src="/js/kindeditor-4.1.7/lang/zh_CN.js"></script>
<script>
        KindEditor.ready(function(K) {
                window.editor = K.create('#refundInstruction',{
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
        <strong>退款说明</strong>
     </h3>
     <div class="help-box">
         <form action="/admin/manageHelp/updateRefundInstruction">
               <div id="content">
                 <textarea id="refundInstruction" rows="20" name="refundInstruction" class="field span12" placeholder="input some description about this product"></textarea>
               </div>
               <div id="submit">
                 <button type="submit" class="btn btn-primary">提交修改</button>
                 <span id="updateResultSpan">${updateResult}</span>
               </div>  
         </form>
     </div>
  </div>
</div>