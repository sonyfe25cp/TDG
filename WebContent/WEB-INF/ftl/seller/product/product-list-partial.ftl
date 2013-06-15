<legend><@spring.message "seller.product.list.title"/></legend>
<a href="/seller/productadd" class="btn"><@spring.message "button.add"/></a>
<table class="table">
	<thead>
		<th><@spring.message "seller.product.id"/></th>
		<th><@spring.message "seller.product.name"/></th>
		<th><@spring.message "seller.product.price"/></th>
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
					${product.description}
				</td>
				<td>
					<a href="/seller/productedit?id=#{product.id}" class="btn"><@spring.message "button.edit"/></a>
					<a href="/seller/productdelete?id=#{product.id}" class="btn"><@spring.message "button.delete"/></a>
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