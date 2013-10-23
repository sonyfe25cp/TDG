<script src="/js/admin/translatorTask.js"></script>
<div>
	<legend>Translators</legend>
	<ul class="translators">
		<#list translators as translator>
			<li><input name="translator" type="radio" value="${translator.id}"/>  ${translator.email}</li>
		</#list>
	</ul>
	<button class="btn disabled" id="at" value="product">Allocate Tasks</button>
</div>
<p/>
<legend><@spring.message "seller.product.list.title"/></legend>
<table class="table">
	<thead>
		<th><input type="checkbox" name="all-select"/></th>
		<th><@spring.message "product.model.id"/></th>
		<th><@spring.message "product.model.name"/></th>
		<th><@spring.message "product.model.retailPrice"/></th>
		<th><@spring.message "product.model.active"/></th>
		<th><@spring.message "product.model.sellerId"/></th>
		<th><@spring.message "menu.options"/></th>
	</thead>
	<tbody>
		<#list products as product>
			<tr>
				<td>
					<#if product.status==2>
						<input type="checkbox" name="translation" value="${product.id}"/>
					</#if>
				</td>
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
				<td><a href="/admin/accounts/sellers/${product.sellerId}">${product.sellerId}</a></td>
				<td>
					<a href="/product/${product.id}" target="_blank" class="btn btn-info"><@spring.message "button.show"/></a>
					<#switch product.status>
						<#case 1><!-- 申请翻译 -->
						<#break>
						<#case 2><!-- 等待翻译分配 -->
							
						<#break>
						<#case 3><!-- 等待翻译完成 -->
						<#break>
						<#case 4><!-- 等待管理员审核 -->
							<a href="/admin/product/changestatus?status=5&productId=${product.id}" class="btn btn-primary"><@spring.message "product.status.TranslationComplete"/></a>
						<#break>
						<#case 5><!-- 等待用户确认 -->
						<#break>
						<#case 6><!-- 已经在售 -->
						<#break>
						<#case 7><!-- 已经翻译完并停售 -->
							<a href="/admin/product/changestatus?status=6&productId=${product.id}" class="btn btn-primary"><@spring.message "product.status.startSell"/></a>
						<#break>
					</#switch>
				</td>
			</tr>
		</#list>
	</tbody>
</table>
<div class="pagination pagination-centered">
	<ul>
		<li><a href="/seller/listproduct?pageNo=0"><@spring.message "page.first"/></a></li>
		<#if pageNo != 0>
			<li><a href="/seller/listproduct?pageNo=${pageNo-1}"><@spring.message "page.previous"/></a></li>
		</#if>
		<li><a href="/seller/listproduct?pageNo=${pageNo+1}"><@spring.message "page.next"/></a></li>
	</ul>
</div>