$(document).ready(function(){
	$('#addtocart').click(function(){
		var skuId = $(this).attr('value'); //若无单品则传productId
		if(skuId == undefined){
			return;
		}
		var data = "sku="+skuId+"&number=1&hasChildren="+$('#hasChildren').val();
		$.ajax({
			url:'/addtocart',
			type:'GET',
			data: data,
			success: function(data){
				$('#addtocart').removeClass('btn-danger').text('已添加到购物车');
			},
			error: function(data){
				alert('添加失败');
			}
		});
	});
	$('#carts input').on('blur',function(){
		count = $(this).val()+"";
		count = count.replace(new RegExp("[^0-9]","gm"),"");
		$(this).val(count);
		tr = $(this).parents("tr");
		item_id = $(tr).find('input[name="itemId"]').val();
		data = "id="+item_id+"&count="+count;
		$.ajax({
			url:'/product/price',
			type:'GET',
			data: data,
			success: function(data){
				$(tr).find('td.price').html(data);
				data = parseInt(data);
				$(tr).find('td.sum').html(count * data);
				fresh_sum();
			},
			error: function(data){
				alert('add error');
			}
		});
	});
	function fresh_sum(){
		total = 0;
		$('#carts tr').each(function(){
			tmp = $(this).find('td.sum').text();
			tmp = parseInt(tmp);
			total+=tmp;
		});
		$('#total').text(total);
	}
	
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
		}else{
			alert("please choose an address");
		}
	});
});