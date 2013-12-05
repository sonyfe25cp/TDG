<#include "/admin/common/template-head.ftl">
<#include "/admin/common/top-banner.ftl">
<div class="container">
	<div class="container-fluid">
		<div class="row-fluid">
		    <div class="span3">
				<#include "/admin/common/left-nav.ftl">
			</div>
			<div class="span9">
				<table class="table">
					<tr>
						<td><@spring.message "claimItem.model.id"/></td>
						<td><@spring.message "claimItem.model.claimTypeId"/></td>
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
								<#switch claim.status>
									<#case 1>
										<@spring.message "order.complain.status.complain"/>
									<#break>
									<#case 2>
										<@spring.message "order.complain.status.uncomplain"/>
									<#break>
									<#case 3>
										<@spring.message "order.complain.status.ok"/>
									<#break>
									<#case 4>
										<@spring.message "order.complain.status.complaining"/>
									<#break>
								</#switch>
							</td>
							<td>
								<a class="btn btn-primary" href="/admin/claim/show?id=${claim.id}"><@spring.message "button.show"/></a>
								<a class="btn btn-primary" href="/admin/claim/edit?id=${claim.id}"><@spring.message "button.edit"/></a>
							</td>
						</tr>
					</#list>
				
				</table>
			</div>
		</div>
	</div>
	<#include "/admin/common/template-bottom.ftl">
</div>