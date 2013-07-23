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
function getParams(){
	var params = "";
	$('#params select').each(function(){
		var name = $(this).attr('name');
		var value = $(this).val();
		if(value != ""){
			var tmp = name+":"+value+";";
			params += tmp;
		}
	});
	params = params + "&";
	$('#params input').each(function(){
		var name = $(this).attr('name');
		var value = $(this).val();
		if(value != ''){
			var tmp = name+"="+value+"&";
			params += tmp;
		}
	});
	return "params="+params;
}
function getAll(){
	var prices = getPrices();
	var params = getParams();
	var all = prices + params;
	return all;
}
$(document).ready(function(){
	$('#over').click(function(){
		var data = getAll();
		$.ajax({
			url:'/seller/product/addItem',
			type:'POST',
			data: data,
			success: function(data){
				window.location.href="/seller/product/list";
			},
			error: function(data){
				alert('fuck, wrong params');
			}
		});
	});
});