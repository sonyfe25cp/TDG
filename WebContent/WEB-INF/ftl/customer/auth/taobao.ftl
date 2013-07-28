<#include "/customer/common/template-head.ftl">
<#include "/customer/common/top-banner.ftl">
<div class="container">
	<div class="container-fluid">
		<div class="row-fluid">
		    <div class="span3">
				<#include "/customer/common/left-nav.ftl">
			</div>
			<div class="span9">
				<#if customer.taobao??>
					<p><@spring.message "customer.model.taobao"/> : ${customer.taobao}</p>
					<p><@spring.message "customer.model.taobaoKey"/> : ${customer.taobaoKey}</p>
				<#else>
					<p><a href="/customer/auth/taobao/new"><@spring.message "customer.taobao.connect"/></a></p>
				</#if>
			</div>
		</div>
	</div>
	<#include "/customer/common/template-bottom.ftl">
</div>