<#switch financeUnit.financeType>
	<#case 1>
		<#switch financeUnit.financeDetailsType>
			<#case 11>
				<@spring.message "financeunit.11"/>
			<#break>
			<#case 12>
				<@spring.message "financeunit.12"/>
			<#break>
			<#case 13>
				<@spring.message "financeunit.13"/>
			<#break>
		</#switch>
	<#break>
	<#case 2>
		<#switch financeUnit.financeDetailsType>
			<#case 21>
				<@spring.message "financeunit.21"/>
			<#break>
			<#case 22>
				<@spring.message "financeunit.22"/>
			<#break>
		</#switch>
	<#break>
	<#case 3>
		<@spring.message "financeunit.3"/>
	<#break>
	<#case 4>
		<#if financeUnit.financeDetailsType??>
		<#switch financeUnit.financeDetailsType>
			<#case 41>
				<@spring.message "financeunit.41"/>
			<#break>
			<#case 42>
				<@spring.message "financeunit.42"/>
			<#break>
		</#switch>
		</#if>
	<#break>
	<#case 5>
		<@spring.message "financeunit.5"/>
	<#break>
	<#case 6>
		<@spring.message "financeunit.6"/>
	<#break>
	<#default>
		${financeUnit.financeType}
	<#break>
</#switch>