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
						<td>${claim.id}</td>
					</tr>
					<tr>
						<td><@spring.message "claimItem.model.claimTypeId"/></td>
						<td><a href="/admin/order/show/${claim.claimItemId}">${claim.claimItemId}</a></td>
					</tr>
					<tr>
						<td><@spring.message "claimItem.model.sellerId"/></td>
						<td><a href="/admin/accounts/sellers/${claim.sellerId}">${claim.sellerId}</a></td>
					</tr>
					<tr>
						<td><@spring.message "claimItem.model.customerId"/></td>
						<td><a href="/admin/accounts/customers/${claim.customerId}">${claim.customerId}</a></td>
					</tr>
					<tr>
						<td><@spring.message "claimItem.model.status"/></td>
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
					</tr>
					<tr>
						<td><@spring.message "claimItem.model.comment"/></td>
						<td>
							<textarea cols="12" class="field span12" rows="5">
							<#if claim.comment??>
								${claim.comment}
							<#else>No comment by customer</#if>
							</textarea>
						</td>
					</tr>
					<tr>
						<td><@spring.message "claimItem.model.commentByAdmin"/></td>
						<td>
							<textarea name="commentByAdmin" cols="12" class="field span12" rows="5"><#if claim.commentByAdmin??>${claim.commentByAdmin}
							<#else>No comment by Admin</#if>
							</textarea>
						</td>
					</tr>
					<tr>
						<td><@spring.message "menu.options"/></td>
						<td>
							<a class="btn primary" href="/admin/claim/edit?id=${claim.id}"><@spring.message "button.edit"/></a>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	<#include "/admin/common/template-bottom.ftl">
</div>