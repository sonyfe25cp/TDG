<div>
	<form class="form-horizontal" method="post" action="/seller/addproduct">
		<legend><@spring.message "seller.product.add.productdesc"/></legend>
		<div class="control-group">
			<label class="control-label"><@spring.message "seller.product.model.name"/></label>
			<div class="controls">
		    	<input type="text" placeholder="Name" name="name">
		    </div>
		</div>
		<div class="control-group">
			<label class="control-label"><@spring.message "seller.product.model.mainimage"/></label>
			<div class="controls">
		    	<input type="file" name="mainimage">
		    </div>
		</div>
		<div class="control-group">
			<label class="control-label"><@spring.message "seller.product.model.subimages"/></label>
			<div class="controls">
		    	<input type="file" name="subimages">
		    	<input type="file" name="subimages">
		    	<input type="file" name="subimages">
		    	<input type="file" name="subimages">
		    	<input type="file" name="subimages">
		    	<input type="file" name="subimages">
		    </div>
		</div>
		<legend><@spring.message "seller.product.add.productprices"/></legend>
		<div class="control-group">
			<label class="control-label"><@spring.message "seller.product.model.retailPrice"/></label>
			<div class="controls">
				<span class="add-on">$</span>
		    	<input type="text" placeholder="retailPrice" name="retailPrice">
		    </div>
		</div>
		<div class="control-group">
			<label class="control-label"><@spring.message "seller.product.model.promotionPrice"/></label>
			<div class="controls">
		    	<input type="text" placeholder="promotionPrice" name="promotionPrice">
		    </div>
		</div>
		<div class="control-group">
			<label class="control-label"><@spring.message "seller.product.model.promotionTime"/></label>
			<div class="controls">
		    	<input type="text" placeholder="promotionTime" name="promotionTime">
		    </div>
		</div>
		<div class="control-group">
			<label class="control-label"><@spring.message "seller.product.model.wholePrice"/></label>
			<div class="controls">
		    	<input type="text" placeholder="wholePrice" name="wholePrice">
		    </div>
		</div>
		<div class="control-group">
			<label class="control-label"><@spring.message "seller.product.model.minimumQuantity"/></label>
			<div class="controls">
		    	<input type="text" placeholder="minimumQuantity" name="minimumQuantity">
		    </div>
		</div>
		<div class="control-group">
			<label class="control-label"><@spring.message "seller.product.model.maximumAcceptQuantity"/></label>
			<div class="controls">
		    	<input type="text" placeholder="maximumAcceptQuantity" name="maximumAcceptQuantity">
		    </div>
		</div>
		<div class="control-group">
			<label class="control-label"><@spring.message "seller.product.model.availableQuantity"/></label>
			<div class="controls">
		    	<input type="text" placeholder="availableQuantity" name="availableQuantity">
		    </div>
		</div>
		<div class="control-group">
			<label class="control-label"><@spring.message "seller.product.model.safeStock"/></label>
			<div class="controls">
		    	<input type="text" placeholder="safeStock" name="safeStock">
		    </div>
		</div>
		<div class="control-group">
			<label class="control-label"><@spring.message "seller.product.model.active"/></label>
			<div class="controls">
		    	<input type="text" placeholder="active" name="active">
		    </div>
		</div>
		<legend><@spring.message "seller.product.add.productship"/></legend>
		<div class="control-group">
			<label class="control-label"><@spring.message "seller.product.model.shippingCountry"/></label>
			<div class="controls">
		    	<input type="text" placeholder="shippingCountry" name="shippingCountry">
		    </div>
		</div>
		<div class="control-group">
			<label class="control-label"><@spring.message "seller.product.model.shippingPromiseDays"/></label>
			<div class="controls">
		    	<input type="text" placeholder="shippingPromiseDays" name="shippingPromiseDays">
		    </div>
		</div>
		<div class="control-group">
			<div class="controls">
				<button class="btn btn-large btn-primary" type="submit"><@spring.message "seller.product.add.submit"/></button>
		    </div>
		</div>
		
	</form>
</div>