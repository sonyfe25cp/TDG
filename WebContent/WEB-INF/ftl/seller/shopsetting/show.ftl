<#include "/seller/common/template-head.ftl">
<#include "/seller/common/top-banner.ftl">
<div class="container">
	<div class="container-fluid">
		<div class="row-fluid">
		    <div class="span3">
				<#include "/seller/common/left-nav.ftl">
			</div>
			<div class="span9">
				<#if shopsetting??>
					<table class="table">
						<tr>
							<td><@spring.message "seller.shopsetting.model.shippingCountry"/></td>
							<td>${shopsetting.shippingCountry}</td>
						</tr>
						<tr>
							<td><@spring.message "seller.shopsetting.model.shippingPromiseDays"/></td>
							<td>${shopsetting.shippingPromiseDays}</td>
						</tr>
						<tr>
							<td><@spring.message "seller.shopsetting.model.defaultCoinage"/></td>
							<td>
								<#switch shopsetting.defaultCoinage>
									<#case 1>$<#break>
									<#case 2>€<#break>
									<#case 3>￡<#break>
									<#case 4>JPY<#break>
									<#case 5>CNY<#break>
									<#default>$
								</#switch>
							</td>
						</tr>
						<tr>
							<td><@spring.message "seller.shopsetting.model.title"/></td>
							<td>${shopsetting.title}</td>
						</tr>
						<tr>
							<td><@spring.message "seller.shopsetting.model.description"/></td>
							<td>${shopsetting.description}</td>
						</tr>
					</table>
					<a href="/seller/shopsetting/edit" class="btn"><@spring.message "seller.shopsetting.modify"/></a>
				<#else>
					<a href="/seller/shopsetting/new"><@spring.message "seller.shopsetting.create"/></a>
				</#if>
			</div>
		</div>
	</div>
	<#include "/seller/common/template-bottom.ftl">
</div>