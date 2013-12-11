<#include "/customer/common/template-head.ftl">
<#include "/customer/common/top-banner.ftl">
<div class="container">
	<div class="container-fluid">
		<div class="row-fluid">
		    <div class="span3">
				<#include "/customer/common/left-nav.ftl">
			</div>
			<div class="span9">
				 <legend>退货</legend>
				 <table class="table">
				 	<tr>
				 		<td>退货地址：</td>
				 		<td>
				 			<#if shopSetting.backAddress??>
				 			${shopSetting.backAddress}
				 			<#else>
				 				卖家还没有填退货地址
				 			</#if>
				 		</td>
				 	</tr>
				 </table>
				 <p>
				 	退货须知：blablablabla
				 </p>
				 <form action="/customer/order/returnConfirm" method="POST">
				 <table class="table">
				 	<tr>
				 		<td>退货说明:</td>
				 		<td><textarea name="comment"></textarea></td>
				 	</tr>
				 	<tr>
				 		<td>
				 			<input type="hidden" name="orderId" value=${orderId}></input>
				 		</td>
				 		<td>
							<input type="submit" class="btn btn-primary" value="确认退货"></a>
						</td>
				 	</tr>
				 <table>
				 </form>
			</div>
		</div>
	</div>
	<#include "/customer/common/template-bottom.ftl">
</div>