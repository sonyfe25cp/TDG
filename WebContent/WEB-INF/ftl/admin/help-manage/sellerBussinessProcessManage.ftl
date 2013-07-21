<script charset="utf-8" src="/js/kindeditor-4.1.7/kindeditor.js"></script>
<script charset="utf-8" src="/js/kindeditor-4.1.7/lang/zh_CN.js"></script>
<script>
        KindEditor.ready(function(K) {
                window.editor = K.create('#businessProcess',{
                	uploadJson : '/seller/upload/image',
                	filePostName : 'image',
                });
        });
</script>


<link href="/css/admin/help-manage.css" rel="stylesheet">
<div class="container main">
  <#include "/admin/help-manage/seller-help-top-nav.ftl"/>
  <div class="span10">
       <h3>业务流程</h3>
       <form action="/admin/manageHelp/seller/updateBusinessProcess">
           <div class="seller-help-manage-content">
              <textarea id="businessProcess" rows="20" name="businessProcess" class="field span12" placeholder="input some description about this product"></textarea>
           </div>
           <div id="submit">
              <button type="submit" class="btn btn-primary">提交修改</button>
              <span id="updateResultSpan">${updateResult}</span>
           </div>
       </form>  
  </div>
</div>
