//1
$(document).ready(function(){
	$('#complain').click(function(){
		orderId = $('input[name="orderId"]').val();
		reason = $('input[name="complain"]:checked').val();
		comment = $('input[name="comment"]').text();
		data = "orderId="+orderId+"&reasonId="+reason+"&comment="+comment;
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