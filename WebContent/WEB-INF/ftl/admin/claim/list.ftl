<#include "/admin/common/template-head.ftl">
<#include "/admin/common/top-banner.ftl">
<div class="container">
	<div class="container-fluid">
		<div class="row-fluid">
		    <div class="span3">
				<#include "/admin/common/left-nav.ftl">
			</div>
			<div class="span9">
				<legend>
					<#if claimType == 'claim'>
						<@spring.message "admin.claim.complainTitle"/>
					<#else>
						<@spring.message "admin.claim.returnTitle"/>
					</#if>
				</legend>
				<table class="table">
					<tr>
						<td><@spring.message "claimItem.model.id"/></td>
						<td>
							<#if claimType == 'claim'>
								<@spring.message "claimItem.model.claimType.claim"/>
							<#else>
								<@spring.message "claimItem.model.claimType.return"/>
							</#if>
						</td>
						<td><@spring.message "claimItem.model.sellerId"/></td>
						<td><@spring.message "claimItem.model.customerId"/></td>
						<td><@spring.message "claimItem.model.status"/></td>
						<td><@spring.message "menu.options"/></td>
					</tr>
					<#list claims as claim>
						<tr>
							<td>${claim.id}</td>
							<td><a href="/admin/order/show/${claim.claimItemId}">${claim.claimItemId}</a></td>
							<td><a href="/admin/accounts/sellers/${claim.sellerId}">${claim.sellerId}</a></td>
							<td><a href="/admin/accounts/customers/${claim.customerId}">${claim.customerId}</a></td>
							<td>
								<#include "/admin/claim/claim-status.ftl">
							</td>
							<td>
								<a class="btn btn-primary" href="/admin/claim/show?id=${claim.id}"><@spring.message "button.show"/></a>
								<#if claim.flag == 1 && (claim.status != 2 && claim.status != 3) >
									<a class="btn btn-primary" href="/admin/claim/edit?id=${claim.id}"><@spring.message "button.edit"/></a>
								</#if>
							</td>
						</tr>
					</#list>
				
				</table>
			</div>
		</div>
	</div>
	<#include "/admin/common/template-bottom.ftl">
</div>