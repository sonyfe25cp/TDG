<#include "/seller/common/template-head.ftl">
<#include "/seller/common/top-banner.ftl">
<div class="container">
	<div class="container-fluid">
		<div class="row-fluid">
		    <div class="span3">
				<#include "/seller/common/left-nav.ftl">
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
						<td><@spring.message "claimItem.model.sellerId"/></td>
						<td><@spring.message "claimItem.model.status"/></td>
						<td><@spring.message "menu.options"/></td>
					</tr>
					<#list claims as claim>
						<tr>
							<td>${claim.id}</td>
							<td><a href="/seller/order/show/${claim.claimItemId}">${claim.claimItemId}</a></td>
							<td>${claim.sellerId}</td>
							<td>${claim.sellerId}</td>
							<td>
								<#include "/seller/claim/claim-status.ftl">
							</td>
							<td>
								<a class="btn btn-primary" href="/seller/order/show/${claim.claimItemId}"><@spring.message "button.show"/></a>
							</td>
						</tr>
					</#list>
				
				</table>
			</div>
		</div>
	</div>
	<#include "/seller/common/template-bottom.ftl">
</div>