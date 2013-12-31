<#include "/admin/common/template-head.ftl">
<#include "/admin/common/top-banner.ftl">
<script src="/js/common/productParameter.js"></script>
<div class="container">
	<div class="container-fluid">
		<div class="row-fluid">
		    <div class="span3">
				<#include "/admin/common/left-nav.ftl">
			</div>
			<div class="span9">
				<legend>查看财务项</legend>
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
							<#if financeUnit.relatedType == "translationTask">
								<a href	="/admin/translationTask/show/${financeUnit.relatedId}">${financeUnit.relatedId}</a>
							<#elseif financeUnit.relatedType == "order">
								<a href="/admin/order/show/${financeUnit.relatedId}">${financeUnit.relatedId}</a>
							<#else>
							
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
							${financeUnit.money}
						</td>
					</tr>
					<#if financeUnit.comment??>
						<tr>
							<td><@spring.message "financeunit.model.comment"/></td>
							<td>
								<textarea name="comment" cols="4" row="3" class="field span6">${financeUnit.comment}</textarea>
							</td>
						</tr>
					</#if>
				</table>
			</div>
		</div>
	</div>
	<#include "/admin/common/template-bottom.ftl">
</div>