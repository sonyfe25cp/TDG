<legend><@spring.message "seller.product.list.title"/></legend>
<a href="/seller/productadd" class="btn"><@spring.message "button.add"/></a>
<table class="table">
	<thead>
		<th><@spring.message "seller.product.model.id"/></th>
		<th><@spring.message "seller.product.model.name"/></th>
		<th><@spring.message "seller.product.model.retailPrice"/></th>
		<th><@spring.message "seller.product.model.active"/></th>
		<th><@spring.message "menu.options"/></th>
	</thead>
	<tbody>
		<#list products as product>
			<tr>
				<td>
					${product_index+1}
				</td>
				<td>
					${product.name}
				</td>
				<td>
					${product.retailPrice}
				</td>
				<td>
					<#switch product.active>
						<#case 0>
							<@spring.message "seller.product.model.active.warning"/>
						<#break>
						<#case 1>
							<@spring.message "seller.product.model.active.ok"/>
						<#break>
					</#switch>
				</td>
				<td>
					<a href="/seller/productedit?id=#{product.id}" class="btn"><@spring.message "button.edit"/></a>
					<a href="/seller/productdelete?id=#{product.id}" class="btn"><@spring.message "button.delete"/></a>
					<#if product.hasChildren == 1>
						<a href="/seller/product/itemadd?productId=#{product.id}" class="btn info">add item</a>
					</#if>
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