//带子产品的专用
$(document).ready(function(){
	var skus = $('#features').html();
	skus_json =  jQuery.parseJSON(skus);
	sku_type = 0;
	color_map = {};
	size_map = {};
	item_map = {};
	$.each(skus_json, function(index, item_value){
		id = item_value['id'];
		retailPrice = item_value['retailPrice'];
		wholePrice = item_value['wholePrice'];
		feature = item_value['sku'];
		color = feature['color'];
		size = feature['size'];
		beginTime = item_value['promotionTime'];
		endTime = item_value['promotionEnd'];
		proPrice = item_value['promotionPrice'];
		item_tmp = new item(id, retailPrice, wholePrice, beginTime, endTime, proPrice)
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
		co_html = "";
		$.each(color_map,function(index){
			li = "<li>"+index+"</li>"
			co_html += li;
		});
		$('#color').removeClass('hidden');
		$('#color ul').append(co_html);
		$('#color').delegate("li","click",function(){
			$(this).siblings().removeClass("red");
			$(this).addClass("red");
			color_tmp = $(this).text();
			item_select = item_map[color_tmp];
			freshMeat(item_select.id, item_select.retailPrice, item_select.wholePrice);
	    });
		break;
	case 2:
		si_html = "";
		$.each(size_map,function(index){
			li = "<li>"+index+"</li>"
			si_html += li;
		});
		$('#size').removeClass('hidden');
		$('#size ul').append(si_html);
		$('#size').delegate("li","click",function(){
			$(this).siblings().removeClass("red");
			$(this).addClass("red");
			size_tmp = $(this).text();
			item_select = item_map[size_tmp];
			freshMeat(item_select.id, item_select.retailPrice, item_select.wholePrice);
	    });
		break;
	case 3:
		co_html = "";
		$.each(color_map,function(index){
			li = "<li>"+index+"</li>"
			co_html += li;
		});
		$('#color').removeClass('hidden');
		$('#color ul').append(co_html);
		si_html = "";
		$.each(size_map,function(index){
			li = "<li>"+index+"</li>"
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
					freshMeta(item_select.id, item_select.retailPrice, item_select.wholePrice);
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
					freshMeta(item_select.id, item_select.retailPrice, item_select.wholePrice);
				}
			}
	    });
		break;
	}
});
function freshMeta(id, retailPrice, wholePrice){
	$('#retailPrice').html(retailPrice);
	$('#wholePrice').html(wholePrice);
	$('#addtocart').addClass("btn-danger");
	$('#addtocart').attr("value", id)
	flag = true; // cart.js
}
function item(id, retailPrice, wholePrice, beginTime, endTime, proPrice){
	this.id = id;
	this.retailPrice = retailPrice;
	this.wholePrice = wholePrice;
	this.beginTime = beginTime;
	this.endTime = endTime;
	this.proPrice = proPrice;
}