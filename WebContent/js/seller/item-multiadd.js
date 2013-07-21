function getPrices(){
	var prices = "";
	$('#prices input').each(function(){
		var name = $(this).attr('name');
		var value = $(this).val();
		if(value != ''){
			var tmp = name+"="+value+"&";
			prices += tmp;
		}
	});
	$('#prices select').each(function(){
		var name = $(this).attr('name');
		var value = $(this).val();
		if(value != ''){
			var tmp = name+"="+value+"&";
			prices += tmp;
		}
	});
	return prices;
}

$(document).ready(function(){
	$('span').click(function(){
		$(this).parent('.controls').find('span').each(function(){
			$(this).removeClass('sku-select');
		});
		$(this).addClass('sku-select');
	});
	$('#check').click(function(){
		var old = $('#groupResults').html();
		var group = "";
		$('#params span.sku-select').each(function(){
				var name = $(this).attr('name');
				var value = $(this).attr('value');
				var tmp = name+":"+value+",";
				group += tmp;
		});
		$('#groupResults').val(old +"|"+group);
	});
	$('#clear').click(function(){
		$('#groupResults').val('');
	});
	function getAll(){
		var prices = getPrices();
		var params = $('#groupResults').val();
		var all = prices+"params:"+params;
		return all;
	}
	
	$('#over').click(function(){
		var data = getAll();
		alert(data);
		$.ajax({
			url:'/seller/product/itemproduct',
			type:'POST',
			data: data,
			success: function(data){
				alert('add success');
			},
			error: function(data){
				alert('fuck');
			}
		});
	});
});