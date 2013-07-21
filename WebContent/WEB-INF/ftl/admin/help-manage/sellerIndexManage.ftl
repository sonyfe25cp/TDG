<script charset="utf-8" src="/js/kindeditor-4.1.7/kindeditor.js"></script>
<script charset="utf-8" src="/js/kindeditor-4.1.7/lang/zh_CN.js"></script>
<script>
        KindEditor.ready(function(K) {
                window.editor = K.create('#joinUs',{
                	uploadJson : '/seller/upload/image',
                	filePostName : 'image',
                });
        });
</script>


<link href="/css/admin/help-manage.css" rel="stylesheet">
<div class="container main">
  <#include "/admin/help-manage/seller-help-top-nav.ftl"/>
  <div class="span10">
       <h3>加入我们</h3>
       <form action="">
           <div class="seller-help-manage-content">
              <textarea id="joinUs" rows="20" name="joinUs" class="field span12" placeholder="input some description about this product"></textarea>
           </div>
           <div id="submit">
              <button type="submit" class="btn btn-primary">提交修改</button>
              <span id="updateResultSpan">${updateResult}</span>
           </div>
       </form>  
  </div>
</div>
