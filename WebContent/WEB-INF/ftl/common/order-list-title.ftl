<#switch status>
	<#case "nopay">
		<@spring.message "order.list.nopay"/>
	<#break>
	<#case "paid">
		<@spring.message "order.list.paid"/>
	<#break>
	<#case "send">
		<@spring.message "order.list.send"/>
	<#break>
	<#case "receive">
		<@spring.message "order.list.receive"/>
	<#break>
	<#case "cut">
		<@spring.message "order.list.cut"/>
	<#break>
	<#case "complain">
		<@spring.message "order.list.complain"/>
	<#break>
	
	<#case "return">
		<@spring.message "order.list.return"/>
	<#break>
	<#case "cancelbyseller">
		<@spring.message "order.list.cancelbyseller"/>
	<#break>
	<#case "all">
		<@spring.message "order.title"/>
	<#break>
</#switch>