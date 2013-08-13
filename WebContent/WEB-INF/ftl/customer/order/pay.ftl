<#include "/customer/common/template-head.ftl">
<#include "/customer/common/top-banner.ftl">
<div class="container">
	<div class="container-fluid">
		<div class="row-fluid">
		    <div class="span3">
				<#include "/customer/common/left-nav.ftl">
			</div>
			<div class="span9">
				 Money : ${order.price}
				 <a href="/customer/paymoney/callback?orderId=${order.id}">OK</a>
			</div>
		</div>
	</div>
	<#include "/customer/common/template-bottom.ftl">
</div>