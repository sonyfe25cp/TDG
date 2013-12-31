<legend>搜索结果</legend>
<#if products?size !=0>
	<div class="row-fluid">
		<#list products as product>
			<div class="span3">
				<div class="image">
					<a href="/product/${product.id}"><image style="width:120px;height:160px;" class="img-polaroid" src="${product.mainImage}"/></a>
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
	<#if searchWord??>
		<div class="pagination pagination-centered">
			<ul>
				<li><a href="/search/byname?name=${searchWord}&pageNo=0"><@spring.message "page.first"/></a></li>
				<#if pageNo != 0>
					<li><a href="/search/byname?name=${searchWord}&pageNo=${pageNo-1}"><@spring.message "page.previous"/></a></li>
				</#if>
				<li><a href="/search/byname?name=${searchWord}&pageNo=${pageNo+1}"><@spring.message "page.next"/></a></li>
			</ul>
		</div>
	</#if>
<#else>
没有相应的搜索结果
</#if>