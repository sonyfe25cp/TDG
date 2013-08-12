<#include "/translator/common/template-head.ftl">
<div class="container">
<div class="container-fluid">
	<div class="row-fluid">
	    <div class="span3">
			<#include "/translator/common/left-nav.ftl">
		</div>
		<div class="span9">
			<@spring.message "translator.index.hello"/>
			<#if notice.content??>
				${notice.content}
			</#if>
		</div>
	</div>
</div>
<#include "/translator/common/template-bottom.ftl">