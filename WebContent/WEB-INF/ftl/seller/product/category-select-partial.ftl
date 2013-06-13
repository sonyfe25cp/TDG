<script src="/js/seller/product-category-select.js"></script>
<link href="/css/seller/product-category-select.css" rel="stylesheet">
<div class="container-fluid">
	<div class="row-fluid">
	    <div class="span6">
	    	<p><@spring.message "seller.category-select.category"/></p>
	    	<ul class="categories">
	    		<#list categories as category>
	    			<li class="category">
	    				<span>${category.name}</span>
	    				<input type="hidden" value="${category.id}"/>
	    			</li>
	    		</#list>
	    	</ul>
	    </div>
	    <div class="span6">
	    	<p><@spring.message "seller.category-select.subcategory"/></p>
	    	<ul class="subcategories">
	    		<li class=".subcategory">12</li>
	    	</ul>
	    </div>
  	</div>
  	<div>
  		<button class="btn" id="categoryConfirm">确定</button>
  	</div>
</div>