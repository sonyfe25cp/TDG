//1
$(document).ready(function(){
	$('#complain').click(function(){
		var orderId = $('input[name="orderId"]').val();
		var reason = $('input[name="complain"]:checked').val();
		var comment = $('#comment').val();
		var data = "orderId="+orderId+"&reasonId="+reason+"&comment="+comment;
		$.ajax({
			url:'/customer/order/complain',
			type:'POST',
			data: data,
			success: function(data){
				flag = data['flag'];
				message = data['object'];
				alert(message);
				window.location.href="/customer/orders/all";
			},
			error: function(data){
			}
		});
	});
	
});