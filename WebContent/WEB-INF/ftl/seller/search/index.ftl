<#include "/seller/common/template-head.ftl">
<#include "/seller/common/top-banner.ftl">
<script type="text/javascript" src="/js/jquery-ui-1.10.3.custom.min.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css">
<script type="text/javascript" src="/js/seller/search-index.js"></script>
<div class="container">
	<div class="container-fluid">
		<div class="row-fluid">
		    <div class="span3">
				<#include "/seller/common/left-nav.ftl">
			</div>
			<div class="span9">
				<div>
					<legend><@spring.message "seller.search.searchbyorderid"/></legend>
					<form action="/seller/search/byOrderId">
						<table class="table">
							<tr>
								<td><@spring.message "seller.search.orderId"/></td>
								<td><input name="orderId" ></td>
							</tr>
							<tr>
								<td></td>
								<td>
									<input type="submit" value=<@spring.message "seller.search.button"/>>
								</td>
							</tr>
						</table>
					</form>
				</div>
				<div>
					<legend><@spring.message "seller.search.searchbyproductid"/></legend>
					<form action="/seller/search/byProductId">
						<table class="table">
							<tr>
								<td><@spring.message "seller.search.productId"/></td>
								<td><input name="productId" ></td>
							</tr>
							<tr>
								<td></td>
								<td>
									<input type="submit" value=<@spring.message "seller.search.button"/>>
								</td>
							</tr>
						</table>
					</form>
				</div>
				<div>
					<legend><@spring.message "seller.search.searchordersbydate"/></legend>
					<form action="/seller/search/byDateRange">
						<table class="table">
							<tr>
								<td><@spring.message "seller.search.beginDate"/></td>
								<td><input name="beginDate" id="begin" ></td>
							</tr>
							<tr>
								<td><@spring.message "seller.search.endDate"/></td>
								<td><input name="endDate" id="end"></td>
							</tr>
							<tr>
								<td></td>
								<td>
									<input type="submit" value=<@spring.message "seller.search.button"/>>
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