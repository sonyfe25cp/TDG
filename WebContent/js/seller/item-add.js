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
function isInt(sText) {
	var reInt = /^[0-9]+$/;
	return reInt.test(sText);
}
function isFloat(sText) {
	var reFloat = /^[0-9]+(.[0-9]{1,2})?$/;
	return reFloat.test(sText);
}
$(document).ready(function(){
	
	$(document).delegate("input", "blur", function(){
		var inputName = $(this).attr("name");
		var value = $(this).val();
		input = $(this);
		$(input).parent().find('span').remove();
		$(input).parents('.control-group').removeClass("success").removeClass("error");
		switch(inputName){
		case "retailPrice":
			retailPrice = parseFloat(value);
			money_flag = isFloat(value);
			if(money_flag){
				$(input).parents('.control-group').addClass("success");
			}else{
				$(input).parents('.control-group').addClass("error");
				$(input).after("<span class=\"help-inline\">only float number is accepted.</span>");
			}
			break;
		case "promotionPrice":
			money_flag = isFloat(value);
			if(money_flag){
				if(parseFloat(value) > retailPrice){
					money_flag = false;
					$(input).parents('.control-group').addClass("error");
					$(input).after("<span class=\"help-inline\">promotion price should lower than retailPrice</span>");
				}else{
					money_flag = true;
					$(input).parents('.control-group').addClass("success");
				}
			}else{
				$(input).parents('.control-group').addClass("error");
				$(input).after("<span class=\"help-inline\">only float number is accepted.</span>");
				money_flag = false;
			}
			break;
		case "wholePrice":
			money_flag = isFloat(value);
			if(money_flag){
				if(parseFloat(value) > retailPrice){
					money_flag = false;
					$(input).parents('.control-group').addClass("error");
					$(input).after("<span class=\"help-inline\">whole sale price should lower than retailPrice</span>");
				}else{
					$(input).parents('.control-group').addClass("success");
					money_flag = true;
				}
			}else{
				$(input).parents('.control-group').addClass("error");
				$(input).after("<span class=\"help-inline\">only float number is accepted.</span>");
				money_flag = false;
			}
			break;
		case "promotionTime":
			break;
		case "minimumQuantity":
			minimumQuantity = parseInt(value);
			int_flag = isInt(value);
			if(int_flag){
				$(input).parents('.control-group').addClass("success");
				int_flag = true;
			}else{
				$(input).parents('.control-group').addClass("error");
				$(input).after("<span class=\"help-inline\">only int number is accepted.</span>");
				int_flag = false;
			}
			break;
		case "maximumAcceptQuantity":
			int_flag = isInt(value);
			if(int_flag){
				if(minimumQuantity > parseInt(value)){
					int_flag = false;
					$(input).parents('.control-group').addClass("error");
					$(input).after("<span class=\"help-inline\">minimum quantity should lower than maximum qccept quantity</span>");
				}else{
					$(input).parents('.control-group').addClass("success");
					int_flag = true;
				}
			}else{
				$(input).parents('.control-group').addClass("error");
				$(input).after("<span class=\"help-inline\">only int number is accepted.</span>");
				int_flag = false;
			}
			break;
		case "availableQuantity":
			availableQuantity = parseInt(value);
			int_flag = isInt(value);
			if(int_flag){
				$(input).parents('.control-group').addClass("success");
				int_flag = true;
			}else{
				$(input).parents('.control-group').addClass("error");
				$(input).after("<span class=\"help-inline\">only int number is accepted.</span>");
				int_flag = false;
			}
			break;
		case "safeStock":
			int_flag = isInt(value);
			if(int_flag){
				if(parseInt(value) > availableQuantity){
					int_flag = false;
					$(input).parents('.control-group').addClass("error");
					$(input).after("<span class=\"help-inline\">available quantity should higher than safe stock</span>");
				}else{
					$(input).parents('.control-group').addClass("success");
					int_flag = true;
				}
			}else{
				$(input).parents('.control-group').addClass("error");
				$(input).after("<span class=\"help-inline\">only int number is accepted.</span>");
				int_flag = false;
			}
			break;
		case "netWeight":
			netWeight = parseFloat(value);
			float_flag = isFloat(value);
			if(float_flag){
				$(input).parents('.control-group').addClass("success");
				float_flag = true;
			}else{
				$(input).parents('.control-group').addClass("error");
				$(input).after("<span class=\"help-inline\">only float number is accepted.</span>");
				float_flag = false;
			}
			break;
		case "grossWeight":
			float_flag = isFloat(value);
			if(float_flag){
				if(netWeight > parseFloat(value)){
					float_flag = false;
					$(input).parents('.control-group').addClass("error");
					$(input).after("<span class=\"help-inline\">grossWeight should higher than netWeight</span>");
				}else{
					$(input).parents('.control-group').addClass("success");
					float_flag = true;
				}
			}else{
				$(input).parents('.control-group').addClass("error");
				$(input).after("<span class=\"help-inline\">only float number is accepted.</span>");
				float_flag = false;
			}
			break;
		}
	});
	
	
	
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