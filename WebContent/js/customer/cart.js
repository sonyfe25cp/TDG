$(document).ready(function(){
	
	$('#addtocart').click(function(){
		var skuId = $(this).attr('value'); 
		var data = "id="+skuId+"&number=1"
		$.ajax({
			url:'/addtocart',
			type:'GET',
			data: data,
			success: function(data){
				alert('add success');
			},
			error: function(data){
				alert('add error');
			}
		});
	});
	
	$('#carts input').on('blur',function(){
		
	});
	
});