$(document).ready(function(){
	$('#complain').click(function(){
		orderId = $('#orderId').val();
		reason = $('form input[name="complain"]:checked').val();
		data = "orderId="+orderId+"&reasonId="+reason;
		$.ajax({
			url:'/orders/complain',
			type:'POST',
			data: data,
			success: function(data){
				flag = data['flag'];
				message = data['message'];
				alert(message);
			},
			error: function(data){
			}
		});
	});
	
});