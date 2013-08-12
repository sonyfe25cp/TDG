<#include "/seller/common/template-head.ftl">
<#include "/seller/common/top-banner.ftl">
<script charset="utf-8" src="/js/kindeditor-4.1.7/kindeditor.js"></script>
<script charset="utf-8" src="/js/kindeditor-4.1.7/lang/zh_CN.js"></script>
<script type="text/javascript">
	 KindEditor.ready(function(K) {
         editor = K.create('#description',{
         	uploadJson : '/seller/upload/image',
         	filePostName : 'image',
         });
	});
</script>
<div class="container">
	<div class="container-fluid">
		<div class="row-fluid">
		    <div class="span3">
				<#include "/seller/common/left-nav.ftl">
			</div>
			<div class="span9">
				<form class="form-horizontal" action="/seller/shopsetting/update">
					<div class="control-group">
						<label class="control-label"><@spring.message "seller.shopsetting.model.shippingCountry"/></label>
						<div class="controls">
							<input name="id" type="hidden" value="${shopsetting.id}"/>
					    	<input name="shippingCountry" value="${shopsetting.shippingCountry}"/>
					    </div>
					</div>
					<div class="control-group">
						<label class="control-label"><@spring.message "seller.shopsetting.model.shippingPromiseDays"/></label>
						<div class="controls">
					    	<select name="shippingPromiseDays" value="shopsetting.shippingPromiseDays">
					    		<option value="1">1</option>
					    		<option value="3">3</option>
					    		<option value="5">5</option>
					    		<option value="7">7</option>
					    		<option value="10">10</option>
					    		<option value="15">15</option>
					    		<option value="20">20</option>
					    		<option value="30">30</option>
					    	</select>
					    </div>
					</div>
					<div class="control-group">
						<label class="control-label"><@spring.message "seller.shopsetting.model.defaultCoinage"/></label>
						<div class="controls">
					    	<select name="defaultCoinage" value="${shopsetting.defaultCoinage}">
						    		<option value="1">Dollar<option>
						    		<option value="2">Pound<option>
						    		<option value="3">EURO<option>
						    		<option value="4">JPY<option>
						    		<option value="5">RMB<option>
						    	</select>
					    </div>
					</div>
					<div class="control-group">
						<label class="control-la0bel"><@spring.message "seller.shopsetting.model.title"/></label>
						<div class="controls">
					    	<input type="text" name="title" value="${shopsetting.title}"></input>
					    </div>
					</div>
					<div class="control-group">
						<label class="control-label"><@spring.message "seller.shopsetting.model.description"/></label>
						<div class="controls">
					    	<textarea id="description" name="description" class="field span9" rows="6">${shopsetting.description}</textarea>
					    </div>
					</div>
					<div class="control-group">
						<label class="control-label"><@spring.message "seller.shopsetting.model.information"/></label>
						<div class="controls">
					    	<textarea name="information" class="field span9" rows="3">${shopsetting.information}</textarea>
					    </div>
					</div>
					<div class="control-group">
						<div class="controls">
					    	<button class="btn" type="submit" ><@spring.message "button.update"/></button>
					    </div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<#include "/seller/common/template-bottom.ftl">
</div>