
<#include "/customer/common/template-head.ftl">
<div class="container">
	<div class="container-fluid">
		<div class="row-fluid">
		    <div class="span3">
				<#include "/customer/common/left-nav.ftl">
			</div>
			<div class="span9">
			your email account is : ${customer.email}
			your password is : ${customer.password}
			</div>
		</div>
	</div>
</div>
<#include "/seller/common/template-bottom.ftl">