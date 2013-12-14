<#include "/seller/common/template-head.ftl">
<#include "/seller/common/top-banner.ftl">
<div class="container">
	<div class="container-fluid">
		<div class="row-fluid">
		    <div class="span3">
				<#include "/seller/common/left-nav.ftl">
			</div>
			<div class="span9">
				<div class="alert">
					<strong>Alert:</strong>You are canceling orders after your buyer has paid their purchase, resulting in very bad buyer experience. 
					You would face penalty for such canceling action. Please consider seriously before you submit it.
				</div>
				<form action="/seller/order/cancel/${order.id}" method="post">
					<table class="table">
						<tr>
							<td><@spring.message "seller.order.cancelReason"/></td>
							<td>
								<input type="radio" name="reason" value="1"><@spring.message "seller.order.cancel.first"/>
								<input type="radio" name="reason" value="2"><@spring.message "seller.order.cancel.second"/>
								<input type="radio" name="reason" value="3"><@spring.message "seller.order.cancel.third"/>
								<input type="radio" name="reason" value="4"><@spring.message "seller.order.cancel.fourth"/>
							</td>
						</tr>
						<tr>
							<td><@spring.message "seller.order.cancelComment"/></td>
							<td><textarea name="comment"></textarea></td>
						</tr>
						<tr>
							<td></td>
							<td>
								<button type="submit" class="btn btn-primary"><@spring.message "button.add"/></button>
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
	<#include "/seller/common/template-bottom.ftl">
</div>