<script type="text/javascript" src="/js/customer/cart.js"></script>
<div class="row-fluid">
	<div class="row-fluid"><!-- product meta -->
	    <div class="span4">
	      	<div id="myCarousel" class="carousel slide">
		      <div class="carousel-inner">
		        <div class="item active">
		          <img style="height:350px;" src="http://omartech.com/assets/slide-01-f66bcb3beecf62e05cddbd22c0ad8377.jpg" alt="">
		        </div>
		        <#if product.otherImages??>
			        <#list product.otherImages as image>
				        <div class="item">
				          <img style="height:350px;" src="http://omartech.com/assets/slide-01-f66bcb3beecf62e05cddbd22c0ad8377.jpg" alt="">
				        </div>
				     </#list>
				     <a class="left carousel-control" href="#myCarousel" data-slide="prev">&lsaquo;</a>
				     <a class="right carousel-control" href="#myCarousel" data-slide="next">&rsaquo;</a>
			     </#if>
		      </div>
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
	      <div>
	      	<a class="btn red" id="addtocart" value="${product.id}"><@spring.message "button.addCart"/></a>
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