<#if claim.claimType == 'claim'>
	<#switch claim.status>
		<#case 1>
			<@spring.message "order.complain.status.complain"/>
		<#break>
		<#case 2>
			<@spring.message "order.complain.status.uncomplain"/>
		<#break>
		<#case 3>
			<@spring.message "order.complain.status.ok"/>
		<#break>
		<#case 4>
			<@spring.message "order.complain.status.complaining"/>
		<#break>
	</#switch>
<#else>
	<#switch claim.status>
		<#case 1>
			<@spring.message "order.return.status.ongoing"/>
		<#break>
		<#case 2>
			<@spring.message "order.return.status.discard"/>
		<#break>
		<#case 3>
			<@spring.message "order.return.status.ok"/>
		<#break>
		<#case 4>
			<@spring.message "order.return.status.processing"/>
		<#break>
	</#switch>
</#if>