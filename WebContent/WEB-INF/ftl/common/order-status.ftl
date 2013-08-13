<#switch order.orderStatus>
	<#case 1>
		<@spring.message "order.status.nopay"/>
	<#break>
	<#case 2>
		<@spring.message "order.status.paid"/>
	<#break>
	<#case 3>
		<@spring.message "order.status.send"/>
	<#break>
	<#case 4>
		<@spring.message "order.status.receive"/>
	<#break>
	<#case 5>
		<@spring.message "order.status.cut"/>
	<#break>
	<#case 6>
		<@spring.message "order.status.return"/>
	<#break>
	<#case 7>
		<@spring.message "order.status.error"/>
	<#break>
	<#case 8>
		<@spring.message "order.status.auto"/>
	<#break>
	<#case 9>
		<@spring.message "order.status.cancel"/>
	<#break>
	<#case 10>
		<@spring.message "order.status.complain"/>
	<#break>
</#switch>