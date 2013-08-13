<script type="text/javascript" src="/js/seller/item-add.js"></script>
 <link href="/css/seller/item-add.css" rel="stylesheet">
<div>
	<form class="form-horizontal" method="post" action="/seller/addproduct">
		<div id ="params">
			<#if saleProperty.subProperties??>
				<legend>Params</legend>
				<#list saleProperty.subProperties as property>
					<div class="control-group">
						<label class="control-label">${property.pname}</label>
						<div class="controls">
							<#if property.salePropertyValues??>
								<select name="${property.pid}">
									<option></option>
									<#list property.salePropertyValues as salePropertyValue>
										<option value="${salePropertyValue.vid}">${salePropertyValue.name}</option>
									</#list>
								</select>
							</select>
							</#if>
					    </div>
					</div>
				</#list>
				<div class="control-group">
					<label class="control-label"><@spring.message "seller.item.model.sku"/></label>
					<div class="controls">
				    	<input type="text" placeholder="sku" name="sku">
				    </div>
				</div>
				<div class="control-group">
					<label class="control-label"><@spring.message "seller.product.model.retailPrice"/></label>
					<div class="controls">
				    	<input type="text" placeholder="retailPrice" name="retailPrice" value="${product.retailPrice}">
				    	<input type="hidden" name="productId" value="${product.id}">
				    </div>
				</div>
				<div class="control-group">
					<label class="control-label"><@spring.message "seller.product.model.availableQuantity"/></label>
					<div class="controls">
				    	<input type="text" placeholder="availableQuantity" name="availableQuantity" value="${product.availableQuantity}">
				    </div>
				</div>
			</#if>
		</div>
		<div id="prices">
			<legend><@spring.message "seller.product.add.productprices"/></legend>
			<div class="control-group">
				<label class="control-label"><@spring.message "seller.product.model.promotionPrice"/></label>
				<div class="controls">
			    	<input type="text" placeholder="promotionPrice" name="promotionPrice" value="${product.promotionPrice}">
			    </div>
			</div>
			<div class="control-group">
				<label class="control-label"><@spring.message "seller.product.model.promotionTime"/></label>
				<div class="controls">
			    	<input type="text" name="promotionTime" value="<#if product.promotionTime??>${product.promotionTime}</#if>">
			    	<span class="help-inline">Time Format: 2013-09-22</span>
			    </div>
			</div>
			<div class="control-group">
				<label class="control-label"><@spring.message "seller.product.model.wholePrice"/></label>
				<div class="controls">
			    	<input type="text" placeholder="wholePrice" name="wholePrice" value="${product.wholePrice}">
			    </div>
			</div>
			<div class="control-group">
				<label class="control-label"><@spring.message "seller.product.model.minimumQuantity"/></label>
				<div class="controls">
			    	<input type="text" placeholder="minimumQuantity" name="minimumQuantity" value="${product.minimumQuantity}">
			    </div>
			</div>
			<div class="control-group">
				<label class="control-label"><@spring.message "seller.product.model.maximumAcceptQuantity"/></label>
				<div class="controls">
			    	<input type="text" placeholder="maximumAcceptQuantity" name="maximumAcceptQuantity" value="${product.maximumAcceptQuantity}">
			    </div>
			</div>
			<div class="control-group">
				<label class="control-label"><@spring.message "seller.product.model.safeStock"/></label>
				<div class="controls">
			    	<input type="text" placeholder="safeStock" name="safeStock" value="${product.safeStock}">
			    </div>
			</div>
		</div>
		<div class="control-group">
			<div class="controls">
		    	<a class="btn btn-primary" id="over"><@spring.message "button.add"/></a>
		    </div>
		</div>
		
	</form>
</div>