<script src="/js/seller/product-category-select.js"></script>
<link href="/css/seller/product-category-select.css" rel="stylesheet">
<div class="container-fluid">
	<div class="row-fluid">
	    <div class="span3">
	    	<p><@spring.message "seller.category-select.category"/></p>
	    	<ul class="categories">
	    		<#list productLines as productLine>
	    			<li class="category">
	    				<span>${productLine.name}</span>
	    				<input type="hidden" value="${productLine.id}"/>
	    			</li>
	    		</#list>
	    	</ul>
	    </div>
	    <div class="span3">
	    	<p><@spring.message "seller.category-select.subcategory"/></p>
	    	<ul class="subcategories">
	    		<li class="subcategory">12</li>
	    	</ul>
	    </div>
	    <div class="span3">
	    	<p><@spring.message "seller.category-select.subcategory"/></p>
	    	<ul class="third-categories">
	    	</ul>
	    </div>
  	</div>
  	<div>
  		<button class="btn" id="categoryConfirm">确定</button>
  	</div>
</div>