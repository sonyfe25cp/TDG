<#include "/customer/common/template-head.ftl"/>
<div class="row-fluid">
	<#if flag == false>
		验证码错误，请重新输入
	</#if>
	<div>
		Step2: 检测你的邮箱: ${email}，将验证码填入下面的确认框，并点击‘继续’
	</div>
	<form action="/confirmcustomerpasswordkey" method="post">
		Verification Code: <input name="key"></input>
		<input type="hidden"  type="text" name="email" value="${email}">
		<input type="submit" value="继续"/>
	</form>
</div>

<#include "/customer/common/template-bottom.ftl"/>
