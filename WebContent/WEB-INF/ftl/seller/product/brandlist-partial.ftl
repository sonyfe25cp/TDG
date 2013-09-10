<legend><@spring.message "brand.list.title"/></legend>
<a href="/seller/brandadd" class="btn"><@spring.message "button.add"/></a>
<table class="table">
	<thead>
		<th><@spring.message "brand.id"/></th>
		<th><@spring.message "brand.name"/></th>
		<th><@spring.message "brand.description"/></th>
		<th><@spring.message "menu.options"/></th>
	</thead>
	<tbody>
		<#list brands as brand>
			<tr>
				<td>
					${brand_index+1}
				</td>
				<td>
					${brand.name}
				</td>
				<td>
					${brand.description}
				</td>
				<td>
					<a href="/seller/brandedit?id=#{brand.id}" class="btn"><@spring.message "button.edit"/></a>
					<a href="/seller/branddelete?id=#{brand.id}" class="btn"><@spring.message "button.delete"/></a>
				</td>
			</tr>
		</#list>
	</tbody>
</table>
<div class="pagination pagination-centered">
	<ul>
		<li><a href="/seller/listbrand?pageNo=0"><@spring.message "page.first"/></a></li>
		<#if pageNo != 0>
			<li><a href="/seller/listbrand?pageNo=${pageNo-1}"><@spring.message "page.previous"/></a></li>
		</#if>
		<li><a href="/seller/listbrand?pageNo=${pageNo+1}"><@spring.message "page.next"/></a></li>
	</ul>
</div>