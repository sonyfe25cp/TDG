<#include "/customer/common/template-head.ftl">
<#include "/customer/common/top-banner.ftl">
<div class="container">
	<div class="container-fluid">
		<div class="row-fluid">
		    <div class="span3">
				<#include "/customer/common/left-nav.ftl">
			</div>
			<div class="span9">
				<p>your email account is : ${customer.email}</p>
				<p>your password is : ${customer.password}</p>
			</div>
		</div>
	</div>
	<#include "/customer/common/template-bottom.ftl">
</div>