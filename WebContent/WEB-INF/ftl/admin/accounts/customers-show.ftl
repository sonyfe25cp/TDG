<#include "/admin/common/template-head.ftl">
<div class="container">
	<div class="container-fluid">
		<div class="row-fluid">
		    <div class="span3">
				<#include "/admin/common/left-nav.ftl">
			</div>
			<div class="span9">
				<#if customer??>
					<table class="table">
						<tbody>
							<tr>
								<td><@spring.message "customer.model.id"/></td>
								<td>${customer.id}</td>
							</tr>
							<tr>
								<td><@spring.message "customer.model.email"/></td>
								<td>${customer.email}</td>
							</tr>
							<tr>
								<td><@spring.message "customer.model.phonenum"/></td>
								<td>
									<#if customer.phoneNum??>
										${customer.phoneNum}
									</#if>
								</td>
							</tr>
						</tbody>
					</table>
				<#else>
					没有找到该买家用户。
				</#if>
			</div>
		</div>
	</div>
</div>
<#include "/admin/common/template-bottom.ftl">