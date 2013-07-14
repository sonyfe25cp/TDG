<div class="row-fluid">
	<div>
		商品展示
	</div>
	<#list products as product>
		<div class="span3">
			<div class="image">
				<a href="/product/${product.id}"><image class="img-polaroid" src="http://127.0.0.1:8080/img/img1.jpg"/></a>
				<!--
				<a href="/product/${product.id}"><image src="${product.mainImage}"/></a> 
				-->
			</div>
			<p><a style="color:black" href="/product/${product.id}">${product.name}</a></p>
			<span style="color:red">
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
		<div class="span2">
			<div class="image">
				<image src="/img/img1.jpg" class="img-polaroid"/>
			</div>
			<div class="desc">一段描述性的文字</div>
			<span>TDG价格: $78</span>
		</div>
	</#list>
</div>