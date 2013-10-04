<#include "/seller/common/template-head.ftl">
<#include "/seller/common/top-banner.ftl">
<script charset="utf-8" src="/js/omartech.check.input.js"></script>
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
				<form class="form-horizontal" action="/seller/shopsetting/update" method="post">
					<input name="id" type="hidden" value="${shopsetting.id}"/>
					<!-- 
						<div class="control-group">
							<label class="control-label"><@spring.message "shopsetting.model.shippingCountry"/></label>
							<div class="controls">
						    	<select name="shippingCountry">
						    		<#list countries as country>
						    			<#if country.id == shopsetting.shippingCountry>
						    				<option value="${country.id}"  selected="selected">${country.name}</option>
						    			<#else>
							    			<option value="${country.id}">${country.name}</option>
						    			</#if>
						    		</#list>
						    	</select>
						    </div>
						</div>
					-->
					<div class="control-group">
						<label class="control-label"><@spring.message "shopsetting.model.shippingPromiseDays"/></label>
						<div class="controls">
					    	<select name="shippingPromiseDays" value="shopsetting.shippingPromiseDays">
					    		<option value="1">1</option>
					    		<option value="3">3</option>
					    		<option value="5">5</option>
					    		<option value="7">7</option>
					    	</select>
					    </div>
					</div>
					<!--
					<div class="control-group">
						<label class="control-label"><@spring.message "shopsetting.model.defaultCoinage"/></label>
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
					-->
					<div class="control-group">
						<label class="control-label"><@spring.message "shopsetting.model.title"/></label>
						<div class="controls">
					    	<input type="text" name="title" value="${shopsetting.title}" access="text"></input>
					    </div>
					</div>
					<div class="control-group">
						<label class="control-label"><@spring.message "shopsetting.model.description"/></label>
						<div class="controls">
					    	<textarea id="description" name="description" class="field span9" rows="6">${shopsetting.description}</textarea>
					    </div>
					</div>
					<div class="control-group">
						<label class="control-label"><@spring.message "shopsetting.model.bankName"/></label>
						<div class="controls">
					    	<input type="text" name="bankName" value="${shopsetting.bankName}" access="text"></input>
					    </div>
					</div>
					<div class="control-group">
						<label class="control-label"><@spring.message "shopsetting.model.bankAddress"/></label>
						<div class="controls">
					    	<input type="text" name="bankAddress" value="${shopsetting.bankAddress}" access="text"></input>
					    </div>
					</div>
					<div class="control-group">
						<label class="control-label"><@spring.message "shopsetting.model.bankCity"/></label>
						<div class="controls">
					    	<input type="text" name="bankCity" value="${shopsetting.bankCity}" access="text"></input>
					    </div>
					</div>
					<div class="control-group">
						<label class="control-label"><@spring.message "shopsetting.model.swiftCode"/></label>
						<div class="controls">
					    	<input type="text" name="swiftCode" value="${shopsetting.swiftCode}" access="text"></input>
					    </div>
					</div>
					<div class="control-group">
						<label class="control-label"><@spring.message "shopsetting.model.accountName"/></label>
						<div class="controls">
					    	<input type="text" name="accountName" value="${shopsetting.accountName}" access="text"></input>
					    </div>
					</div>
					<div class="control-group">
						<label class="control-label"><@spring.message "shopsetting.model.accountNumber"/></label>
						<div class="controls">
					    	<input type="text" name="accountNumber" value="${shopsetting.accountNumber}" access="text"></input>
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