<#include "/admin/common/template-head.ftl">
<#include "/admin/common/top-banner.ftl">
<div class="container">
	<div class="container-fluid">
		<div class="row-fluid">
		    <div class="span3">
				<#include "/admin/common/left-nav.ftl">
			</div>
			<div class="span9">
				<legend><@spring.message "systemSetting.show.title"/></legend>
				<table class="table">
					<tr>
						<td><@spring.message "systemSetting.model.storeAddress"/></td>
						<td>
							<#if systemSetting.storeAddress??>
								${systemSetting.storeAddress}
							<#else>
								没有设定
							</#if>
						</td>
					</tr>
					<tr>
						<td>
							<@spring.message "menu.options"/>
						</td>
						<td>
							<a href="/admin/settings/edit" class="btn btn-primary"><@spring.message "button.edit"/></a>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	<#include "/admin/common/template-bottom.ftl">
</div>