<#include "/seller/common/template-head.ftl">
<#include "/seller/common/top-banner.ftl">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css">
<script type="text/javascript" src="/js/jquery-ui-1.10.3.custom.min.js"></script>
<script src="/js/omartech.check.input-en.js"></script>
<script>
	$(document).ready(function(){
		$( "#sendAt" ).datepicker({ dateFormat: "yy-mm-dd" });
	});
</script>
<div class="container">
	<div class="container-fluid">
		<div class="row-fluid">
		    <div class="span3">
				<#include "/seller/common/left-nav.ftl">
			</div>
			<div class="span9">
				 <#include "/seller/order/order-show-partial.ftl"/>
				 <div class="row-fluid">
				 	<div class="span6">
						 <form action="/seller/order/updateShipping" class="" method="post">
							 <div class="control-group">
									<label class="control-label"><@spring.message "seller.order.sendDate"/></label>
									<div class="controls">
										<input type="text" name="sendAt" id= "sendAt" value="${order.sendAt?date}" access="text"/>
										<input type="hidden" name="orderId" value= "${order.id}"/>
								    </div>
							 </div>
							 <div class="control-group">
									<label class="control-label"><@spring.message "seller.order.kuaidi"/></label>
									<div class="controls">
										<textarea name="carrier" class="field span6">${order.carrier}</textarea>
								    </div>
							 </div>
							 <div class="control-group">
									<label class="control-label"><@spring.message "seller.order.tracking"/></label>
									<div class="controls">
										<textarea name="trackingWeb" class="field span6">${order.trackingWeb}</textarea>
								    </div>
							 </div>
							 <div class="control-group">
									<label class="control-label"><@spring.message "seller.order.trackingId"/></label>
									<div class="controls">
										<textarea name="trackingId" class="field span6">${order.trackingId}</textarea>
								    </div>
							 </div>
							 <input type="submit" id="submit" class="btn btn-primary" value=<@spring.message "button.update"/>>
						 </form>
					</div>
					<div class="span6">
												<h4>IMPORTANT NOTICE</h4>
<p>1. You're required to provide sound shipment information here within 3 days that you receive the order.</p>
<p>2. It's important for you to input correct, trackable and complete information here for your shipment, so that your
	customer can arrange transshipment into China appropriately and track shipment on time.</p>
<p>3. If you ship products in the order separately. Please indiate the product items in each package, shipment tracking ID and
	<p>carrier name separately and clearly here:</p>
	<p>Example of  multi-shipments in one order:</p>
	<p>Carrier Name : Pack1 DHL; Pack2:UPS</p>
	<p>Tracking ID: Pack1: Levi's Women's 524 Skinny Jean, 2pcs, DHLID: 123456</p>
				 <p>Pack2: Calvin Klein Jeans Women's Sweater, 1pc, UPSID:654321</p>
					</div>
				</div>
				 <a href="#" onclick="window.print()"><@spring.message "seller.order.print"/></a>
			</div>
		</div>
	</div>
	<#include "/seller/common/template-bottom.ftl">
</div>