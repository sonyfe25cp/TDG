//12
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
function getMeta(){
	var mainImg = $('#mainimage').attr("src");
	var sku = $('#sku').val();
	var itemId = $('#itemId').val();
	return "sku="+ sku + "&mainImg=" + mainImg+"&itemId="+itemId+"&";
}
function getParams(){
	parameterType = $('input[name="parameterType"]:checked').val();
	if(parameterType == 'color'){
		color = $('#color input').val();
		color = removeSymbols(color);
		return 'params="color":"'+color+'"';
	}else if(parameterType == 'size'){
		size = $('#size input').val();
		size = removeSymbols(size);
		return 'params="size":"'+size+'"';
	}else if(parameterType == 'colorandsize'){
		size = $('#size input').val();
		color = $('#color input').val();
		size = removeSymbols(size);
		color = removeSymbols(color);
		return 'params="color":"'+color+'","size":"'+size+'"';
	}else{
		return "";
	}
}
function removeSymbols(text){
	text = text.replace(/['"]/g,'');
	return text;
}
function getAll(){
	var prices = getPrices();
	var params = getParams();
	var meta = getMeta();
	var all = meta + prices + params;
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
	
	var featureJson = $('#featureJson').text();
	featureJson = jQuery.parseJSON(featureJson);
	color = featureJson['color'];
	size = featureJson['size'];
	if(color != undefined && size != undefined){
		$('#color').removeClass('hidden');
		$('#size').removeClass('hidden');
		$('input[name="color"]').val(color);
		$('input[name="size"]').val(size);
		$(':radio[name="parameterType"][value="colorandsize"]').attr("checked", "true");
	}else{
		if(color != undefined){
			$('#color').removeClass('hidden');
			$('input[name="color"]').val(color);
			$(':radio[name="parameterType"][value="color"]').attr("checked", "true");
		}
		if(size != undefined){
			$('#size').removeClass('hidden');
			$('input[name="size"]').val(size);
			$(':radio[name="parameterType"][value="size"]').attr("checked", "true");
		}
	}
	
	
	$( "#promotionTime" ).datepicker({ dateFormat: "yy-mm-dd" });
	$( "#promotionTime2" ).datepicker({ dateFormat: "yy-mm-dd" });
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
			url:'/seller/item/update',
			type:'POST',
			data: data,
			success: function(data){
				window.location.href="/seller/product/list";
			},
			error: function(data){
				alert('wrong input, please check');
			}
		});
	});
	$('#mainImg').uploadify({
        'swf'      : '/js/uploadify.swf',
        'uploader' : '/seller/upload/image',
        'multi': false,
        'fileObjName':'image',
        'auto' : true,
        'fileDesc' : 'jpg, png, jpeg, bmp',
        'fileExt' : '*.jpg; *.png; *.jpeg; *.bmp',
        'sizeLimit' : '2MB',
        'onUploadSuccess':function(file, data, response){
   			var jsonObject = jQuery.parseJSON(data);
   			var url = jsonObject['url'];
   			$(this).parent().find("img").remove();
            $("#images_product_main").empty();
            var html = "<img id=\"mainimage\" style=\"width:160px;height:160px;\" src=\""+url+"\"/><a class='btn'>delete</a>";
            $("#images_product_main").append(html);
        }
    });
    $('#images_product_main').delegate("a","click",function(){
    	$(this).parent().empty();
    });
	$('input[name="parameterType"]').click(function(){
		skutype = $(this).val();
		if(skutype == "color"){
			$('#color').removeClass('hidden');
			$('#size').addClass('hidden');
		}else if(skutype == "size"){
			$('#color').addClass('hidden');
			$('#size').removeClass('hidden');
		}else{
			$('#color').removeClass('hidden');
			$('#size').removeClass('hidden');
		}
	});
	
	$('.parameter span').click(function(){
		$(this).siblings().removeClass("sku-select");
		$(this).addClass("sku-select");
	});
});