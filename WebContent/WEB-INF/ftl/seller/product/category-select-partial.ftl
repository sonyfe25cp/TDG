<#if locale == "zh_CN">
	<script src="/js/seller/product-category-select.js"></script>
<#else>
	<script src="/js/seller/product-category-select-en.js"></script>
</#if>
<link href="/css/seller/product-category-select.css" rel="stylesheet">
<div class="container-fluid">
	<div class="row-fluid">
	    <div class="span3">
	    	<p>
	    		<@spring.message "seller.category-select.category"/>
	    	</p>
	    	<ul class="categories">
	    		<#list productLines as productLine>
	    			<li class="category">
	    				<#if locale == "zh_CN">
	    					<span>${productLine.name}</span>
	    				<#else>
	    					<span>${productLine.english}</span>
	    				</#if>
	    				<input type="hidden" value="${productLine.id}"/>
	    			</li>
	    		</#list>
	    	</ul>
	    </div>
	    <div class="span3">
	    	<p><@spring.message "seller.category-select.subcategory"/></p>
	    	<ul class="subcategories">
	    	</ul>
	    </div>
	    <div class="span3">
	    	<p><@spring.message "seller.category-select.subcategory"/></p>
	    	<ul class="third-categories">
	    	</ul>
	    </div>
  	</div>
  	<div>
  		<button class="btn" id="categoryConfirm"><@spring.message "button.sure"/></button>
  	</div>
</div>