<#include "/seller/common/template-head.ftl">
<#include "/seller/common/top-banner.ftl">
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
							<label class="control-label"><@spring.message "message.model.content"/></label>
							<div class="controls">
								<input type="hidden" value="${order.id}" name="orderId"/>
								<textarea class="field span9" rows="8" name="comment" placeholder="Content"></textarea>
						    </div>
					 </div>
					 <button type="submit" class="btn btn-primary"><@spring.message "button.submit"/></button
				 </form>
			</div>
		</div>
	</div>
	<#include "/seller/common/template-bottom.ftl">
</div>