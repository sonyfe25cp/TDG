<#include "/admin/common/template-head.ftl">
<#include "/admin/common/top-banner.ftl">
<div class="container">
	<div class="container-fluid">
		<div class="row-fluid">
		    <div class="span3">
				<#include "/admin/common/left-nav.ftl">
			</div>
			<div class="span9">
				<#if status == 2>
					<#include "/admin/product/product-list-partial-tt.ftl">
				<#else>
					<#include "/admin/product/product-list-partial.ftl">
				</#if>
			</div>
		</div>
	</div>
	<#include "/admin/common/template-bottom.ftl">
</div>