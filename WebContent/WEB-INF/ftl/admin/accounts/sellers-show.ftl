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
					<thead>
						<th></th>
						<th></th>
					</thead>
					<tbody>
						<tr>
							<td><@spring.message "seller.model.id"/></td>
							<td>${seller.id}</td>
						</tr>
						<tr>
							<td><@spring.message "seller.model.email"/></td>
							<td>${seller.email}</td>
						</tr>
						<tr>
							<td><@spring.message "seller.model.business"/></td>
							<td>${seller.businessName}</td>
						</tr>
						<tr>
							<td><@spring.message "seller.model.businessName"/></td>
							<td>${seller.businessName}</td>
						</tr>
						<tr>
							<td><@spring.message "seller.model.website"/></td>
							<td>${seller.companyWebsiteAddress}</td>
						</tr>
						<tr>
							<td><@spring.message "seller.model.productLines"/></td>
							<td>${seller.productLines}</td>
						</tr>
						<tr>
							<td><@spring.message "seller.model.businessAddress"/></td>
							<td>${seller.businessAddress}</td>
						</tr>
						<tr>
							<td><@spring.message "seller.model.firstName"/></td>
							<td>${seller.firstName}</td>
						</tr>
						<tr>
							<td><@spring.message "seller.model.lastName"/></td>
							<td>${seller.lastName}</td>
						</tr>
						<tr>
							<td><@spring.message "seller.model.primaryPhoneNumber"/></td>
							<td>${seller.primaryPhoneNumber}</td>
						</tr>
						<tr>
							<td><@spring.message "seller.model.secondPhoneNumber"/></td>
							<td>${seller.secondPhoneNumber}</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
<#include "/admin/common/template-bottom.ftl">