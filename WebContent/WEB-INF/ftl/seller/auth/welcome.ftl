<#include "/seller/common/template-head.ftl">
<#include "/seller/common/top-banner.ftl">
<div class="container">
<div class="container-fluid">
	<div class="row-fluid">
	    <div class="span3">
			<#include "/seller/common/left-nav.ftl">
		</div>
		<div class="span9">
			<@spring.message "seller.index.hello"/><p/>
			<@spring.message "seller.model.id"/>: ${seller.id}
			<#if seller.accountStatus == 4>
				<p style="color:red">￼Please note: Your performance are not good recently, please improve it as soon as possible to 
					avoid being blocked.</p>
			</#if>
			<#if notice.content??>
				${notice.content}
			</#if>
		</div>
	</div>
</div>
<#include "/seller/common/template-bottom.ftl">