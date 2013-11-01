<script src="/js/product.js"></script>
<script src="/js/seller/product-list.js"></script>
<!--
<div class="alert">
  <button type="button" class="close" data-dismiss="alert">&times;</button>
  <strong>Warning!</strong> Best check yo self, you're not looking too good.
</div>
-->
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
			<#if product.status != 0>
			<tr>
				<td class="product-id">
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
							<#if product.sellable == 6>
								<@spring.message "product.status.startSell"/>
							<#elseif product.sellable == 7>
								<@spring.message "product.status.stopSell"/>
							<#else>
								<@spring.message "product.status.ChinaListingCreated"/>
							</#if>
						<#break>
						<#case 9><!-- 没有子产品 -->
							<@spring.message "product.status.noChildren"/>
						<#break>
					</#switch>
				</td>
				<td>
					<a href="/seller/product/edit?id=#{product.id}" class="btn" id="edit"><@spring.message "button.edit"/></a>
					<a href="/seller/product/quickedit?id=#{product.id}" class="btn btn-primary"><@spring.message "button.quickedit"/></a>
					<button class="btn delete-product"><@spring.message "button.delete"/></button>
					<#if product.hasChildren == 1>
						<button class="btn btn-info show-children">Show Children</button>
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
							<#if product.sellable == 6><!-- 已经在售 -->
								<a href="/seller/product/changestatus?status=7&productId=${product.id}" class="btn btn-primary"><@spring.message "product.status.stopSell"/></a>
							<#else><!-- 已经翻译完并停售 -->
								<a href="/seller/product/changestatus?status=6&productId=${product.id}" class="btn btn-primary"><@spring.message "product.status.startSell"/></a>
							</#if>
						<#break>
					</#switch>
				</td>
			</tr>
			</#if>
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