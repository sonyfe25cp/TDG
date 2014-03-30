//1
function getMainInfo(){
	categoryId = $('#categoryId').val();
	nodeId = $('#nodeId').val();
	productLine = $('#productLine').val();
	
	name = $('#name').val();
	mainImg = $('#mainimage').attr("src");
	var subImgs = "";
	$('#images_product_sub img').each(function(){
		var tmp = $(this).attr("src")+";";
		subImgs += tmp;
	});
	var hasChildrenOrNot = $('input[name="hasChildrenOrNot"]:checked').val();
	var hasChildren = 0;
	if(hasChildrenOrNot == 'no'){
		sku = $('#sku').val();
		hasChildren = 0;
	}else if(hasChildrenOrNot == 'yes'){
		sku = 0 ;
		hasChildren = 1;
	}else{
		alert("has children or not should be choosed.");
	}
	internationalShippingService = $('input[name="internationalShippingService"]:checked').val();
	issParam = "";
	if(internationalShippingService == 'yes'){
		iss = true;
		var ifee = $('input[name="internationalShippingFee"]').val();
		var idays = $('input[name="internationalPromiseDays"]').val();
		issParam = "iss=1&ifee="+ifee+"&idays="+idays;
	}else{
		iss = false;
		issParam = "iss=0";
	}
	
	return "categoryId=" + categoryId + (nodeId == undefined ?"":("&nodeId=" + nodeId)) + "&productLine=" + productLine +
		"&name=" + name +"&sku="+ sku + "&hasChildren="+ hasChildren + "&mainImg=" + mainImg + "&subImgs=" + subImgs + "&" + issParam +"&";
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
	var description = editor.html();
	others = others + "description="+description+"&";
	return others;
}
function getAll(){
	var main = getMainInfo();
//	var params = getParams();
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
	$( "#promotionTime" ).datepicker({ dateFormat: "yy-mm-dd" });
	$( "#promotionTime2" ).datepicker({ dateFormat: "yy-mm-dd" });
	
	$('#length').blur(function(){
		isFloat(this);
	});
	$('#width').blur(function(){
		isFloat(this);
	});
	$('#height').blur(function(){
		isFloat(this);
	});
	
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
			if(!(undefined == wholePrice  || undefined == minimumQuantity)){
				if(wholePrice > 0 && minimumQuantity > 0){
					if(minimumQuantity > parseInt(value)){
						$(input).parents('.control-group').addClass("error");
						$(input).after("<span class=\"help-inline\">Maximum acceptable quantity setting should higher than or equal to Minimum quantity requirement setting.</span>");
					}else{
						$(input).parents('.control-group').addClass("success");
					}
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
//				if(safeStock > availableQuantity){
//					int_flag = false;
//					$(input).parents('.control-group').addClass("error");
//					$(input).after("<span class=\"help-inline\">available quantity should higher than safe stock</span>");
//				}else{
//					$(input).parents('.control-group').addClass("success");
					int_flag = true;
//				}
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
			}
			if(netWeight < 0 ){
				$(input).parents('.control-group').addClass("error");
				$(input).after("<span class=\"help-inline\">only float number is accepted.</span>");
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
	
	
	 KindEditor.ready(function(K) {
         editor = K.create('#description',{
         	uploadJson : '/seller/upload/image',
         	filePostName : 'image',
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
			url:'/seller/product/addproduct',
			type:'POST',
			data: data,
			success: function(data){
				flag = data['flag'];
				if(flag){
					$('#over').unbind('click');
					$('#over_then_continue').unbind('click');
					$('#over_then_addsub').unbind('click');
					window.location.href="/seller/product/list";
				}else{
					alert(data['object']);
				}
			},
			error: function(data){
				alert('Please complete missing information.');
			}
		});
	});
	$('#over_then_continue').click(function(){
		var data = getAll();
		categoryId = $('#categoryId').val();
		nodeId = $('#nodeId').val();
		productLine = $('#productLine').val();
		$.ajax({
			url:'/seller/product/addproduct',
			type:'POST',
			data: data,
			success: function(data){
				flag = data['flag'];
				if(flag){
					$('#over').unbind('click');
					$('#over_then_continue').unbind('click');
					$('#over_then_addsub').unbind('click');
					window.location.href="/seller/product/productadd?productLine="+productLine+"&categoryId="+categoryId+(nodeId == undefined?"":("&nodeId="+nodeId));
				}else{
					alert(data['object']);
				}
			},
			error: function(data){
				alert('Please complete missing information.');
			}
		});
	});
	$('#over_then_addsub').click(function(){
		var data = getAll();
		$.ajax({
			url:'/seller/product/addproduct',
			type:'POST',
			data: data,
			success: function(data){
				flag = data['flag'];
				if(flag){
					$('#over').unbind('click');
					$('#over_then_continue').unbind('click');
					$('#over_then_addsub').unbind('click');
					productId = data['object'];
					window.location.href="/seller/product/itemadd?productId="+productId;
				}else{
					alert(data['object']);
				}
			},
			error: function(data){
				alert('Please complete missing information.');
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