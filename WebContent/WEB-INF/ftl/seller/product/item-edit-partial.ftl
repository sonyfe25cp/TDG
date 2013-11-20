<link href="/css/seller/item-add.css" rel="stylesheet">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css">
<script type="text/javascript" src="/js/jquery-ui-1.10.3.custom.min.js"></script>
<script type="text/javascript" src="/js/jquery.uploadify.min.js"></script>
<script type="text/javascript" src="/js/seller/item-edit.js"></script>
<div>
	<form class="form-horizontal" method="post" action="/seller/addproduct">
		<legend><@spring.message "seller.product.show.meta"/></legend>
		<div class="control-group">
			<label class="control-label"><@spring.message "item.model.sku"/></label>
			<div class="controls">
		    	<input type="text"name="sku" id="sku" value="${item.sku}">
		    	<input type="hidden"name="itemId" id="itemId" value="${item.id}">
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
		<div id="featureJson" class="hidden">
			{${item.featureJson}}
		</div>
		<div class="parameter">
			<div class="hidden" id="color">
				<div class="control-group">	
					<label class="control-label"><@spring.message "seller.item.add.onlyColor"/></label>
					<div class="controls">
						<input type="text" name="color" autocomplete="on">
					</div>
				</div>
			</div>
			<div class="hidden" id="size">
				<div class="control-group">
					<label class="control-label"><@spring.message "seller.item.add.onlySize"/></label>
					<div class="controls">
						<input type="text" name="size" autocomplete="on">
					</div>
				</div>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label"><@spring.message "product.model.mainimage"/></label>
		    <div class="controls">
		    	<input type="file" name="mainimage" id="mainImg">
		    	<div id='images_product_main'>
		    		<img id="mainimage" style="width:160px;height:160px;" src="${item.image}"/><a class='btn'>delete</a>
		    	</div>
		    </div>
		</div>
		<div id="prices">
			<legend><@spring.message "seller.product.add.productprices"/></legend>
			<div class="control-group">
				<label class="control-label"><@spring.message "product.model.retailPrice"/></label>
				<div class="controls">
			    	<input type="text" name="retailPrice" value="${item.retailPrice}">
			    	<input type="hidden" name="productId" value="${item.id}">
			    </div>
			</div>
			<div class="control-group">
				<label class="control-label"><@spring.message "product.model.availableQuantity"/></label>
				<div class="controls">
			    	<input type="text" name="availableQuantity" value="${item.availableQuantity}">
			    </div>
			</div>
			<div class="control-group">
				<label class="control-label"><@spring.message "product.model.promotionPrice"/></label>
				<div class="controls">
			    	<input type="text" name="promotionPrice" value="${item.promotionPrice}">
			    </div>
			</div>
			<div class="control-group">
				<label class="control-label"><@spring.message "product.model.promotionTime"/></label>
				<div class="controls">
					<#if item.promotionTime?? && item.promotionEnd??>
						<input id="promotionTime" type="text"  name="promotionTime" autocomplete="on" class="input-medium uneditable-input" value="${item.promotionTime?date}">--
			    		<input id="promotionTime2" type="text" name="promotionEnd" autocomplete="on" class=" input-medium uneditable-input" value="${item.promotionEnd?date}">
			    	<#else>
			    		<input id="promotionTime" type="text"  name="promotionTime" autocomplete="on" class="input-medium uneditable-input">--
			    		<input id="promotionTime2" type="text" name="promotionEnd" autocomplete="on" class=" input-medium uneditable-input">
					</#if>
			    	<span class="help-inline">Time Format: 2013-09-22</span>
			    </div>
			</div>
			<div class="control-group">
				<label class="control-label"><@spring.message "product.model.wholePrice"/></label>
				<div class="controls">
			    	<input type="text" name="wholePrice" value="${item.wholePrice}">
			    </div>
			</div>
			<div class="control-group">
				<label class="control-label"><@spring.message "product.model.minimumQuantity"/></label>
				<div class="controls">
			    	<input type="text" name="minimumQuantity" value="${item.minimumQuantity}">
			    </div>
			</div>
			<div class="control-group">
				<label class="control-label"><@spring.message "product.model.maximumAcceptQuantity"/></label>
				<div class="controls">
			    	<input type="text" name="maximumAcceptQuantity" value="${item.maximumAcceptQuantity}">
			    </div>
			</div>
			<div class="control-group">
				<label class="control-label"><@spring.message "product.model.safeStock"/></label>
				<div class="controls">
			    	<input type="text"name="safeStock" value="${item.safeStock}">
			    </div>
			</div>
		</div>
		<div class="control-group">
			<div class="controls">
		    	<a class="btn btn-primary" id="over"><@spring.message "button.update"/></a>
		    </div>
		</div>
	</form>
</div>