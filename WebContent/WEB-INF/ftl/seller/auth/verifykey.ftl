<#include "/seller/common/template-head.ftl"/>
<div class="row-fluid">
	<#if flag == false>
		Code is wrong, please redo
	</#if>
	<div>
		Step2: Check your email 
		We have sent a verification code to your email address: ${email}
		with the following subject line “Pass word Assistance”, 
		Please fill out the verification code you received below, 
		then click Continue
	</div>
	<form action="/confirmsellerpasswordkey" method="post">
		Verification Code: <input name="key"></input>
		<input type="hidden"  type="text" name="email" value="${email}">
		<input type="submit" value="Continue"/>
	</form>
</div>

<#include "/seller/common/template-bottom.ftl"/>
