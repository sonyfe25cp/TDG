$(document).ready(function(){
	$('#complain').click(function(){
		orderId = $('input[name="orderId"]').val();
		reason = $('input[name="complain"]:checked').val();
		data = "orderId="+orderId+"&reasonId="+reason;
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