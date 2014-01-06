<#include "/admin/common/template-head.ftl">
<#include "/admin/common/top-banner.ftl">
<div class="container">
	<div class="container-fluid">
		<div class="row-fluid">
		    <div class="span3">
				<#include "/admin/common/left-nav.ftl">
			</div>
			<div class="span9">
				<div>
					<a href="/admin/financeRecord/print/${financeRecord.id}" target="_blank" class="btn btn-primary">打印本对账单</a>
				</div>
				<#include "/admin/finance/record-show-partial.ftl">
			</div>
		</div>
	</div>
	<#include "/admin/common/template-bottom.ftl">
</div>