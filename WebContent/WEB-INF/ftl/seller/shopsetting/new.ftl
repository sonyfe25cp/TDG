<#include "/seller/common/template-head.ftl">
<#include "/seller/common/top-banner.ftl">
<div class="container">
	<div class="container-fluid">
		<div class="row-fluid">
		    <div class="span3">
				<#include "/seller/common/left-nav.ftl">
			</div>
			<div class="span9">
				<form class="" action="/seller/shopsetting/create">
					<div class="control-group">
						<label class="control-label"><@spring.message "seller.shopsetting.model.shippingCountry"/></label>
						<div class="controls">
					    	<input name="shippingCountry"/>
					    </div>
					</div>
					<div class="control-group">
						<label class="control-label"><@spring.message "seller.shopsetting.model.shippingPromiseDays"/></label>
						<div class="controls">
					    	<select name="shippingPromiseDays">
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
						<label class="control-label"><@spring.message "seller.shopsetting.model.description"/></label>
						<div class="controls">
					    	<input name="description"></input>
					    </div>
					</div>
					<div class="control-group">
						<label class="control-label"><@spring.message "seller.shopsetting.model.defaultCoinage"/></label>
						<div class="controls">
					    	<select name="defaultCoinage">
					    		<option value="1">Dollar<option>
					    		<option value="2">Pound<option>
					    		<option value="3">EURO<option>
					    		<option value="4">日元<option>
					    		<option value="5">RMB<option>
					    	</select>
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