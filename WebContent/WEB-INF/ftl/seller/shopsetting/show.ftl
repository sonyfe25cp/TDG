<#include "/seller/common/template-head.ftl">
<#include "/seller/common/top-banner.ftl">
<div class="container">
	<div class="container-fluid">
		<div class="row-fluid">
		    <div class="span3">
				<#include "/seller/common/left-nav.ftl">
			</div>
			<div class="span9">
				<legend><@spring.message "seller.nav.shopsetting"/></legend>
				<#if shopsetting??>
					<table class="table table-striped">
						<tr>
							<td colspan="2"><strong>1. Your Store Setting</strong></td>
						</tr>
						<tr>
							<td>StoreID:</td>
							<td>
								${shopsetting.sellerId}
							</td>
						</tr>
						<tr>
							<td><@spring.message "shopsetting.model.shippingCountry"/></td>
							<td>
								<#if country??>
									${country.name}
								</#if>
							</td>
						</tr>
						<tr>
							<td><@spring.message "shopsetting.model.backAddress"/></td>
							<td>
								<#if shopsetting.backAddress??>
									${shopsetting.backAddress}
								</#if>
							</td>
						</tr>
						<tr>
							<td><@spring.message "shopsetting.model.useSystemStoreAddress"/></td>
							<td>
								<#if shopsetting.useSystemStoreAddress == 1>
									<@spring.message "shopsetting.model.useSystemStoreAddress.yes"/>
								<#else>
									<@spring.message "shopsetting.model.useSystemStoreAddress.no"/>
								</#if>
							</td>
						</tr>
						<tr>
							<td><@spring.message "shopsetting.model.shippingPromiseDays"/></td>
							<td>${shopsetting.shippingPromiseDays}</td>
						</tr>
						<tr>
							<td><@spring.message "shopsetting.model.defaultCoinage"/></td>
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
							<td><@spring.message "shopsetting.model.title"/></td>
							<td>${shopsetting.title}</td>
						</tr>
						<tr>
							<td><@spring.message "shopsetting.model.description"/></td>
							<td>${shopsetting.description}</td>
						</tr>
						<tr>
							<td colspan='2'><b>2.The Bank Information for receiving your sales revenue</b></td>
						</tr>
						<tr>
							<td><@spring.message "shopsetting.model.bankName"/></td>
							<td>${shopsetting.bankName}</td>
						</tr>
						<tr>
							<td><@spring.message "shopsetting.model.bankCity"/></td>
							<td>${shopsetting.bankCity}</td>
						</tr>
						<tr>
							<td><@spring.message "shopsetting.model.bankAddress"/></td>
							<td>${shopsetting.bankAddress}</td>
						</tr>
						<tr>
							<td><@spring.message "shopsetting.model.swiftCode"/></td>
							<td>${shopsetting.swiftCode}</td>
						</tr>
						<tr>
							<td><@spring.message "shopsetting.model.accountName"/></td>
							<td>${shopsetting.accountName}</td>
						</tr>
						<tr>
							<td><@spring.message "shopsetting.model.accountNumber"/></td>
							<td>${shopsetting.accountNumber}</td>
						</tr>
					</table>
					<a href="/seller/shopsetting/edit" class="btn btn-primary"><@spring.message "shopsetting.modify"/></a>
				<#else>
					<a href="/seller/shopsetting/new" class="btn btn-primary"><@spring.message "shopsetting.create"/></a>
				</#if>
			</div>
		</div>
	</div>
	<#include "/seller/common/template-bottom.ftl">
</div>