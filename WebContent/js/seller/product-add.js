function getMainInfo(){
	categoryId = $('#categoryId').val();
	name = $('#name').val();
	mainImg = $('#mainimage').attr("src");
	var subImgs = "";
	$('#subimages_tr img').each(function(){
		var tmp = $(this).attr("src")+";";
		subImgs += tmp;
	});
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
            var html = "<img id=\"mainimage\" src=\""+url+"\"/>";
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
				window.location.href="/seller/product/list";
			},
			error: function(data){
				alert('fuck');
			}
		});
	});
});