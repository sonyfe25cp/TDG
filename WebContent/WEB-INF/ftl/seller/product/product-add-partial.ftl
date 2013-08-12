<script type="text/javascript" src="/js/jquery.uploadify.min.js"></script>
<script charset="utf-8" src="/js/kindeditor-4.1.7/kindeditor.js"></script>
<script charset="utf-8" src="/js/kindeditor-4.1.7/lang/zh_CN.js"></script>
<script type="text/javascript" src="/js/seller/product-add.js"></script>
<div>
	<form class="form-horizontal" method="post" action="/seller/product/addproduct">
		<legend><@spring.message "seller.product.add.productdesc"/></legend>
		<div class="control-group">
			<label class="control-label"><@spring.message "seller.product.model.name"/></label>
			<div class="controls">
		    	<input type="text" placeholder="Name" name="name" id="name" access="text">
		    	<input type="hidden" value="${categoryId}" name="categoryId" id="categoryId">
		    </div>
		</div>
		<#if hasSkuItem == 0>
			<div class="control-group">
				<label class="control-label"><@spring.message "seller.item.model.sku"/></label>
				<div class="controls">
			    	<input type="text" placeholder="SKU" name="sku" id="sku" access="int">
			    </div>
			</div>
		<#else>
			<input type="hidden" name="sku" id="sku" value="0">
		</#if>
		<div class="control-group">
			<label class="control-label"><@spring.message "seller.product.model.mainimage"/></label>
			<div class="controls">
		    	<input type="file" name="mainimage" id="mainImg">
		    </div>
		</div>
		<div class="control-group">
			<label class="control-label"><@spring.message "seller.product.model.subimages"/></label>
			<div class="controls">
		    	<input type="file" name="subimages" id="subImgs">
		    	<table class="table">
		    		<tr id="subimages_tr"></tr>
		    	</table>
		    </div>
		</div>
		<legend><@spring.message "seller.product.add.productprices"/></legend>
		<div id="prices">
			<div class="control-group">
				<label class="control-label"><@spring.message "seller.product.model.retailPrice"/></label>
				<div class="controls">
			    	<input type="text" placeholder="retailPrice" name="retailPrice" access="float">
			    </div>
			</div>
			<div class="control-group">
				<label class="control-label"><@spring.message "seller.product.model.promotionPrice"/></label>
				<div class="controls">
			    	<input type="text" placeholder="promotionPrice" name="promotionPrice" access="float">
			    </div>
			</div>
			<div class="control-group">
				<label class="control-label"><@spring.message "seller.product.model.promotionTime"/></label>
				<div class="controls">
			    	<input type="text" placeholder="promotionTime" name="promotionTime">
			    	<span class="help-inline">Time Format: 2013-09-22</span>
			    </div>
			</div>
			<div class="control-group">
				<label class="control-label"><@spring.message "seller.product.model.wholePrice"/></label>
				<div class="controls">
			    	<input type="text" placeholder="wholePrice" name="wholePrice" access="float">
			    </div>
			</div>
			<div class="control-group">
				<label class="control-label"><@spring.message "seller.product.model.minimumQuantity"/></label>
				<div class="controls">
			    	<input type="text" placeholder="minimumQuantity" name="minimumQuantity" access="int">
			    </div>
			</div>
			<div class="control-group">
				<label class="control-label"><@spring.message "seller.product.model.maximumAcceptQuantity"/></label>
				<div class="controls">
			    	<input type="text" placeholder="maximumAcceptQuantity" name="maximumAcceptQuantity" access="int">
			    </div>
			</div>
			<div class="control-group">
				<label class="control-label"><@spring.message "seller.product.model.availableQuantity"/></label>
				<div class="controls">
			    	<input type="text" placeholder="availableQuantity" name="availableQuantity" access="int">
			    </div>
			</div>
			<div class="control-group">
				<label class="control-label"><@spring.message "seller.product.model.safeStock"/></label>
				<div class="controls">
			    	<input type="text" placeholder="safeStock" name="safeStock" access="int">
			    </div>
			</div>
		</div>
		<legend><@spring.message "seller.product.show.params"/></legend>
		<div id="params">
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
							<input type="text" placeholder="${property.pname}" name="${property.pid}" access="text">
						</#if>
				    </div>
				</div>
			</#list>
		</div>
		<legend><@spring.message "seller.product.add.productdescription"/></legend>
		<div id="others">
			<div class="control-group">
				<label class="control-label"><@spring.message "seller.product.model.netWeight"/></label>
				<div class="controls">
					<input type="text" placeholder="netWeight" name="netWeight" access="text">
			    </div>
			</div>
			<div class="control-group">
				<label class="control-label"><@spring.message "seller.product.model.grossWeight"/></label>
				<div class="controls">
					<input type="text" placeholder="grossWeight" name="grossWeight" access="text">
			    </div>
			</div>
			<div class="control-group">
				<label class="control-label"><@spring.message "seller.product.model.sizeWithPackage"/></label>
				<div class="controls">
					<input type="text" placeholder="sizeWithPackage" name="sizeWithPackage" access="text">
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
			    	<textarea id="description" rows="20" name="description" class="field span12" placeholder="input some description about this product"></textarea>
			    </div>
			</div>
		</div>
		<legend></legend>
		<div class="control-group">
			<div class="controls">
		    	<a class="btn btn-primary" id="over_without_item"><@spring.message "button.product.add"/></a>
		    	<#if hasSkuItem == 1>
			    	<a class="btn btn-info" id="over_with_item"><@spring.message "button.product.addsub"/></a>
		    	</#if>
		    </div>
		</div>
		
	</form>
</div>