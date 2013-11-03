<#include "/seller/common/template-head.ftl">
<#include "/seller/common/top-banner.ftl">
<div class="container">
	<div class="container-fluid">
		<div class="row-fluid">
		    <div class="span3">
				<#include "/seller/common/left-nav.ftl">
			</div>
			<div class="span9">
				 <#include "/seller/order/order-show-partial.ftl"/>
				 <#include "/seller/order/order-carrier-detail.ftl"/>
				 <a href="/seller/order/print/${order.id}" target="_blank" class="btn btn-info">Print this order</a>
			</div>
		</div>
	</div>
	<#include "/seller/common/template-bottom.ftl">
</div>