<#if showType??>
	<#if showType == "receive-all">
		<legend>收入列表</legend>
		<a href="/admin/finance/new?unitType=receive" class="btn btn-primary">新增一个收入项</a>
	<#else>
		<legend>支出列表</legend>
		<a href="/admin/finance/new?unitType=send" class="btn btn-primary">新增一个支出项</a>
	</#if>
</#if>
<table class="table">
	<thead>
		<tr>
			<th><@spring.message "financeunit.model.id"/></th>
			<th><@spring.message "financeunit.model.createAt"/></th>
			<th><@spring.message "financeunit.model.receiver"/></th>
			<th><@spring.message "financeunit.model.sender"/></th>
			<th><@spring.message "financeunit.model.money"/></th>
			<th><@spring.message "financeunit.model.relatedId" /></th>
			<th><@spring.message "financeunit.model.financeType"/></th>
			<th><@spring.message "financeunit.model.status"/></th>
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
				<td>
					<#if financeUnit.relatedType??>
						<#if financeUnit.relatedType == "translationTask">
							<a href="/admin/translationTask/show/${financeUnit.relatedId}">${financeUnit.relatedId}</a>
						<#elseif financeUnit.relatedType == "order">
							<a href="/admin/order/show/${financeUnit.relatedId}">${financeUnit.relatedId}</a>
						<#else>
						
						</#if>
						
					</#if>
				</td>
				<td>
					<#include "/common/financeUnit-financeType.ftl">
				</td>
				<td>
				<#if !(financeUnit.receiver?contains('customer') || financeUnit.sender?contains('customer'))>
					<#switch financeUnit.status>
						<#case 0>未付款<#break>
						<#case 1>等待管理员确认<#break>
						<#case 2>在账单中处理<#break>
						<#case 3>付款完毕<#break>
						<#case 4>因投诉|退货被锁定<#break>
					</#switch>
				<#else>
					已到账
				</#if>
				</td>
				<td>
					<#if !(financeUnit.receiver?contains('customer') || financeUnit.sender?contains('customer'))>
						<#switch financeUnit.over>
							<#case 0>未结算<#break>
							<#case 1>需要管理员确认<#break>
							<#case 2>处理中<#break>
							<#case 3>结算完毕<#break>
						</#switch>
					<#else>
						已到账
					</#if>
				</td>
				<td>
					<#if financeUnit.status==1>
						<a href="/admin/finance/show/${financeUnit.id}"><@spring.message "button.show"/></a>
					</#if>
					<#if (financeUnit.financeType == 2 || financeUnit.financeType == 6) && financeUnit.status == 0>
						<a href="/admin/finance/edit/${financeUnit.id}" class="btn btn-primary"><@spring.message "button.edit"/></a>
					</#if>
					<#if showType??>
						<#if financeUnit.financeType == 6 && financeUnit.status == 0>
							<a class="btn" href="/admin/finance/delete?id=${financeUnit.id}&sourceFrom=${showType}"><@spring.message "button.delete"/></a>
						</#if>
					</#if>
				</td>
			</tr>
		</#list>
	</tbody>
</table>
<#if showType??>
	<div class="pagination pagination-centered">
		<ul>
			<li><a href="/admin/finance/${showType}/?pageNo=0"><@spring.message "page.first"/></a></li>
			<#if pageNo != 0>
				<li><a href="/admin/finance/${showType}?pageNo=${pageNo-1}"><@spring.message "page.previous"/></a></li>
			</#if>
			<li><a href="/admin/finance/${showType}?pageNo=${pageNo+1}"><@spring.message "page.next"/></a></li>
		</ul>
	</div>
</#if>