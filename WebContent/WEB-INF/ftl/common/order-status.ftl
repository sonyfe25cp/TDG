<#switch order.orderStatus>
	<#case 0>
		<@spring.message "order.status.new"/>
	<#break>
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
</#switch>