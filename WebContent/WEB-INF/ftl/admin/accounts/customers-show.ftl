<#include "/admin/common/template-head.ftl">
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
							<td><@spring.message "customer.model.id"/></td>
							<td>${customer.id}</td>
						</tr>
						<tr>
							<td><@spring.message "customer.model.email"/></td>
							<td>${customer.email}</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
<#include "/admin/common/template-bottom.ftl">