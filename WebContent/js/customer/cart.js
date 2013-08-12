$(document).ready(function(){
	
	var flag = false;
	
	var hasChildren = $('#hasChildren').val();
	if(hasChildren == "0"){
		$('#addtocart').addClass("btn-danger");
		flag = true;
	}
	
	$('#items span').click(function(){
		$(this).siblings().removeClass("red");
		$(this).addClass("red");
		$('#addtocart').addClass("btn-danger");
		var v = $(this).attr("value");
		$('#addtocart').attr("value",v)
		flag = true;
	});
	
	
	$('#addtocart').click(function(){
		if(flag){
			var skuId = $(this).attr('value'); //若无单品则传productId
			var data = "sku="+skuId+"&number=1&hasChildren="+$('#hasChildren').val();
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
		}
	});
	
	$('#carts input').on('blur',function(){
		
	});
	function getItems(){
		var items = "[";
		$('#carts tr').each(function(){
			var tr = $(this);
			var line = "{";
			$(tr).find("input").each(function(){
				var name = $(this).attr("name");
				var value = $(this).val();
				tmp = name+":"+value+",";
				line += tmp;
			});
			var price = $(tr).find("td.price").text();
			line = line+"price:"+price+"},";
			items += line;
		});
		items = items.substring(0, items.length-1);
		items = items+"]";
		return items;
	}
	$('#check').click(function(){
		address = $('#addresses input:checked').val();
		if(address != ""){
			var orderItems = getItems();
			var data = "addressId="+address+"&orderItems="+orderItems;
			$.ajax({
				url:'/order/create',
				type:'GET',
				data: data,
				success: function(data){
					alert('add success');
					window.location.href="/customer/orders/all";
				},
				error: function(data){
					alert('add error');
				}
			});
		}
	});
});