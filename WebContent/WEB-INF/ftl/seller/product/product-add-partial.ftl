<div>
	<form class="form-horizontal" method="post" action="/seller/product/addproduct" enctype="multipart/form-data">
		<legend><@spring.message "seller.product.add.productdesc"/></legend>
		<div class="control-group">
			<label class="control-label"><@spring.message "seller.product.model.name"/></label>
			<div class="controls">
		    	<input type="text" placeholder="Name" name="name">
		    	<input type="hidden" value="${categoryId}" name="categoryId">
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
		<!--
		<div class="control-group">
			<label class="control-label"><@spring.message "seller.product.model.active"/></label>
			<div class="controls">
		    	<input type="text" placeholder="active" name="active">
		    </div>
		</div>
		-->
		<legend>Params</legend>
		<#list itemProperties.subProperties as property>
			
			<div class="control-group">
				<label class="control-label">${property.pname}</label>
				<div class="controls">
					<#if property.baseFeatures??>
						<select name="${property.pid}">
							<option></option>
							<#list property.baseFeatures as baseFeature>
								<option value="${baseFeature.id}">${baseFeature.name}</option>
							</#list>
						</select>
					<#else>
						<input type="text" placeholder="${property.pname}" name="netWeight">
					</#if>
			    </div>
			</div>
		</#list>
		
		<legend><@spring.message "seller.product.add.productdescription"/></legend>
		<div class="control-group">
			<label class="control-label"><@spring.message "seller.product.model.netWeight"/></label>
			<div class="controls">
				<input type="text" placeholder="netWeight" name="netWeight">
		    </div>
		</div>
		<div class="control-group">
			<label class="control-label"><@spring.message "seller.product.model.grossWeight"/></label>
			<div class="controls">
				<input type="text" placeholder="grossWeight" name="grossWeight">
		    </div>
		</div>
		<div class="control-group">
			<label class="control-label"><@spring.message "seller.product.model.sizeWithPackage"/></label>
			<div class="controls">
				<input type="text" placeholder="sizeWithPackage" name="sizeWithPackage">
		    </div>
		</div>
		<div class="control-group">
			<label class="control-label"><@spring.message "seller.product.model.brandId"/></label>
			<div class="controls">
				<select name="brandId">
						<option></option>
					<#list brands as brand>
						<option value="${brand.id}">${brand.name}</option>
					</#list>
				</select>
		    </div>
		</div>
		<div class="control-group">
			<label class="control-label"><@spring.message "seller.product.model.description"/></label>
			<div class="controls">
		    	<!-- <input type="text" placeholder="description" name="description"> -->
		    	<textarea rows="20" name="description" class="field span12" placeholder="input some description about this product"></textarea>
		    </div>
		</div>
		<legend></legend>
		<div class="control-group">
			<div class="controls">
		    	<button type="submit" class="btn btn-primary"><@spring.message "button.product.add"/></button>
		    	<button type="submit" class="btn btn-info"><@spring.message "button.product.addsub"/></button>
		    	<a class="btn btn-warning" href="/seller/product/productadd?cid=${categoryId}"><@spring.message "button.product.addnext"/></a>
		    </div>
		</div>
		
	</form>
</div>