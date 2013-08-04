<#include "/customer/common/template-head.ftl">
<#include "/customer/common/top-banner.ftl">
<div class="container">
	<div class="container-fluid">
		<div class="row-fluid">
		    <div class="span3">
				<#include "/customer/common/left-nav.ftl">
			</div>
			<div class="span9">
				<#if customer.accessToken??>
					<p><@spring.message "customer.model.taobao"/> : ${customer.accessToken}</p>
					<p><@spring.message "customer.model.taobaoKey"/> : ${customer.refreshToken}</p>
				<#else>
					<p><a href="https://oauth.taobao.com/authorize?response_type=code&client_id=21575152&redirect_uri=http://127.0.0.1:8080/customer/auth/taobao/callback&state=1212&scope=item&view=web"><@spring.message "customer.taobao.connect"/></a></p>
				</#if>
			</div>
		</div>
	</div>
	<#include "/customer/common/template-bottom.ftl">
</div>