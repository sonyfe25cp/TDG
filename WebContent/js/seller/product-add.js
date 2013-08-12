function getMainInfo(){
	categoryId = $('#categoryId').val();
	name = $('#name').val();
	mainImg = $('#mainimage').attr("src");
	sku = $('#sku').val();
	var subImgs = "";
	$('#subimages_tr img').each(function(){
		var tmp = $(this).attr("src")+";";
		subImgs += tmp;
	});
	return "categoryId=" + categoryId + "&name=" + name +"&sku="+ sku + "&mainImg=" + mainImg + "&subImgs=" + subImgs + "&";
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
			retailPrice = value;
			money_flag = isFloat(value);
			if(money_flag){
				$(input).parents('.control-group').addClass("success");
			}else{
				$(input).parents('.control-group').addClass("error");
			}
			break;
		case "promotionPrice":
			money_flag = isFloat(value);
			if(money_flag){
				if(value > retailPrice){
					money_flag = false;
					$(input).parents('.control-group').addClass("error");
					$(input).after("<span class=\"help-inline\">promotion price should lower than retailPrice</span>");
				}else{
					money_flag = true;
					$(input).parents('.control-group').addClass("success");
				}
			}else{
				$(input).parents('.control-group').addClass("error");
				money_flag = false;
			}
			break;
		case "wholePrice":
			money_flag = isFloat(value);
			if(money_flag){
				if(value > retailPrice){
					money_flag = false;
					$(input).parents('.control-group').addClass("error");
					$(input).after("<span class=\"help-inline\">whole sale price should lower than retailPrice</span>");
				}else{
					money_flag = true;
				}
			}else{
				$(input).parents('.control-group').addClass("error");
				money_flag = false;
			}
			break;
		case "promotionTime":
			break;
		case "minimumQuantity":
			minimumQuantity = value;
			int_flag = isInt(value);
			if(int_flag){
				$(input).parents('.control-group').addClass("success");
				int_flag = true;
			}else{
				$(input).parents('.control-group').addClass("error");
				int_flag = false;
			}
			break;
		case "maximumAcceptQuantity":
			int_flag = isInt(value);
			if(int_flag){
				if(minimumQuantity > value){
					int_flag = false;
					$(input).parents('.control-group').addClass("error");
					$(input).after("<span class=\"help-inline\">minimum quantity should lower than maximum qccept quantity</span>");
				}else{
					int_flag = true;
				}
			}else{
				$(input).parents('.control-group').addClass("error");
				int_flag = false;
			}
			break;
		case "availableQuantity":
			availableQuantity = value;
			int_flag = isInt(value);
			if(int_flag){
				$(input).parents('.control-group').addClass("success");
				int_flag = true;
			}else{
				$(input).parents('.control-group').addClass("error");
				int_flag = false;
			}
			break;
		case "safeStock":
			int_flag = isInt(value);
			if(int_flag){
				if(value > availableQuantity){
					int_flag = false;
					$(input).parents('.control-group').addClass("error");
					$(input).after("<span class=\"help-inline\">available quantity should higher than safe stock</span>");
				}else{
					int_flag = true;
				}
			}else{
				$(input).parents('.control-group').addClass("error");
				int_flag = false;
			}
			break;
		case "netWeight":
			netWeight = value;
			float_flag = isFloat(value);
			if(float_flag){
				$(input).parents('.control-group').addClass("success");
				float_flag = true;
			}else{
				$(input).parents('.control-group').addClass("error");
				float_flag = false;
			}
			break;
		case "grossWeight":
			float_flag = isFloat(value);
			if(float_flag){
				if(netWeight > value){
					float_flag = false;
					$(input).parents('.control-group').addClass("error");
					$(input).after("<span class=\"help-inline\">grossWeight should higher than netWeight</span>");
				}else{
					float_flag = true;
				}
			}else{
				$(input).parents('.control-group').addClass("error");
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
            var html = "<img id=\"mainimage\" style=\"width:160px;height:160px;\" src=\""+url+"\"/>";
            $("#mainImg").after(html);
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
            	$("#subimages_tr").append(td_html);
            }
        }
    });
    $('#subimages_tr').delegate("a","click",function(){
    	$(this).parent().remove();
    });
	$('#over_without_item').click(function(){
		var data = getAll();
		$.ajax({
			url:'/seller/product/addproduct?hasChildren=0',
			type:'POST',
			data: data,
			success: function(data){
				window.location.href="/seller/product/list";
			},
			error: function(data){
				alert('you missed something~~~ please check!');
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
				window.location.href="/seller/product/list";
			},
			error: function(data){
				alert('you missed something~~~ please check!');
			}
		});
	});
});