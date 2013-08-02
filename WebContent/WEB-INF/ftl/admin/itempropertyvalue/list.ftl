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
							<th><@spring.message "basefeature.model.id"/></th>
							<th><@spring.message "basefeature.model.name"/></th>
							<th><@spring.message "basefeature.model.english"/></th>
							<th><@spring.message "menu.options"/></th>
						</tr>
					</thead>
					<tbody>
						<#list baseFeatures as baseFeature>
							<tr>
								<td>${baseFeature.id}</td>
								<td>${baseFeature.name}</td>
								<td>
									<#if baseFeature.english??>
										${baseFeature.english}
									</#if>
								</td>
								<td>
									<a class="btn btn-info" href="/admin/property/itempropertyvalue/edit?id=${baseFeature.id}"><@spring.message "button.edit"/></a>
								</td>
							</tr>
						</#list>
					</tbody>
				</table>
				<div class="pagination">
				<ul>
					<li><a href="/admin/property/itempropertyvalue/list">First</a></li>
					<#if pageNo!=0>
					    <li><a href="/admin/property/itempropertyvalue/list?pageNo=${pageNo-1}">Prev</a></li>
					</#if>
				    <li><a href="/admin/property/itempropertyvalue/list?pageNo=${pageNo+1}">Next</a></li>
				</ul>
				</div>
			</div>
		</div>
	</div>
</div>
<#include "/admin/common/template-bottom.ftl">