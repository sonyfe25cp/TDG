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
					<th>
						<td><@spring.message "admin.basefeature.model.id"/></td>
						<td><@spring.message "admin.basefeature.model.name"/></td>
						<td><@spring.message "admin.basefeature.model.english"/></td>
					</th>
					<#list baseFeatures as baseFeature>
						<tr>
							<td>${baseFeature.id}</td>
							<td>${baseFeature.name}</td>
							<td>${baseFeature.english}</td>
						</tr>
					</#list>
				</table>
				<div class="pagenation">
				
				</div>
			</div>
		</div>
	</div>
</div>
<#include "/admin/common/template-bottom.ftl">