<script type="text/javascript" src="/js/jquery-cookie.js"></script>
<script type="text/javascript" src="/js/customer/cart.js"></script>
<script type="text/javascript" src="/js/customer/product.js"></script>
<link href="/css/customer/product.css" rel="stylesheet">
<div class="row-fluid product">
	<div class="row-fluid"><!-- product meta -->
	    <div class="span4">
	      	<div id="myCarousel" class="carousel slide">
		      <div class="carousel-inner">
		        <div class="item active">
		          <img style="height:350px;" src="${product.mainImage}" alt="">
		        </div>
			      <#if product.otherImages??>
				  	<#list product.otherImages as image>
						<div class="item">
					    	<img style="height:350px;" src="${image}" alt="">
					     </div>
					 </#list>
				   </#if>
		      </div>
					 <a class="left carousel-control" href="#myCarousel" data-slide="prev">&lsaquo;</a>
					 <a class="right carousel-control" href="#myCarousel" data-slide="next">&rsaquo;</a>
		    </div><!-- /.carousel -->
	    </div>
	    <div class="span8">
	      <div class="main">
			<p class="title">
				<#if locale == 'zh_CN' && product.nameInChinese??>
					${product.nameInChinese}
				<#else>
					${product.name}
				</#if>
			</p>
			<div class="meta">
			  	<p><@spring.message "product.model.id"/>: ${product.id}</p>
			  	<p>店铺ID：${product.sellerId}</p>
			  	<p>
			  		<@spring.message "product.model.retailPrice"/>: 
		  			<#include "/common/product-coinage-select.ftl">
			  		<span id="retailPrice" class="price">
			  			<#if product.hasChildren == 0>
			  				${items?first.retailPrice?number}
			  			<#else>
			  				<#if items?size == 1>
			  					${items?first.retailPrice?number}
			  				<#else>
			  					先选择子产品
			  				</#if>
			  			</#if>
			  			<!-- 
				  			<#if items?size == 1 && product.hasChildren == 0>
				  				${items?first.retailPrice?number}
				  			<#else>
				  				${product.retailPrice?number}
				  			</#if>
			  			 -->
			  		</span>
			  	</p>
			  	<div id="promotion">
				  	<p>
				  		<@spring.message "product.model.promotionPrice"/>: 
			  			<#include "/common/product-coinage-select.ftl">
				  		<span id="promotionPrice">
				  			<!--
					  			<#if items?size == 1>
					  				<#if items?first.promotionPrice??>
				  						${items?first.promotionPrice?number}
				  					</#if>
				  				<#else>
				  					<#if product.promotionPrice??>
				  						${product.promotionPrice?number}
				  					</#if>
				  				</#if>
			  				-->
			  				<#if product.hasChildren == 0>
				  				${items?first.promotionPrice?number}
				  			<#else>
				  				<#if items?size == 1>
				  					${items?first.promotionPrice?number}
				  				<#else>
				  					先选择子产品
				  				</#if>
				  			</#if>
				  		</span>
				  	</p>
				  	<p>
				  		<@spring.message "product.model.promotionTime"/>: 
				  		<span id="promotionTime">
				  			<!--
					  			<#if items?size == 1>
					  				<#if items?first.promotionTime?? && items?first.promotionEnd??>
					  					${items?first.promotionTime?date} -- ${items?first.promotionEnd?date}
					  				</#if>
					  			<#else>
					  				<#if product.promotionTime?? && product.promotionEnd??>
					  					${product.promotionTime?date} -- ${product.promotionEnd?date}
					  				</#if>
					  			</#if>
				  			-->
				  			<#if product.hasChildren == 0>
				  				${items?first.promotionTime?date} -- ${items?first.promotionEnd?date}
				  			<#else>
				  				<#if items?size == 1>
				  					${items?first.promotionTime?date} -- ${items?first.promotionEnd?date}
				  				<#else>
				  					先选择子产品
				  				</#if>
				  			</#if>
				  			
				  		</span>
				  	</p>
				</div>
			  	<div id="whole">
				  	<p>
				  		<@spring.message "product.model.wholePrice"/>: 
				  		<#include "/common/product-coinage-select.ftl"> 
				  		<span id="wholePrice">
				  			<!--
				  			<#if items?size == 1>
				  				<#if items?first.wholePrice??>
			  						${items?first.wholePrice}
			  					</#if>
			  				<#else>
			  					<#if product.wholePrice??>
			  						${product.wholePrice}
			  					</#if>
			  				</#if>
			  				-->
			  				<#if product.hasChildren == 0>
				  				${items?first.wholePrice}
				  			<#else>
				  				<#if items?size == 1>
				  					${items?first.wholePrice}
				  				<#else>
				  					先选择子产品
				  				</#if>
				  			</#if>
				  			
				  		</span>
				  	</p>
				  	<p>
				  		<@spring.message "product.model.minimumQuantity"/>:
				  		<span id = "minimumQuantity">
				  		<!--
				  			<#if items?size == 1>
				  				<#if items?first.minimumQuantity??>
			  						${items?first.minimumQuantity}
			  					</#if>
			  				<#else>
			  					<#if product.minimumQuantity??>
			  						${product.minimumQuantity}
			  					</#if>
			  				</#if>
			  				-->
			  				<#if product.hasChildren == 0>
				  				${items?first.minimumQuantity}
				  			<#else>
				  				<#if items?size == 1>
				  					${items?first.minimumQuantity}
				  				<#else>
				  					先选择子产品
				  				</#if>
				  			</#if>
			  				
				  		</span>
				  	</p>
					<p><@spring.message "product.model.maximumAcceptQuantity"/>: 
						<span id = "maximumAcceptQuantity">
							<!--
							<#if items?size == 1>
				  				<#if items?first.maximumAcceptQuantity??>
			  						${items?first.maximumAcceptQuantity}
			  					</#if>
			  				<#else>
			  					<#if product.maximumAcceptQuantity??>
			  						${product.maximumAcceptQuantity}
			  					</#if>
			  				</#if>
			  				-->
			  				<#if product.hasChildren == 0>
				  				${items?first.maximumAcceptQuantity}
				  			<#else>
				  				<#if items?size == 1>
				  					${items?first.maximumAcceptQuantity}
				  				<#else>
				  					先选择子产品
				  				</#if>
				  			</#if>
			  				
						</span>
					</p>
				</div>
				<div id="international">
					<p>
						<@spring.message "product.model.internationalShippingFee"/>: 
						<span id="internationalShippingFee">
							<#if items?size == 1>
				  				<#if items?first.internationalShippingFee??>
				  					<#if items?first.internationalShippingFee == 0>
				  						不提供国际运输
				  					<#else>
				  						<#include "/common/product-coinage-select.ftl"> 
			  							${items?first.internationalShippingFee}
			  						</#if>
			  					</#if>
			  				<#else>
			  					<#if product.internationalShippingFee??>
			  						<#if product.internationalShippingFee == 0>
			  							不提供国际运输
			  						<#else>
			  							<#include "/common/product-coinage-select.ftl"> 
			  							${product.internationalShippingFee}
			  						</#if>
			  					</#if>
			  				</#if>
		  				</span>
					</p>
					<p><@spring.message "product.model.internationalPromiseDays"/>: 
						<span id="internationalPromiseDays">
							<#if items?size == 1>
				  				<#if items?first.internationalPromiseDays??>
				  					<#if items?first.internationalPromiseDays == 0>
				  						不提供国际运输
				  					<#else>
			  							${items?first.internationalPromiseDays}
			  						</#if>
			  					</#if>
			  				<#else>
			  					<#if product.internationalPromiseDays??>
			  						<#if product.internationalPromiseDays == 0>
			  							不提供国际运输
				  					<#else>
			  							${product.internationalPromiseDays}
			  						</#if>
			  					</#if>
			  				</#if>
		  				</span>
					</p>
				</div>
				<p>
					<@spring.message "product.model.shippingCountry"/>: ${country.nameInChinese}
				</p>
				<p>
					<@spring.message "product.model.availableQuantity"/>: 
					<span id="availableQuantity">
						<!--
						<#if items?size == 1>
		  					${items?first.availableQuantity}
		  				<#else>
		  					${product.availableQuantity}
		  				</#if>
		  				-->
		  				<#if product.hasChildren == 0>
			  				${items?first.availableQuantity}
			  			<#else>
			  				<#if items?size == 1>
			  					${items?first.availableQuantity}
			  				<#else>
			  					先选择子产品
			  				</#if>
			  			</#if>
					</span>
				</p>
				<p>
					<@spring.message "product.model.netWeight"/>: 
					<span>
						${product.netWeight}
					</span>
				</p>
				<p>
					<@spring.message "product.model.grossWeight"/>: 
					<span >
						${product.grossWeight}
					</span>
				</p>
				<p>
					<@spring.message "product.model.sizeWithPackage"/>: 
					<span >
						${product.sizeWithPackage}
					</span>
				</p>
				<div>
					<div id = "color" class="hidden">
						<strong>颜色:</strong>
						<ul>
						</ul>
					</div>
					<div id = "size"  class="hidden">
						<strong>尺码:</strong>
						<ul>
						</ul>
					</div>
				</div>
			</div>
			<#if product.hasChildren == 1>
			<script type="text/javascript" src="/js/customer/product.parent.js"></script>
			<div id="features" class="hidden">
			[
				<#assign i = 1>
				
				<#list items as item>
				{
					"id":${item.id},
					"retailPrice":${item.retailPrice},
					"wholePrice":${item.wholePrice},
					<#if item.promotionTime?? && item.promotionPrice?? && item.promotionEnd??>
						"promotionPrice":${item.promotionPrice},
						"promotionTime":"${item.promotionTime?datetime}",
						"promotionEnd":"${item.promotionEnd?datetime}",
					</#if>
					"sku":{${item.featureJson}},
					"image":"${item.image}",
					"minimumQuantity":${item.minimumQuantity},
					"maximumAcceptQuantity":${item.maximumAcceptQuantity},
					"wholePrice":${item.wholePrice},
					"internationalShippingService":${item.internationalShippingService},
					<#if item.internationalShippingService == 1 && item.internationalShippingFee?? && item.internationalPromiseDays??>
						"internationalShippingFee":${item.internationalShippingFee},
						"internationalPromiseDays":${item.internationalPromiseDays},
					</#if>
					"availableQuantity":${item.availableQuantity}
				}
				<#if i!= items?size>,</#if>
				<#assign i = i +1>
				</#list>
			]
			</div>
		    </#if>
		      <div class="options">
		      	<#if product.active == 1 && product.sellable == 6 && items?size!=0 && product.status != 0>
			      	<input type="hidden" id="hasChildren" value="${product.hasChildren}">
			      	<#if product.hasChildren == 0 >
			      		<a class="btn btn-danger" id="addtocart" value="${items?first.id}"><@spring.message "button.addCart"/></a>
			      	<#else>
			      		<a class="btn" id="addtocart"><@spring.message "button.addCart"/></a>
			      	</#if>
			      	<div>
			      		</p>
			      		<span>数量：</span>
			      		<input type="text" id="buycount" class="input-mini" value="1"></input>
			      	</div>
			    <#else>
			    	<a class="btn"><@spring.message "product.show.outstock"/></a>
			    </#if>
		      </div>
	      </div>
	    </div>
  	</div>
  	<div>
  		<div class="bs-docs-example">
            <ul id="myTab" class="nav nav-tabs">
              <li class="active"><a href="#home" data-toggle="tab"><@spring.message "seller.product.show.desc"/></a></li>
              <li class=""><a href="#profile" data-toggle="tab"><@spring.message "seller.product.show.brand"/></a></li>
            </ul>
            <div id="myTabContent" class="tab-content">
	              <div class="tab-pane fade active in" id="home">
	                <p>
	                	<#if locale == 'zh_CN' && product.descriptionInChinese??>
				  			${product.descriptionInChinese}
				  		<#else>
				  			${product.description}
				  		</#if>
	                </p>
	              </div>
	              <div class="tab-pane fade" id="profile">
	                <p>
				        <#if brand??>
				  			<#if locale == 'zh_CN' && brand.descriptionInChinese?? && brand.status == 6>
				  				品牌名称：${brand.nameInChinese}<p/>
					  			${brand.descriptionInChinese}
					  		<#else>
					  			Brand：${brand.name}<p/>
					  			${brand.description}
					  		</#if>
					  		<p/>
				  		</#if>
	                </p>
	              </div>
            </div>
        </div>
  	</div>
<div>