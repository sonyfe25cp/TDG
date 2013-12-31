<#if Session.admin.level == 0>
	<#include "/admin/common/super-left-nav.ftl">
<#else>
	<#include "/admin/common/normal-left-nav.ftl">
</#if>  