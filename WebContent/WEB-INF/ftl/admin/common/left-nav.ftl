<#if Session.admin.level == 0>
	<#include "/admin/common/super-left-nav.ftl">
<#elseif Session.admin.level == 2>
	<#include "/admin/common/finance-left-nav.ftl">
<#else>
	<#include "/admin/common/normal-left-nav.ftl">
</#if>  