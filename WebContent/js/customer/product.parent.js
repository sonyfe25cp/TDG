//带子产品的专用
$(document).ready(function(){
	//1
	
	
	
	var skus = $('#features').html();
	skus_json =  jQuery.parseJSON(skus);
	sku_type = 0;
	color_map = {};
	size_map = {};
	item_map = {};
	$.each(skus_json, function(index, item_value){
		var id = item_value['id'];
		var retailPrice = item_value['retailPrice'];
		var wholePrice = item_value['wholePrice'];
		var feature = item_value['sku'];
		var color = feature['color'];
		var size = feature['size'];
		var promotionTime = item_value['promotionTime'];
		var promotionEnd = item_value['promotionEnd'];
		var promotionPrice = item_value['promotionPrice'];
		var image = item_value['image'];
		var minimumQuantity = item_value['minimumQuantity'];
		var maximumAcceptQuantity = item_value['maximumAcceptQuantity'];
		var availableQuantity = item_value['availableQuantity'];
		var internationalShippingService = item_value['internationalShippingService'];
		internationalShippingService = parseInt(internationalShippingService);
		var internationalShippingFee = 0;
		var internationalPromiseDays = 0;
		if(internationalShippingService == 1){
			internationalShippingFee = item_value['internationalShippingFee'];
			internationalPromiseDays = item_value['internationalPromiseDays'];
		}
		var item_tmp = new item(id, retailPrice, wholePrice, promotionTime, promotionEnd, promotionPrice, minimumQuantity, maximumAcceptQuantity, image ,availableQuantity, internationalShippingService ,internationalShippingFee, internationalPromiseDays);
		if(color == undefined){
			sku_type = 2;
			size_map[size]=size;
			item_map[size] = item_tmp;
		}else if(size == undefined){
			sku_type = 1;
			color_map[color]=color;
			item_map[color] = item_tmp;
		}else{
			sku_type = 3;
			color_map[color]=color;
			size_map[size]=size;
			item_map[color+"-"+size] = item_tmp;
		}
	});
	
	switch(sku_type){
	case 1:
		var co_html = "";
		$.each(color_map,function(index){
			li = "<li>"+index+"</li>";
			co_html += li;
		});
		$('#color').removeClass('hidden');
		$('#color ul').append(co_html);
		$('#color').delegate("li","click",function(){
			$(this).siblings().removeClass("red");
			$(this).addClass("red");
			color_tmp = $(this).text();
			item_select = item_map[color_tmp];
			freshMeta(item_select);
	    });
		break;
	case 2:
		var si_html = "";
		$.each(size_map,function(index){
			li = "<li>"+index+"</li>";
			si_html += li;
		});
		$('#size').removeClass('hidden');
		$('#size ul').append(si_html);
		$('#size').delegate("li","click",function(){
			$(this).siblings().removeClass("red");
			$(this).addClass("red");
			size_tmp = $(this).text();
			item_select = item_map[size_tmp];
			freshMeta(item_select);
	    });
		break;
	case 3:
		var co_html = "";
		$.each(color_map,function(index){
			li = "<li>"+index+"</li>";
			co_html += li;
		});
		$('#color').removeClass('hidden');
		$('#color ul').append(co_html);
		si_html = "";
		$.each(size_map,function(index){
			li = "<li>"+index+"</li>";
			si_html += li;
		});
		$('#size').removeClass('hidden');
		$('#size ul').append(si_html);
		
		$('#color').delegate("li","click",function(){
			$(this).siblings().removeClass("red");
			$(this).addClass("red");
			size_tmp = $('#size li.red').text();
			if(size_tmp != undefined){
				color_tmp = $(this).text();
				item_select = item_map[color_tmp+"-"+size_tmp];
				if(item_select !=null){
					freshMeta(item_select);
				}else{
					cleanMeta();
				}
			}
	    });
		$('#size').delegate("li","click",function(){
			$(this).siblings().removeClass("red");
			$(this).addClass("red");
			color_tmp = $('#color li.red').text();
			if(color_tmp != undefined){
				size_tmp = $(this).text();
				item_select = item_map[color_tmp+"-"+size_tmp];
				if(item_select !=null){
					freshMeta(item_select);
				}else{
					cleanMeta();
				}
			}
	    });
		break;
	}
});

function freshMeta(item_select){
	$('#whole').removeClass('hidden');
	$('#promotion').removeClass('hidden');
	$('#international').removeClass('hidden');
	
	$('#retailPrice').html(item_select.retailPrice);
	$('#wholePrice').html(item_select.wholePrice);
	$('#promotionPrice').html(item_select.promotionPrice);
	$('#promotionTime').html(item_select.promotionTime+"--"+item_select.promotionEnd);
	$('#minimumQuantity').html(item_select.minimumQuantity);
	$('#maximumAcceptQuantity').html(item_select.maximumAcceptQuantity);
	$('#internationalShippingFee').text(item_select.internationalShippingFee);
	$('#internationalPromiseDays').text(item_select.internationalPromiseDays);
	$('#availableQuantity').html(item_select.availableQuantity);
	
	newImg ='<div class="item active new">'+
		    	'<img style="height:350px;" src="'+ item_select.image +'" alt="">'+
		    '</div>';
	insertImg(newImg);
	$('#addtocart').addClass("btn-danger");
	$('#addtocart').attr("value", item_select.id);
	flag = true; // cart.js
}

function insertImg(newImg){
	$('.carousel-inner .new').remove();
	$('.carousel-inner .active').removeClass('active');
	$('.carousel-inner').append(newImg);
}
function cleanMeta(){
	$('#retailPrice').html('');
	$('#wholePrice').html('');
	$('#promotionPrice').html('');
	$('#promotionTime').html('');
	$('#minimumQuantity').html('');
	$('#maximumAcceptQuantity').html('');
	$('#internationalShippingFee').text('');
	$('#internationalPromiseDays').text('');
	$('#availableQuantity').html('');
	$('#addtocart').removeClass("btn-danger");
	$('#addtocart').attr("value", '');
	flag = true; // cart.js
}
function item(id, retailPrice, wholePrice, promotionTime, promotionEnd, promotionPrice, minimumQuantity, maximumAcceptQuantity, image, availableQuantity, internationalShippingService ,internationalShippingFee, internationalPromiseDays){
	this.id = id;
	this.retailPrice = retailPrice;
	this.wholePrice = wholePrice;
	this.promotionTime = promotionTime;
	this.promotionEnd = promotionEnd;
	this.promotionPrice = promotionPrice;
	this.minimumQuantity = minimumQuantity;
	this.maximumAcceptQuantity = maximumAcceptQuantity;
	this.image = image;
	this.availableQuantity = availableQuantity;
	this.internationalShippingService =internationalShippingService == 0 ? "不提供国际运输":internationalShippingService;
	this.internationalShippingFee = internationalShippingFee == 0 ? "不提供国际运输":internationalShippingFee;
	this.internationalPromiseDays = internationalPromiseDays == 0 ? "不提供国际运输":internationalPromiseDays;
}