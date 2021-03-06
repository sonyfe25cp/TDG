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
				<form class="" action="/seller/shopsetting/create">
				<legend>Store Settings</legend>
					<div class="control-group">
						<label class="control-label"><@spring.message "shopsetting.model.shippingCountry"/></label>
						<div class="controls">
					    	<select name="shippingCountry">
					    		<#list countries as country>
					    			<option value="${country.id}">${country.name}</option>
					    		</#list>
					    	</select>
					    </div>
					    <span>Please note: You normally would not be allowed to change Ship-From-Country once it's set up.
This Ship-From-Country applies to all of products that you'll list on our marketplace.</span>
					</div>
					<div class="control-group">
						<label class="control-label"><@spring.message "shopsetting.model.backAddress"/></label>
						<div class="controls">
							<input name="backAddress" type="text">
					    </div>
					</div>
					<div class="control-group">
						<label class="control-label"><@spring.message "shopsetting.model.useSystemStoreAddress"/></label>
						<div class="controls">
							<input type="radio" name="useSystemStoreAddress" value="1">
								<@spring.message "shopsetting.model.useSystemStoreAddress.yes"/>
							</input>
							<input type="radio" name="useSystemStoreAddress" value="0" checked=true>
								<@spring.message "shopsetting.model.useSystemStoreAddress.no"/>
							</input>
					    </div>
					</div>
					<div class="control-group">
						<label class="control-label"><@spring.message "shopsetting.model.shippingPromiseDays"/></label>
						<div class="controls">
					    	<select name="shippingPromiseDays">
					    		<option value="3" checked=true>3</option>
					    	</select>
					    	<span class="help-inline">Please note: You are required to ship products out within 3 days after you receive customer order.</span>
					    </div>
					</div>
					<div class="control-group">
						<label class="control-label"><@spring.message "shopsetting.model.defaultCoinage"/></label>
						<div class="controls">
					    	<select name="defaultCoinage">
					    		<option value="1" checked=true>Dollar</option>
					    		<!--
					    		<option value="2">Pound</option>
					    		<option value="3">EURO</option>
					    		<option value="4">日元</option>
					    		<option value="5">RMB</option>
					    		-->
					    	</select>
					    	<span class="help-inline">Please note: USD is only default currency that you can select for your listing price for the time being.
We're going to offer more default currency options in the future.</span>
					    </div>
					</div>
					<div class="control-group">
						<label class="control-label">Store Friend Name</label>
						<div class="controls">
					    	<input name="title"></input>
					    </div>
					</div>
					<div class="control-group">
						<label class="control-label"><@spring.message "shopsetting.model.description"/></label>
						<div class="controls">
					    	<input id="description" name="description"></input>
					    </div>
					</div>
					<legend>The Bank Information for receiving your sales revenue</legend>
					    <span>Please make sure you provide correct Bank information here so that we can transfer your revenue to your account on time and correctly.</span>
					<div class="control-group">
						<label class="control-label"><@spring.message "shopsetting.model.bankName"/></label>
						<div class="controls">
					    	<input id="description" name="bankName"></input>
					    </div>
					</div>
					<div class="control-group">
						<label class="control-label"><@spring.message "shopsetting.model.bankCity"/></label>
						<div class="controls">
					    	<input id="description" name="bankCity"></input>
					    </div>
					</div><div class="control-group">
						<label class="control-label"><@spring.message "shopsetting.model.bankAddress"/></label>
						<div class="controls">
					    	<input id="description" name="bankAddress"></input>
					    </div>
					</div>
					<div class="control-group">
						<label class="control-label"><@spring.message "shopsetting.model.swiftCode"/></label>
						<div class="controls">
					    	<input id="description" name="swiftCode"></input>
					    </div>
					</div>
					<div class="control-group">
						<label class="control-label"><@spring.message "shopsetting.model.accountName"/></label>
						<div class="controls">
					    	<input id="description" name="accountName"></input>
					    </div>
					</div>
					<div class="control-group">
						<label class="control-label"><@spring.message "shopsetting.model.accountNumber"/></label>
						<div class="controls">
					    	<input id="description" name="accountNumber"></input>
					    </div>
					</div>
					<div class="control-group">
						<div class="controls">
					    	<button class="btn" type="submit" ><@spring.message "button.add"/></button>
					    </div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<#include "/seller/common/template-bottom.ftl">
</div>