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
				 <form action="/seller/order/send" class="">
					 <div class="control-group">
							<label class="control-label"><@spring.message "seller.order.sendDate"/></label>
							<div class="controls">
								<input type="text" name="sendAt" id= "sendAt"/>
								<input type="hidden" name="orderId" value= "${order.id}"/>
						    </div>
					 </div>
					 <div class="control-group">
							<label class="control-label"><@spring.message "seller.order.kuaidi"/></label>
							<div class="controls">
								<input type="text" name="carrier"/>
						    </div>
					 </div>
					 <div class="control-group">
							<label class="control-label"><@spring.message "seller.order.tracking"/></label>
							<div class="controls">
								<input type="text" name="trackingWeb"/>
						    </div>
					 </div>
					 <div class="control-group">
							<label class="control-label"><@spring.message "seller.order.trackingId"/></label>
							<div class="controls">
								<input type="text" name="trackingId"/>
						    </div>
					 </div>
					 <button type="submit" class="btn btn-primary"><@spring.message "button.submit"/></button>
				 </form>
				 <a href="#" onclick="window.print()"><@spring.message "seller.order.print"/></a>
			</div>
		</div>
	</div>
	<#include "/seller/common/template-bottom.ftl">
</div>