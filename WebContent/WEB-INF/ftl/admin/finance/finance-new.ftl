<#include "/admin/common/template-head.ftl">
<#include "/admin/common/top-banner.ftl">
<script src="/js/common/productParameter.js"></script>
<div class="container">
	<div class="container-fluid">
		<div class="row-fluid">
		    <div class="span3">
				<#include "/admin/common/left-nav.ftl">
			</div>
			<div class="span9">
				<#if unitType == "receive">
					<#include "/admin/finance/finance-new-receive.ftl">
				<#else>
					<#include "/admin/finance/finance-new-send.ftl">
				</#if>
			</div>
		</div>
	</div>
	<#include "/admin/common/template-bottom.ftl">
</div>