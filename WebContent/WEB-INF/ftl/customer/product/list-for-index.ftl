<div class="customer-product-index row">

	<div>
		商品展示
	</div>
	<#list products as product>
		<div class="span3">
			<div class="image">
				<a href="/product/${product.id}"><image src="${product.mainImage}"/></a>
			</div>
			<p><a href="/product/${product.id}">${product.name}</a></p>
			<div class="desc">${product.description}</div>
			<span>TDG价格: 
				<#include "/common/product-coinage-select.ftl"/>
				${product.retailPrice}
			</span>
		</div>
	</#list>

	<legend></legend>

	<div>
		DEMO商品展示
	</div>
	<#list 1..30 as i>
		<div class="span3">
			<div class="image">
				<image src="/img/img1.jpg"/>
			</div>
			<div class="desc">一段描述性的文字</div>
			<span>TDG价格: $78</span>
		</div>
	</#list>
</div>