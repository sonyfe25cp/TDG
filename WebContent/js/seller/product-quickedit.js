//2211

function getMainInfo(){
	var id = $('#id').val();
	var mainImg = $('#mainimage').attr("src");
	var subImgs = "";
	$('#images_product_sub img').each(function(){
		var tmp = $(this).attr("src")+";";
		subImgs += tmp;
	});
	var internationalShippingService = $('input[name="internationalShippingService"]:checked').val();
	var issParam = "";
	if(internationalShippingService == 'yes'){
		iss = true;
		ifee = $('input[name="internationalShippingFee"]').val();
		idays = $('input[name="internationalPromiseDays"]').val();
		issParam = "iss=1&ifee="+ifee+"&idays="+idays;
	}else{
		iss = false;
		issParam = "iss=0";
	}
	var sku = $('#sku').val();
	if(sku == undefined){//只有无子产品的才有sku
		return "&mainImg=" + mainImg + "&subImgs=" + subImgs + "&" + issParam +"&id=" + id + "&";
	}else{
		return "sku="+ sku + "&mainImg=" + mainImg + "&subImgs=" + subImgs + "&" + issParam +"&id=" + id + "&";
	}
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
	return prices;
}
function getOthers(){
	var others = "";
	$('#others input').each(function(){
		var name = $(this).attr('name');
		var value = $(this).val();
		if(value != ""&& name != undefined){
			var tmp = name+"="+value+"&";
			others += tmp;
		}
	});
	$('#others select').each(function(){
		var name = $(this).attr('name');
		var value = $(this).val();
		if(value != '' && name != undefined){
			var tmp = name+"="+value+"&";
			others += tmp;
		}
		length = $('#length').val();
		width = $('#width').val();
		height = $('#height').val();
		size = length + "*" + width + "*" +height;
		others = others + "sizeWithPackage="+size+"&";
	});
	return others;
}
function getAll(){
	var main = getMainInfo();
	var prices = getPrices();
	var others = getOthers();
	var requestParams = main  + prices + others ;
	return requestParams;
}
function isInt(input) {
	sText = $(input).val();
	sText = sText.replace(new RegExp("[^0-9]","gm"),"");
	$(input).val(sText);
}
function isFloat(sText) {
	sText = $(input).val();
	sText = sText.replace(new RegExp("[^0-9.]","gm"),"");
	$(input).val(sText);
}


