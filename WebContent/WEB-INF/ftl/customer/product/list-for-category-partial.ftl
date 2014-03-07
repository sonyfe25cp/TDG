<legend><a href="/index">全部商品</a> > ${productLine.name}</legend>
<div class="row">
	<#list products as product>
		<div class="span3">
			<div class="image">
				<a href="/product/${product.id}"><image style="width:350px;height:370px;" class="img-polaroid" src="${product.mainImage}"/></a>
			</div>
			<div>
				<a style="color:black" href="/product/${product.id}">
					<#if locale == 'zh_CN' && product.nameInChinese??>
						${product.nameInChinese}
					<#else>
						${product.name}
					</#if>
				</a>
			</div>
			<span style="color:red">
				<#include "/common/product-coinage-select.ftl"/>
				${product.retailPrice}
			</span>
		</div>
	</#list>
</div>
<div class="pagination pagination-centered">
	<ul>
		<li><a href="/product/category/${category}?pageNo=0"><@spring.message "page.first"/></a></li>
		<#if pageNo != 0>
			<li><a href="/product/category/${category}?pageNo=${pageNo-1}"><@spring.message "page.previous"/></a></li>
		</#if>
		<li><a href="/product/category/${category}?pageNo=${pageNo+1}"><@spring.message "page.next"/></a></li>
	</ul>
</div>