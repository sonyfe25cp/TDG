<#include "/seller/common/template-head.ftl">
<#include "/seller/common/top-banner.ftl">
<div class="container">
	<div class="container-fluid">
		<div class="row-fluid">
		    <div class="span3">
				<#include "/seller/common/left-nav.ftl">
			</div>
			<div class="span9">
				<@spring.message "seller.error.item-with-different-feature"/>
			</div>
		</div>
	</div>
	<#include "/seller/common/template-bottom.ftl">
</div>