$(document).ready(function(){
	
	var international = $('#international').text();
	international = jQuery.parseJSON(international);
	var iss = international['iss'];
	if(iss == 0){
		$(':radio[name="internationalShippingService"][value="no"]').attr("checked", "true");
	}else if(iss == 1){
		$(':radio[name="internationalShippingService"][value="yes"]').attr("checked", "true");
		$('#internationalShippingService').removeClass("hidden");
		$('input[name="internationalShippingFee"]').val(international['isf']);
		$('input[name="internationalPromiseDays"]').val(international['isd']);
	}
	
	var pk = $('#pk').text();
	var pks = pk.split("*");
	$('#length').val(pks[0]);
	$('#width').val(pks[1]);
	$('#height').val(pks[2]);
	
	
	
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
			isFloat(input);
			if(retailPrice > 0 ){
				$(input).parents('.control-group').addClass("success");
			}else{
				$(input).parents('.control-group').addClass("error");
				$(input).after("<span class=\"help-inline\">only float number is accepted.</span>");
			}
			break;
		case "promotionPrice":
			isFloat(input);
			promotionPrice = parseFloat(value);
			if(promotionPrice > 0){
				if(promotionPrice > retailPrice){
					$(input).parents('.control-group').addClass("error");
					$(input).after("<span class=\"help-inline\">promotion price should lower than retailPrice</span>");
				}else{
					$(input).parents('.control-group').addClass("success");
				}
			}
			break;
		case "wholePrice":
			isFloat(input);
			wholePrice = parseFloat(value);
			if(wholePrice > 0){
				if(wholePrice > retailPrice){
					$(input).parents('.control-group').addClass("error");
					$(input).after("<span class=\"help-inline\">whole sale price should lower than retailPrice</span>");
				}else{
					$(input).parents('.control-group').addClass("success");
				}
			}
			break;
		case "promotionTime":
			break;
		case "minimumQuantity":
			minimumQuantity = parseInt(value);
			isInt(input);
			if(wholePrice > 0 && minimumQuantity > 0){
				$(input).parents('.control-group').addClass("success");
			}
			break;
		case "maximumAcceptQuantity":
			isInt(input);
			if(wholePrice > 0 && minimumQuantity > 0){
				if(minimumQuantity > parseInt(value)){
					$(input).parents('.control-group').addClass("error");
					$(input).after("<span class=\"help-inline\">minimum quantity should lower than maximum qccept quantity</span>");
				}else{
					$(input).parents('.control-group').addClass("success");
				}
			}
			break;
		case "availableQuantity":
			availableQuantity = parseInt(value);
			isInt(input);
			if(availableQuantity > 0){
				$(input).parents('.control-group').addClass("success");
				int_flag = true;
			}else{
				int_flag = false;
			}
			break;
		case "safeStock":
			isInt(input);
			safeStock = parseInt(value);
			if(safeStock > 0){
				if(safeStock > availableQuantity){
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
			isFloat(value);
			if(netWeight > 0 ){
				$(input).parents('.control-group').addClass("success");
				float_flag = true;
			}else{
				$(input).parents('.control-group').addClass("error");
				$(input).after("<span class=\"help-inline\">only float number is accepted.</span>");
				float_flag = false;
			}
			break;
		case "grossWeight":
			isFloat(value);
			grossWeight = parseFloat(value);
			if(grossWeight > 0 ){
				if(netWeight > grossWeight){
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
    $('#subImgs').uploadify({
        'swf'      : '/js/uploadify.swf',
        'uploader' : '/seller/upload/image',
        'multi': true,
        'fileObjName':'image',
        'auto' : true,
        'fileDesc' : 'jpg, png, jpeg, bmp',
        'fileExt' : '*.jpg; *.png; *.jpeg; *.bmp',
        'sizeLimit' : '2MB',
        'uploadLimit' : 8,
        'onUploadSuccess':function(file, data, response){
            var jsonObject = jQuery.parseJSON(data);
            var urls = jsonObject['url'].split(";");
            for(var i=0; i<urls.length; i++){
            	var url = urls[i];
            	var td_html = "<td><img class=\"img-polaroid\" src=\""+url+"\"><a class=\"btn\">delete</a></td>";
            	$("#images_product_sub").append(td_html);
            }
        }
    });
    $('#images_product_main').delegate("a","click",function(){
    	$(this).parent().empty();
    });
    $('#images_product_sub').delegate("a","click",function(){
    	$(this).parent().remove();
    });
	$('#over').click(function(){
		var data = getAll();
		$.ajax({
			url:'/seller/product/quickupdate',
			type:'POST',
			data: data,
			success: function(data){
				flag = data['flag'];
				if(flag)
					window.location.href="/seller/product/list";
				else
					alert(data['object']);
			},
			error: function(data){
				alert('you missed something~~~ please check!');
			}
		});
	});
	$('input[name="hasChildrenOrNot"]').click(function(){
		skutype = $(this).val();
		if(skutype == "no"){
			$('#standAloneSKU').removeClass('hidden');
			$('#parentWithChildSKU').addClass('hidden');
			$('#over_then_addsub').addClass('hidden');
		}else{
			$('#standAloneSKU').addClass('hidden');
			$('#parentWithChildSKU').removeClass('hidden');
			$('#over_then_next').removeClass('hidden');
			$('#over_then_continue').addClass('hidden');
		}
	});
	$('input[name="internationalShippingService"]').click(function(){
		skutype = $(this).val();
		if(skutype == "yes"){
			$('#internationalShippingService').removeClass('hidden');
		}else{
			$('#internationalShippingService').addClass('hidden');
			$('#internationalShippingService input').val("");
		}
	});
	
});