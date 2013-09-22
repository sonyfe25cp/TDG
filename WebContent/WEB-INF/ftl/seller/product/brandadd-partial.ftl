<script charset="utf-8" src="/js/kindeditor-4.1.7/kindeditor.js"></script>
<script charset="utf-8" src="/js/kindeditor-4.1.7/lang/zh_CN.js"></script>
<script>
	 KindEditor.ready(function(K) {
         editor = K.create('#description',{
         	uploadJson : '/seller/upload/image/',
         	filePostName : 'image',
         });
	});
</script>

<legend><@spring.message "brand.add.title"/></legend>
<form class="form-horizontal" action="/seller/addbrand">
	<div class="control-group">
	    <label class="control-label"><@spring.message "brand.name"/></label>
	    <div class="controls">
	      <input type="text" name="name">
	    </div>
    </div>
	<div class="control-group">
	    <label class="control-label"><@spring.message "brand.description"/></label>
	    <div class="controls">
	      <textarea name="description" id="description" style="width:650px;height:700px;"></textarea>
	    </div>
    </div>
    <div class="control-group">
	    <div class="controls">
	      <button type="submit" class="btn primary"><@spring.message "button.add"/></button>
	    </div>
    </div>
</form>