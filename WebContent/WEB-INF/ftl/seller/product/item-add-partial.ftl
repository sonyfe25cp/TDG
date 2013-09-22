<script type="text/javascript" src="/js/jquery.uploadify.min.js"></script>
<script type="text/javascript" src="/js/seller/item-add.js"></script>
 <link href="/css/seller/item-add.css" rel="stylesheet">
<div>
	<form class="form-horizontal" method="post" action="/seller/addproduct">
		<legend><@spring.message "seller.product.show.meta"/></legend>
		<div class="control-group">
			<label class="control-label"><@spring.message "item.model.sku"/></label>
			<div class="controls">
		    	<input type="text" placeholder="sku" name="sku" id="sku">
		    </div>
		</div>
		<div class="control-group">
			<label class="control-label"><@spring.message "seller.item.add.parameter"/></label>
			<div class="controls">
				<input type="radio" name="parameterType" value="color"><@spring.message "seller.item.add.onlyColor"/>
				<input type="radio" name="parameterType" value="size"><@spring.message "seller.item.add.onlySize"/>
				<input type="radio" name="parameterType" value="colorandsize"><@spring.message "seller.item.add.colorAndSize"/>
		    </div>
		</div>
		<div class="parameter">
			<div class="hidden">
				<span id="parameter">{
					
				}</span>
			</div>
			<div class="hidden" id="color">
				<div class="control-group">	
					<label class="control-label"><@spring.message "seller.item.add.onlyColor"/></label>
					<div class="controls">
						<input type="text" placeholder="retailPrice" name="color" autocomplete="on">
					</div>
				</div>
			</div>
			<div class="hidden" id="size">
				<div class="control-group">
					<label class="control-label"><@spring.message "seller.item.add.onlySize"/></label>
					<div class="controls">
						<input type="text" placeholder="retailPrice" name="size" autocomplete="on">
					</div>
				</div>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label"><@spring.message "product.model.mainimage"/></label>
			<div class="controls">
		    	<input type="file" name="mainimage" id="mainImg">
		    </div>
		</div>
		<div id="prices">
			<legend><@spring.message "seller.product.add.productprices"/></legend>
			<div class="control-group">
				<label class="control-label"><@spring.message "product.model.retailPrice"/></label>
				<div class="controls">
			    	<input type="text" placeholder="retailPrice" name="retailPrice" value="${product.retailPrice}">
			    	<input type="hidden" name="productId" value="${product.id}">
			    </div>
			</div>
			<div class="control-group">
				<label class="control-label"><@spring.message "product.model.availableQuantity"/></label>
				<div class="controls">
			    	<input type="text" placeholder="availableQuantity" name="availableQuantity" value="${product.availableQuantity}">
			    </div>
			</div>
			<div class="control-group">
				<label class="control-label"><@spring.message "product.model.promotionPrice"/></label>
				<div class="controls">
			    	<input type="text" placeholder="promotionPrice" name="promotionPrice" value="${product.promotionPrice}">
			    </div>
			</div>
			<div class="control-group">
				<label class="control-label"><@spring.message "product.model.promotionTime"/></label>
				<div class="controls">
			    	<input type="text" name="promotionTime" value="">--
			    	<input type="text" name="promotionEnd" value="">
			    	<span class="help-inline">Time Format: 2013-09-22</span>
			    </div>
			</div>
			<div class="control-group">
				<label class="control-label"><@spring.message "product.model.wholePrice"/></label>
				<div class="controls">
			    	<input type="text" placeholder="wholePrice" name="wholePrice" value="${product.wholePrice}">
			    </div>
			</div>
			<div class="control-group">
				<label class="control-label"><@spring.message "product.model.minimumQuantity"/></label>
				<div class="controls">
			    	<input type="text" placeholder="minimumQuantity" name="minimumQuantity" value="${product.minimumQuantity}">
			    </div>
			</div>
			<div class="control-group">
				<label class="control-label"><@spring.message "product.model.maximumAcceptQuantity"/></label>
				<div class="controls">
			    	<input type="text" placeholder="maximumAcceptQuantity" name="maximumAcceptQuantity" value="${product.maximumAcceptQuantity}">
			    </div>
			</div>
			<div class="control-group">
				<label class="control-label"><@spring.message "product.model.safeStock"/></label>
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