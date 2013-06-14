<script charset="utf-8" src="/js/kindeditor-4.1.7/kindeditor.js"></script>
<script>
        KindEditor.ready(function(K) {
                window.editor = K.create('#editor_id',{
               		uploadJson : '/fileupload?path=brand',
                });
        });
</script>

<legend><@spring.message "seller.brand.add.title"/></legend>
<form class="form-horizontal" action="/seller/editbrand">
	<input type="hidden" name="id" value="${brand.id}">
	<div class="control-group">
	    <label class="control-label"><@spring.message "seller.brand.name"/></label>
	    <div class="controls">
	      <input type="text" name="name" value="${brand.name}">
	    </div>
    </div>
	<div class="control-group">
	    <label class="control-label"><@spring.message "seller.brand.description"/></label>
	    <div class="controls">
	      <textarea name="description" id="editor_id" style="width:650px;height:700px;">${brand.description}</textarea>
	    </div>
    </div>
    <div class="control-group">
	    <div class="controls">
	      <button type="submit" class="btn primary"><@spring.message "button.update"/></button>
	    </div>
    </div>
</form>