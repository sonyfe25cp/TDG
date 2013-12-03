<#switch financeUnit.financeType>
	<#case 1>
		normal order
	<#break>
	<#default>
		${financeUnit.financeType}
	<#break>
</#switch>