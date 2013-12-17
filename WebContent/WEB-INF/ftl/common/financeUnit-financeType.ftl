<#switch financeUnit.financeType>
	<#case 1>
		<#switch financeUnit.financeDetailsType>
			<#case 11>
				普通订单
			<#break>
			<#case 12>
				订单投诉
			<#break>
			<#case 13>
				订单退款
			<#break>
		</#switch>
	<#break>
	<#case 2>
		<#switch financeUnit.financeDetailsType>
			<#case 21>
				翻译
			<#break>
			<#case 22>
				重复翻译
			<#break>
		</#switch>
	<#break>
	<#case 3>
		仓库费用
	<#break>
	<#case 4>
		<#if financeUnit.financeDetailsType??>
		<#switch financeUnit.financeDetailsType>
			<#case 41>
				平台服务费
			<#break>
			<#case 42>
				平台服务退款
			<#break>
		</#switch>
		</#if>
	<#break>
	<#case 5>
		上期余款
	<#break>
	<#case 6>
		其它
	<#break>
	<#default>
		${financeUnit.financeType}
	<#break>
</#switch>