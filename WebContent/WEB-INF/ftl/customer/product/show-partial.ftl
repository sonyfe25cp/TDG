<script type="text/javascript" src="/js/customer/cart.js"></script>
<link href="/css/customer/product.css" rel="stylesheet">
<div class="row-fluid">
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
	      <div class="product title">
	      	<span>${product.name}
	      </div>
	      <div class="product meta">
	      	<p><@spring.message "seller.product.model.id"/>: ${product.id}</p>
	      	<p><@spring.message "seller.product.model.retailPrice"/>: <#include "/common/product-coinage-select.ftl"> ${product.retailPrice}</p>
	      	<p><@spring.message "seller.product.model.wholePrice"/>: <#include "/common/product-coinage-select.ftl"> ${product.wholePrice}</p>
	      	<p><@spring.message "seller.product.model.minimumQuantity"/>: ${product.minimumQuantity}</p>
	      	<p><@spring.message "seller.product.model.maximumAcceptQuantity"/>: ${product.maximumAcceptQuantity}</p>
	      </div>
	      
	      
	      <div id="items">
		      <#list items as item>
		      		<span class="item-sku" value="${item.sku}">
		      			<#list item.params?keys as param>
		      				${param}-${item.params[param]}
		      			</#list>
		      		</span>
		      </#list>
	      </div>
	      <div>
	      	<input type="hidden" id="hasChildren" value="${product.hasChildren}">
	      		<a class="btn" id="addtocart" value="${product.id}"><@spring.message "button.addCart"/></a>
	      </div>
	    </div>
  	</div>
  	<#if product.basicParamsMapInEnglish??>
	  	<div><!-- product params -->
	  		<legend><@spring.message "seller.product.show.desc"/></legend>
	  		<#list product.basicParamsMap?keys as param>
	              ${param}:${product.basicParamsMap[param]}<p/>
			</#list>
	  	</div>
  	</#if>
  	<div><!-- product desc -->
  		<legend><@spring.message "seller.product.show.desc"/></legend>
  		${product.description}
  	</div>
<div>