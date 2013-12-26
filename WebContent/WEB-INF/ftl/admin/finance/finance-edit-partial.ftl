<legend>编辑财务项</legend>
<table class="table">
	<tr>
		<td>ID</td>
		<td>${financeUnit.id}</td>
	</tr>
	<tr>
		<td>时间：</td>
		<td>${financeUnit.createAt?date}</td>
	</tr>
	<tr>
		<td><@spring.message "financeunit.model.receiver"/></td>
		<td>${financeUnit.receiver}</td>
	</tr>
	<tr>
		<td><@spring.message "financeunit.model.sender"/></td>
		<td>${financeUnit.sender}</td>
	</tr>
	<tr>
		<td><@spring.message "financeunit.model.relatedId" /></td>
		<td>
			<#if financeUnit.financeType == 2>
				<a href="/admin/translationTask/show/${financeUnit.relatedId}">${financeUnit.relatedId}</a>
			<#else>
				<a href="/admin/order/show/${financeUnit.relatedId}">${financeUnit.relatedId}</a>
			</#if>
		</td>
	</tr>
	<tr>
		<td><@spring.message "financeunit.model.financeType"/></td>
		<td><#include "/common/financeUnit-financeType.ftl"></td>
	</tr>
	<tr>
		<td>金额：</td>
		<td>
			<#include "/common/financeUnit-coinage-select.ftl">
			<input name="money" />
			<p>注意:货币为卖家的币种,非数字字符将不能保持成功</p>
		</td>
	</tr>
	<tr>
		<td><@spring.message "menu.options"/></td>
		<td><input type="submit" class="btn btn-primary" value=<@spring.message "button.update"/> /></td>
	</tr>
</table>

				