<script charset="utf-8" src="/js/kindeditor-4.1.7/kindeditor.js"></script>
<script charset="utf-8" src="/js/kindeditor-4.1.7/lang/zh_CN.js"></script>
<script>
        KindEditor.ready(function(K) {
                window.editor = K.create('#aboutus',{
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
       <div class="seller-help-manage-content">
           <textarea id="aboutus" rows="20" name="aboutus" class="field span12" placeholder="input some description about this product"></textarea>
       </div>
  </div>
</div>
