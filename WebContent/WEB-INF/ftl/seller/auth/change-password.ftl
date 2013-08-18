<#include "/seller/common/template-head.ftl"/>
<div class="row-fluid">
	<div>
		step3: Create New Password 
	</div>
	<form action="/changesellerpassword" method="post">
		<input type="hidden" type="text" name="email" value="${email}">
		New Password: <input type="password" name="password" access="password"></input>
		Re-enter New Password<input type="password" type="text" value="" access="repassword">
		<input type="submit" value="Confirm"/>
	</form>
</div>

<#include "/seller/common/template-bottom.ftl"/>
