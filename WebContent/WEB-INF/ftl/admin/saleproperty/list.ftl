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
						<tr>
							<th><@spring.message "admin.saleproperty.model.id"/></th>
							<th><@spring.message "admin.saleproperty.model.name"/></th>
							<th><@spring.message "admin.saleproperty.model.english"/></th>
							<th><@spring.message "menu.options"/></th>
						</tr>
					</thead>
					<tbody>
						<#list salePropertys as saleProperty>
							<tr>
								<td>${saleProperty.id}</td>
								<td>${saleProperty.name}</td>
								<td>
									<#if saleProperty.english??>
										${saleProperty.english}
									</#if>
								</td>
								<td>
									<a class="btn btn-info" href="/admin/saleproperty/edit?id=${saleProperty.id}"><@spring.message "button.edit"/></a>
								</td>
							</tr>
						</#list>
					</tbody>
				</table>
				<div class="pagination">
				<ul>
					<li><a href="#">First</a></li>
				    <li><a href="#">Prev</a></li>
				    <li><a href="#">Next</a></li>
				    </ul>
				</div>
			</div>
		</div>
	</div>
</div>
<#include "/admin/common/template-bottom.ftl">