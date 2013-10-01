<script type="text/javascript" src="/js/jquery-cookie.js"></script>
<script type="text/javascript" src="/js/customer/cart.js"></script>
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
			  	<p>
			  		<@spring.message "product.model.retailPrice"/>: 
		  			<#include "/common/product-coinage-select.ftl">
			  		<span id="retailPrice" class="price">
			  			${product.retailPrice}
			  		</span>
			  	</p>
			  	<#if product.promotionTime?? && product.promotionPrice??>
			  	<p>
			  		<@spring.message "product.model.promotionPrice"/>: 
		  			<#include "/common/product-coinage-select.ftl">
			  		<span id="promotionPrice">
			  			${product.promotionPrice}
			  		</span>
			  	</p>
			  	<p>
			  		<@spring.message "product.model.promotionTime"/>: 
			  		<span id="promotionTime">
			  			${product.promotionTime?datetime} -- ${product.promotionEnd?datetime}
			  		</span>
			  	</p>
			  	</#if>
			  	<p>
			  		<@spring.message "product.model.wholePrice"/>: 
			  		<#include "/common/product-coinage-select.ftl"> 
			  		<span id="wholePrice">
			  			${product.wholePrice}
			  		</span>
			  	</p>
			  	<p>
			  		<@spring.message "product.model.minimumQuantity"/>:
			  		<span id = "minimumQuantity">
			  			${product.minimumQuantity}
			  		</span>
			  	</p>
				<p><@spring.message "product.model.maximumAcceptQuantity"/>: 
					<span id = "maximumAcceptQuantity">
						${product.maximumAcceptQuantity}
					</span>
				</p>
				<#if product.internationalShippingService == 1>
					<p>
						<@spring.message "product.model.internationalShippingFee"/>: ${product.internationalShippingFee}
					</p>
					<p><@spring.message "product.model.internationalPromiseDays"/>: ${product.internationalPromiseDays}</p>
				</#if>
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
			<script type="text/javascript" src="/js/customer/product.js"></script>
			<div id="features" class="hidden">
			[
				<#assign i = 1>
				
				<#list items as item>
				{
					"id":${item.id},
					"retailPrice":${item.retailPrice},
					"wholePrice":${item.wholePrice},
					"promotionPrice":${item.promotionPrice},
					"promotionTime":"${item.promotionTime?datetime}",
					"promotionEnd":"${item.promotionEnd?datetime}",
					"sku":{${item.featureJson}},
					"image":"${item.image}",
					"availableQuantity":${item.availableQuantity},
					"minimumQuantity":${item.minimumQuantity},
					"maximumAcceptQuantity":${item.maximumAcceptQuantity},
					"wholePrice":${item.wholePrice}
				}
				<#if i!= items?size>,</#if>
				<#assign i = i +1>
				</#list>
			]
			</div>
		    </#if>
		      <div class="options">
		      	<#if product.active == 1>
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
			  			<#if locale == 'zh_CN' && brand.descriptionInChinese??>
				  			${brand.descriptionInChinese}
				  		<#else>
				  			${brand.description}
				  		</#if>
				  		<p/>
			  		</#if>
                </p>
              </div>
            </div>
          </div>
  	
  	
  	
  	
  	
  	
  	
  	
  		<!-- product desc -->
  		<legend></legend>
  		
  		
  	</div>
<div>