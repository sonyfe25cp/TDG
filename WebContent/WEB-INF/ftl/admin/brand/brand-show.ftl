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
						<td><@spring.message "brand.id"/></td>
						<td>${brand.id}</td>
					</tr>
					<tr>
						<td><@spring.message "brand.name"/></td>
						<td>${brand.name}</td>
					</tr>
					<tr>
						<td><@spring.message "brand.nameInChinese"/></td>
						<td>
							<#if brand.nameInChinese??>
								${brand.nameInChinese}
							</#if>
						</td>
					</tr>
					<tr>
						<td><@spring.message "brand.description"/></td>
						<td>
							${brand.description}
						</td>
					</tr>
					<tr>
						<td><@spring.message "brand.descriptionInChinese"/></td>
						<td>
							<#if brand.descriptionInChinese??>
								${brand.descriptionInChinese}
							</#if>
							</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	<#include "/admin/common/template-bottom.ftl">
</div>