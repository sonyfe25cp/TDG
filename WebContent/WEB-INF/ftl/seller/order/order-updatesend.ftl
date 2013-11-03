<#include "/seller/common/template-head.ftl">
<#include "/seller/common/top-banner.ftl">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css">
<script type="text/javascript" src="/js/jquery-ui-1.10.3.custom.min.js"></script>
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
						 <form action="/seller/order/send" class="">
							 <div class="control-group">
									<label class="control-label"><@spring.message "seller.order.sendDate"/></label>
									<div class="controls">
										<input type="text" name="sendAt" id= "sendAt" value="${order.sendAt?date}"/>
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
							 <button type="submit" class="btn btn-primary"><@spring.message "button.submit"/></button>
						 </form>
					</div>
					<div class="span6">
						<h4>Notice</h4>
						<p>If you need to input multiple tracking id, just input it in the area split with comma，like "12713,20112"</p>
						
					</div>
				</div>
				 <a href="#" onclick="window.print()"><@spring.message "seller.order.print"/></a>
			</div>
		</div>
	</div>
	<#include "/seller/common/template-bottom.ftl">
</div>