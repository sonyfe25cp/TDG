<#include "/customer/common/template-head.ftl">
<#include "/customer/common/top-banner.ftl">
<div class="container">
	<div class="container-fluid">
		<div class="row-fluid">
		    <div class="span3">
				<#include "/customer/common/left-nav.ftl">
			</div>
			<div class="span9">
				 Money : $${order.price}
				 
				 <p/>
				 <p/><a href="/customer/paymoney/callback?orderId=${order.id}">点我来模拟支付宝付钱!</a>
				 <p/>
				 <a href="https://mapi.alipay.com/gatway.do">链接支付宝</a>
				 <h3>尽快申请支付宝相关的账号，没有PARTERID是做不了对接的！！</h3>
			</div>
		</div>
	</div>
	<#include "/customer/common/template-bottom.ftl">
</div>