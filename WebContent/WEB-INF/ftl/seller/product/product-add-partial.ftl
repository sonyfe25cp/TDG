<script type="text/javascript" src="/js/jquery-ui-1.10.3.custom.min.js"></script>
<script type="text/javascript" src="/js/jquery.uploadify.min.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css">
<script charset="utf-8" src="/js/kindeditor-4.1.7/kindeditor.js"></script>
<script charset="utf-8" src="/js/kindeditor-4.1.7/lang/zh_CN.js"></script>
<script type="text/javascript" src="/js/seller/product-add.js"></script>
<div>
	<form class="form-horizontal" method="post" action="/seller/product/addproduct">
		<legend><@spring.message "seller.product.add.productdesc"/></legend>
		<div class="control-group">
			<label class="control-label"><@spring.message "product.model.name"/></label>
			<div class="controls">
		    	<input type="text" placeholder="Name" name="name" id="name" access="text">
		    	<input type="hidden" value="${categoryId}" name="categoryId" id="categoryId">
		    	<#if nodeId??>
		    		<input type="hidden" value="${nodeId}" name="nodeId" id="nodeId">
		    	</#if>
		    	<input type="hidden" value="${productLine}" name="productLine" id="productLine">
		    </div>
		</div>
		<div class="control-group">
			<label class="control-label"><@spring.message "product.model.mainimage"/></label>
			<div class="controls">
		    	<input type="file" name="mainimage" id="mainImg">
		    	<div id='images_product_main'></div>
		    </div>
		</div>
		<div class="control-group">
			<label class="control-label"><@spring.message "product.model.subimages"/></label>
			<div class="controls">
		    	<input type="file" name="subimages" id="subImgs">
		    	<table class="table">
		    		<tr id="images_product_sub"></tr>
		    	</table>
		    </div>
		</div>
		<div class="control-group">
			<label class="control-label"><@spring.message "seller.product.add.parentOrNot"/></label>
			<div class="controls">
		    	<input type="radio" name="hasChildrenOrNot" value="no"><@spring.message "seller.product.add.standAloneSKU"/>
		    	<input type="radio" name="hasChildrenOrNot" value="yes"><@spring.message "seller.product.add.parentWithChildSKU"/>
		    </div>
		</div>
		<div id="standAloneSKU" class="hidden">
			<div class="control-group">
				<label class="control-label"><@spring.message "item.model.sku"/></label>
				<div class="controls">
			    	<input type="text" placeholder="SKU" name="sku" id="sku" access="text">
			    </div>
			</div>
		</div>
		<div class="hidden" id="parentWithChildSKU">
		</div>
		<div class="control-group">
			<label class="control-label"><@spring.message "seller.product.add.internationalShippingService"/></label>
			<div class="controls">
		    	<input type="radio" name="internationalShippingService" value="no" checked>No
		    	&nbsp;
		    	<input type="radio" name="internationalShippingService" value="yes">Yes
		    </div>
		</div>
		<div class="hidden" id="internationalShippingService">
			<div class="control-group">
				<label class="control-label"><@spring.message "product.model.internationalShippingFee"/></label>
				<div class="controls">
			    	<input type="text" placeholder="internationalShippingFee" name="internationalShippingFee" access="float">
			    </div>
			</div>
			<div class="control-group">
				<label class="control-label"><@spring.message "product.model.internationalPromiseDays"/></label>
				<div class="controls">
			    	<input type="text" placeholder="internationalShippingFee" name="internationalPromiseDays" access="int">
			    </div>
			</div>
		</div>
		
		<legend><@spring.message "seller.product.add.productprices"/></legend>
		<div id="prices">
			<div class="control-group">
				<label class="control-label"><@spring.message "product.model.retailPrice"/></label>
				<div class="controls">
			    	<input type="text" placeholder="retailPrice" name="retailPrice" access="float" autocomplete="on">
			    </div>
			</div>
			<div class="control-group">
				<label class="control-label"><@spring.message "product.model.promotionPrice"/></label>
				<div class="controls">
			    	<input type="text" placeholder="promotionPrice" name="promotionPrice" access="float" autocomplete="on">
			    </div>
			</div>
			<div class="control-group">
				<label class="control-label"><@spring.message "product.model.promotionTime"/></label>
				<div class="controls">
			    	<input id="promotionTime" type="text" placeholder="promotionTime" name="promotionTime" autocomplete="on">--
			    	<input id="promotionTime2" type="text" placeholder="promotionTime" name="promotionEnd" autocomplete="on">
			    	<span class="help-inline">Time Format: 2013-09-22</span>
			    </div>
			</div>
			<div class="control-group">
				<label class="control-label"><@spring.message "product.model.wholePrice"/></label>
				<div class="controls">
			    	<input type="text" placeholder="wholePrice" name="wholePrice" access="float" autocomplete="on">
			    </div>
			</div>
			<div class="control-group">
				<label class="control-label"><@spring.message "product.model.minimumQuantity"/></label>
				<div class="controls">
			    	<input type="text" placeholder="minimumQuantity" name="minimumQuantity" access="int">
			    </div>
			</div>
			<div class="control-group">
				<label class="control-label"><@spring.message "product.model.maximumAcceptQuantity"/></label>
				<div class="controls">
			    	<input type="text" placeholder="maximumAcceptQuantity" name="maximumAcceptQuantity" access="int">
			    </div>
			</div>
			<div class="control-group">
				<label class="control-label"><@spring.message "product.model.availableQuantity"/></label>
				<div class="controls">
			    	<input type="text" placeholder="availableQuantity" name="availableQuantity" access="int">
			    </div>
			</div>
			<div class="control-group">
				<label class="control-label"><@spring.message "product.model.safeStock"/></label>
				<div class="controls">
			    	<input type="text" placeholder="safeStock" name="safeStock" access="int">
			    </div>
			</div>
		</div>
		<legend><@spring.message "seller.product.add.productdescription"/></legend>
		<div id="others">
			<div class="control-group">
				<label class="control-label"><@spring.message "product.model.netWeight"/></label>
				<div class="controls">
					<input type="text" placeholder="netWeight" name="netWeight" access="text">
			    </div>
			</div>
			<div class="control-group">
				<label class="control-label"><@spring.message "product.model.grossWeight"/></label>
				<div class="controls">
					<input type="text" placeholder="grossWeight" name="grossWeight" access="text">
			    </div>
			</div>
			<div class="control-group">
				<label class="control-label"><@spring.message "product.model.sizeWithPackage"/></label>
				<div class="controls">
					<input type="text" placeholder="sizeWithPackage" name="sizeWithPackage" access="text">
			    </div>
			</div>
			<div class="control-group">
				<label class="control-label"><@spring.message "product.model.brandId"/></label>
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
				<label class="control-label"><@spring.message "product.model.description"/></label>
				<div class="controls">
			    	<textarea id="description" rows="20" name="description" class="field span12" placeholder="input some description about this product"></textarea>
			    </div>
			</div>
		</div>
		<legend></legend>
		<div class="control-group">
			<div class="controls">
		    	<a class="btn btn-primary" id="over"><@spring.message "button.product.add"/></a>
		    	<a class="btn btn-primary" id="over_then_continue"><@spring.message "button.product.addnext"/></a>
			    <a class="btn btn-info" id="over_then_next"><@spring.message "button.product.addsub"/></a>
		    </div>
		</div>
		
	</form>
</div>