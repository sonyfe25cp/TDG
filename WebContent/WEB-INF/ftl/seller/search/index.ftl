<#include "/seller/common/template-head.ftl">
<#include "/seller/common/top-banner.ftl">
<div class="container">
	<div class="container-fluid">
		<div class="row-fluid">
		    <div class="span3">
				<#include "/seller/common/left-nav.ftl">
			</div>
			<div class="span9">
				<div>
					<legend>订单号搜索：</legend>
					<form action="/seller/search/byOrderId">
						<table class="table">
							<tr>
								<td>Order ID：</td>
								<td><input name="orderId" ></td>
							</tr>
							<tr>
								<td></td>
								<td>
									<input type="submit" value="搜索"/>
								</td>
							</tr>
						</table>
					</form>
				</div>
				<div>
					<legend>订单号搜索：</legend>
					<form action="/seller/search/byProductId">
						<table class="table">
							<tr>
								<td>Product ID：</td>
								<td><input name="productId" ></td>
							</tr>
							<tr>
								<td></td>
								<td>
									<input type="submit" value="搜索"/>
								</td>
							</tr>
						</table>
					</form>
				</div>
				
			</div>
		</div>
	</div>
	<#include "/seller/common/template-bottom.ftl">
</div>