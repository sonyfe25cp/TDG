<legend><@spring.message "country.show.title"/></legend>
<a href="/admin/country/new" class="btn btn-info"><@spring.message "button.add"/></a>
<table class="table">
	<thead>
		<tr>
			<th><@spring.message "country.model.id"/></th>
			<th><@spring.message "country.model.name"/></th>
			<th><@spring.message "country.model.nameInChinese"/></th>
			<th><@spring.message "menu.options"/></th>
		</tr>
	</thead>
	<tbody class="countrys">
		<#list countries as country>
			<tr>
				<td>${country.id}</td>
				<td>${country.name}</td>
				<td>
					${country.nameInChinese}
				</td>
				<td>
					<!--
					<a class="btn btn-info" href="/admin/country/delete?id=${country.id}"><@spring.message "button.delete"/></a>
					-->
				</td>
			</tr>
		</#list>
	</tbody>
</table>
<div class="pagination">
<ul>
	<li><a href="/admin/country/list">First</a></li>
	<#if pageNo!=0>
	    <li><a href="/admin/country/list?pageNo=${pageNo-1}">Prev</a></li>
	</#if>
    <li><a href="/admin/country/list?pageNo=${pageNo+1}">Next</a></li>
</ul>
</div>