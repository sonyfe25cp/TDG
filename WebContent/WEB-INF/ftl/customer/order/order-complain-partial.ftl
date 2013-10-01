<script src="/js/customer/order-complain.js"></script>
<legend><@spring.message "order.complain"/></legend>
<form class="form-horizontal" action="#">
  <div class="control-group">
    <label class="control-label" for="inputEmail"><@spring.message "order.complain.label"/></label>
    <div class="controls">
      <input type="radio" name="complain" value="1"><@spring.message "order.complain.one"/></p>
      <input type="radio" name="complain" value="2"><@spring.message "order.complain.two"/></p>
      <input type="radio" name="complain" value="3"><@spring.message "order.complain.three"/></p>
      <input type="radio" name="complain" value="4"><@spring.message "order.complain.four"/></p>
      <input type="radio" name="complain" value="5"><@spring.message "order.complain.five"/></p>
      <input type="radio" name="complain" value="6"><@spring.message "order.complain.six"/></p>
      <input type="radio" name="complain" value="7"><@spring.message "order.complain.seven"/></p>
      <input type="radio" name="complain" value="8"><@spring.message "order.complain.eight"/></p>
      <input type="radio" name="complain" value="9"><@spring.message "order.complain.nine"/></p>
      <input type="radio" name="complain" value="10"><@spring.message "order.complain.ten"/></p>
	  <input type="hidden" name="orderId" value="${orderId}">
    </div>
  </div>
  <div class="control-group">
  	<div class="controls">
  		<input type="submit" id="complain" class="btn btn-danger" value="<@spring.message "button.order.complain"/>">
  	</div>
  </div>
</form>