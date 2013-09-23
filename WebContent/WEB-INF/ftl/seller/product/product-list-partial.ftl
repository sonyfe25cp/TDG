<legend><@spring.message "seller.product.list.title"/></legend>
<table class="table">
	<thead>
		<th><@spring.message "product.model.id"/></th>
		<th><@spring.message "product.model.name"/></th>
		<th><@spring.message "product.model.retailPrice"/></th>
		<th><@spring.message "product.model.promotionPrice"/></th>
		<th><@spring.message "product.model.wholePrice"/></th>
		<th><@spring.message "product.model.availableQuantity"/></th>
		<th><@spring.message "product.model.active"/></th>
		<th><@spring.message "product.model.status"/></th>
		<th><@spring.message "menu.options"/></th>
	</thead>
	<tbody>
		<#list products as product>
			<tr>
				<td>
					${product.id}
				</td>
				<td>
					${product.name}
				</td>
				<td>
					${product.retailPrice}
					<#include "/common/product-coinage-select.ftl">
				</td>
				<td>${product.promotionPrice}<#include "/common/product-coinage-select.ftl"></td>
				<td>${product.wholePrice}<#include "/common/product-coinage-select.ftl"></td>
				<td>${product.availableQuantity}</td>
				<td>
					<#switch product.active>
						<#case 0>
							<@spring.message "product.model.active.warning"/>
						<#break>
						<#case 1>
							<@spring.message "product.model.active.ok"/>
						<#break>
					</#switch>
				</td>
				<td>
					<#switch product.status>
						<#case 1><!-- 申请翻译 -->
							<@spring.message "product.status.InEnglishDisplay"/>
						<#break>
						<#case 2><!-- 等待翻译分配 -->
							<@spring.message "product.status.applyTranslation"/>
						<#break>
						<#case 3><!-- 等待翻译完成 -->
							<@spring.message "product.status.InTranslation"/>
						<#break>
						<#case 4><!-- 等待管理员审核 -->
							<@spring.message "product.status.TranslationComplete"/>
						<#break>
						<#case 5><!-- 等待用户确认 -->
							<@spring.message "product.status.ChinaListingCreated"/>
						<#break>
						<#case 6><!-- 已经在售 -->
							<@spring.message "product.status.startSell"/>
						<#break>
						<#case 7><!-- 已经翻译完并停售 -->
							<@spring.message "product.status.stopSell"/>
						<#break>
					</#switch>
				</td>
				<td>
					<a href="/seller/product/edit?id=#{product.id}" class="btn"><@spring.message "button.edit"/></a>
					<a href="/seller/product/delete?id=#{product.id}" class="btn"><@spring.message "button.delete"/></a>
					<#if product.hasChildren == 1>
						<a href="/seller/product/itemadd?productId=#{product.id}" class="btn btn-info">add item</a>
					</#if>
					<#switch product.status>
						<#case 1><!-- 申请翻译 -->
							<a href="/seller/product/changestatus?status=2&productId=${product.id}" class="btn btn-primary"><@spring.message "product.status.applyTranslation"/></a>
						<#break>
						<#case 2><!-- 等待翻译分配 -->
							
						<#break>
						<#case 3><!-- 等待翻译完成 -->
						<#break>
						<#case 4><!-- 等待管理员审核 -->
						<#break>
						<#case 5><!-- 等待用户确认 -->
							<a href="/seller/product/changestatus?status=6&productId=${product.id}" class="btn btn-primary"><@spring.message "product.status.startSell"/></a>
						<#break>
						<#case 6><!-- 已经在售 -->
							<a href="/seller/product/changestatus?status=7&productId=${product.id}" class="btn btn-primary"><@spring.message "product.status.stopSell"/></a>
						<#break>
						<#case 7><!-- 已经翻译完并停售 -->
							<a href="/seller/product/changestatus?status=6&productId=${product.id}" class="btn btn-primary"><@spring.message "seller.product.list.startSell"/></a>
						<#break>
					</#switch>
				</td>
			</tr>
		</#list>
	</tbody>
</table>
<div class="pagination pagination-centered">
	<ul>
		<li><a href="/seller/product/list?pageNo=0"><@spring.message "page.first"/></a></li>
		<#if pageNo != 0>
			<li><a href="/seller/product/list?pageNo=${pageNo-1}"><@spring.message "page.previous"/></a></li>
		</#if>
		<li><a href="/seller/product/list?pageNo=${pageNo+1}"><@spring.message "page.next"/></a></li>
	</ul>
</div>