function getMainInfo(){
	categoryId = $('#categoryId').val();
	name = $('#name').val();
	mainImg = $('#mainImg').val();
	subImgs = $('#subImgs').val();
	return "categoryId=" + categoryId + "&name=" + name + "&mainImg=" + mainImg + "&subImgs=" + subImgs + "&";
}

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
	$('#params input').each(function(){
		var name = $(this).attr('name');
		var value = $(this).val();
		if(value != ""){
			var tmp = name+":"+value+":0;";
			params += tmp;
		}
	});
	$('#params select').each(function(){
		var name = $(this).attr('name');
		var value = $(this).val();
		if(value != ""){
			var tmp = name+":"+value+":1;";
			params += tmp;
		}
	});
	return "params="+params+"&";
}
function getOthers(){
	var others = "";
	$('#others input').each(function(){
		var name = $(this).attr('name');
		var value = $(this).val();
		if(value != ""){
			var tmp = name+"="+value+"&";
			others += tmp;
		}
	});
	$('#others select').each(function(){
		var name = $(this).attr('name');
		var value = $(this).val();
		if(value != ''){
			var tmp = name+"="+value+"&";
			others += tmp;
		}
	});
	var description = editor.html();
	others = others + "description="+description+"&";
	return others;
}
function getAll(){
	var main = getMainInfo();
	var params = getParams();
	var prices = getPrices();
	var others = getOthers();
	var requestParams = main + params + prices + others ;
	return requestParams;
}
$(document).ready(function(){
	$('#over_without_item').click(function(){
		var data = getAll();
		$.ajax({
			url:'/seller/product/addproduct?hasChildren=0',
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
	$('#over_with_item').click(function(){
		var data = getAll();
		$.ajax({
			url:'/seller/product/addproduct?hasChildren=1',
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