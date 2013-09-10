<script charset="utf-8" src="/js/kindeditor-4.1.7/kindeditor.js"></script>
<script>
        KindEditor.ready(function(K) {
                window.editor = K.create('#editor_id',{
               		uploadJson : '/fileupload?path=brand',
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
	      <textarea name="description" id="editor_id" style="width:650px;height:700px;"></textarea>
	    </div>
    </div>
    <div class="control-group">
	    <div class="controls">
	      <button type="submit" class="btn primary"><@spring.message "button.add"/></button>
	    </div>
    </div>
</form>