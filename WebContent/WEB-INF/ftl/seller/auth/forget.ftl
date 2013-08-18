<#include "/seller/common/template-head.ftl"/>
<div class="row-fluid">
	<div>
		Step1: Enter the e-mail address associated with your account, 
		then click Continue. We'll email you a link to a page where you can easily create a new password.
	</div>
	<form action="/forgetasseller">
		Email Address: <input type="text" name="email"></input>
		<input type="submit" value="Continue"/>
	</form>
</div>

<#include "/seller/common/template-bottom.ftl"/>
