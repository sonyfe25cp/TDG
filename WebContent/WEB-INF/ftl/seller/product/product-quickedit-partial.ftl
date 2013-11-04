<script type="text/javascript" src="/js/jquery-ui-1.10.3.custom.min.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css">
<script type="text/javascript" src="/js/jquery.uploadify.min.js"></script>
<script charset="utf-8" src="/js/kindeditor-4.1.7/kindeditor.js"></script>
<script charset="utf-8" src="/js/kindeditor-4.1.7/lang/zh_CN.js"></script>
<script type="text/javascript" src="/js/seller/product-quickedit.js"></script>
<div>
	<form class="form-horizontal" method="post" action="/seller/product/addproduct">
		<legend><@spring.message "seller.product.add.productdesc"/></legend>
		<div class="control-group">
			<label class="control-label"><@spring.message "product.model.name"/></label>
			<div class="controls">
		    	${product.name}
		    	<input id="id" name="id" value="${product.id}" type="hidden">
		    </div>
		</div>
		<div class="control-group">
			<label class="control-label"><@spring.message "product.model.mainimage"/></label>
			<div class="controls">
		    	<input type="file" name="mainimage" id="mainImg">
		    	<div id='images_product_main'>
		    		<img id="mainimage" style="width:160px;height:160px;" src="${product.mainImage}"/><a class='btn'>delete</a>
		    	</div>
		    </div>
		</div>
		<div class="control-group">
			<label class="control-label"><@spring.message "product.model.subimages"/></label>
			<div class="controls">
		    	<input type="file" name="subimages" id="subImgs">
		    	<table class="table">
		    		<tr id="images_product_sub">
		    			<#if product.otherImages??>
			    			<#list product.otherImages as img>
			    				<td><img class="img-polaroid" src="${img}"><a class="btn">delete</a></td>
			    			</#list>
		    			</#if>
		    		</tr>
		    	</table>
		    </div>
		</div>
		<#if product.hasChildren == 0>
			<div id="standAloneSKU" class="hidden">
				<div class="control-group">
					<label class="control-label"><@spring.message "item.model.sku"/></label>
					<div class="controls">
				    	<input type="text" name="sku" id="sku" access="text" value="">
				    </div>
				</div>
			</div>
		</#if>
		<div id="international" class="hidden">
			{"iss":${product.internationalShippingService},"isf":${product.internationalShippingFee},"isd":${product.internationalPromiseDays}}
		</div>
		<div class="control-group">
			<label class="control-label"><@spring.message "seller.product.add.internationalShippingService"/></label>
			<div class="controls">
		    	<input type="radio" name="internationalShippingService" value="no">No
		    	&nbsp;
		    	<input type="radio" name="internationalShippingService" value="yes">Yes
		    </div>
		</div>
		<div class="hidden" id="internationalShippingService">
			<div class="control-group">
				<label class="control-label"><@spring.message "product.model.internationalShippingFee"/></label>
				<div class="controls">
			    	<input type="text" name="internationalShippingFee" access="float">
			    </div>
			</div>
			<div class="control-group">
				<label class="control-label"><@spring.message "product.model.internationalPromiseDays"/></label>
				<div class="controls">
			    	<input type="text" name="internationalPromiseDays" access="int">
			    </div>
			</div>
		</div>
		
		<legend><@spring.message "seller.product.add.productprices"/></legend>
		<div id="prices">
			<div class="control-group">
				<label class="control-label"><@spring.message "product.model.retailPrice"/></label>
				<div class="controls">
			    	<input type="text" name="retailPrice" access="float" value="${product.retailPrice}">
			    </div>
			</div>
			<div class="control-group">
				<label class="control-label"><@spring.message "product.model.promotionPrice"/></label>
				<div class="controls">
			    	<input type="text" name="promotionPrice" access="float" value="${product.promotionPrice}">
			    </div>
			</div>
			<div class="control-group">
				<label class="control-label"><@spring.message "product.model.promotionTime"/></label>
				<div class="controls">
					<#if product.promotionTime?? && product.promotionEnd??>
						<input id="promotionTime" type="text"  name="promotionTime" autocomplete="on" class="input-medium uneditable-input" value="${product.promotionTime?date}">--
			    		<input id="promotionTime2" type="text" name="promotionEnd" autocomplete="on" class=" input-medium uneditable-input" value="${product.promotionEnd?date}">
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
			    	<input type="text" name="wholePrice" access="float" value="${product.wholePrice}">
			    </div>
			</div>
			<div class="control-group">
				<label class="control-label"><@spring.message "product.model.minimumQuantity"/></label>
				<div class="controls">
			    	<input type="text" name="minimumQuantity" access="int" value="${product.minimumQuantity}">
			    </div>
			</div>
			<div class="control-group">
				<label class="control-label"><@spring.message "product.model.maximumAcceptQuantity"/></label>
				<div class="controls">
			    	<input type="text" name="maximumAcceptQuantity" access="int" value="${product.maximumAcceptQuantity}">
			    </div>
			</div>
			<div class="control-group">
				<label class="control-label"><@spring.message "product.model.availableQuantity"/></label>
				<div class="controls">
			    	<input type="text" name="availableQuantity" access="int" value="${product.availableQuantity}">
			    </div>
			</div>
			<div class="control-group">
				<label class="control-label"><@spring.message "product.model.safeStock"/></label>
				<div class="controls">
			    	<input type="text" name="safeStock" access="int" value="${product.safeStock}">
			    </div>
			</div>
		</div>
		<legend><@spring.message "seller.product.add.productdescription"/></legend>
		<div id="others">
			<div class="control-group">
				<label class="control-label"><@spring.message "product.model.netWeight"/></label>
				<div class="controls">
					<input type="text" name="netWeight" access="text" value="${product.netWeight}">
			    </div>
			</div>
			<div class="control-group">
				<label class="control-label"><@spring.message "product.model.grossWeight"/></label>
				<div class="controls">
					<input type="text" name="grossWeight" access="text" value="${product.grossWeight}">
			    </div>
			</div>
			<div id="pk" class="hidden">${product.sizeWithPackage}</div>
			<div class="control-group">
				<label class="control-label"><@spring.message "product.model.sizeWithPackage"/></label>
				<div class="controls">
					Length:<input type="text" id="length" access="text" class="input-mini">
					Width:<input type="text" id="width" access="text" class="input-mini">
					Hight:<input type="text" id="height" access="text" class="input-mini">
			    </div>
			</div>
			<div class="control-group">
				<label class="control-label"><@spring.message "product.model.brandId"/></label>
				<div class="controls">
					<select name="brandId">
						<#list brands as brand>
							<option value="${brand.id}">${brand.name}</option>
						</#list>
					</select>
			    </div>
			</div>
		</div>
		<legend></legend>
		<div class="control-group">
			<div class="controls">
		    	<a class="btn btn-primary" id="over"><@spring.message "button.update"/></a>
		    </div>
		</div>
	</form>
</div>