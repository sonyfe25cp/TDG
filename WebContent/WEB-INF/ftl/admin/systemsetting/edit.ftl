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
				<form action="/admin/settings/update" method="POST">
					<table class="table">
						<tr>
							<td><@spring.message "systemSetting.model.storeAddress"/></td>
							<td>
								<#if systemSetting.storeAddress??>
									<input name="storeAddress" value=${systemSetting.storeAddress}></input>
								<#else>
									<input name="storeAddress"></input>
								</#if>
							</td>
						</tr>
						<tr>
							<td>
								<@spring.message "menu.options"/>
							</td>
							<td>
								<input type="submit" value=<@spring.message "button.update"/>></input>
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
	<#include "/admin/common/template-bottom.ftl">
</div>