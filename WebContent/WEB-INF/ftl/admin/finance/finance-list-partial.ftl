<table class="table">
	<thead>
		<tr>
			<th><@spring.message "financeunit.model.id"/></th>
			<th><@spring.message "financeunit.model.createAt"/></th>
			<th><@spring.message "financeunit.model.receiver"/></th>
			<th><@spring.message "financeunit.model.sender"/></th>
			<th><@spring.message "financeunit.model.money"/></th>
			<th><@spring.message "financeunit.model.status"/></th>
			<th><@spring.message "financeunit.model.relatedId" /></th>
			<th><@spring.message "financeunit.model.financeType"/></th>
			<th><@spring.message "financeunit.model.over"/></th>
			<th><@spring.message "menu.options"/></th>
		</tr>
	</thead>
	<tbody>
		<#list financeUnits as financeUnit>
			<tr>
				<td>${financeUnit.id}</td>
				<td>${financeUnit.createAt?date}</td>
				<td>${financeUnit.receiver}</td>
				<td>${financeUnit.sender}</td>
				<td>
					<#include "/common/financeUnit-coinage-select.ftl">
					${financeUnit.money}
				</td>
				<td>${financeUnit.status}</td>
				<td>${financeUnit.relatedId}</td>
				<td>
					<#include "/common/financeUnit-financeType.ftl">
				</td>
				<td>${financeUnit.over}</td>
				<td>
					<#if financeUnit.financeType == 5 || financeUnit.financeType == 6>
					
					</#if>
				</td>
			</tr>
		</#list>
	</tbody>
</table>
<div class="pagination pagination-centered">
	<ul>
		<li><a href="/admin/finance/${showType}/?pageNo=0"><@spring.message "page.first"/></a></li>
		<#if pageNo != 0>
			<li><a href="/admin/finance/${showType}?pageNo=${pageNo-1}"><@spring.message "page.previous"/></a></li>
		</#if>
		<li><a href="/admin/finance/${showType}?pageNo=${pageNo+1}"><@spring.message "page.next"/></a></li>
	</ul>
</div>