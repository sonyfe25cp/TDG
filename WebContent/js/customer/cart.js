$(document).ready(function(){
//	$('#addresses').delegate("input:radio","click", function(){
//		
//	});
//	$('#click').click(function(){
//	    coo = $.cookie('cart');
//	    json =  jQuery.parseJSON(coo);
//	    json = jQuery.parseJSON(json);
//	    $.each(json, function(index, oi){
//		       id= oi['itemId'];
//		       alert(id);
//		    });
//	    deletefromcart(1000021);
//	});
	
//	function addtocart(itemId, count){
//		
//	}
	function deletefromcart(itemId){
		coo = $.cookie('cart');
		json =  jQuery.parseJSON(coo);
	    json = jQuery.parseJSON(json);
	    newCookie = "\"[";
	    $.each(json, function(index, oi){
		       id= oi['itemId'];
		       count = oi['number'];
		       if(itemId != id){
		    	   json = "{\"itemId:"+ id +",\"number\":"+ count+"},";
		    	   newCookie += json;
		       }
		});
	    newCookie = newCookie.substring(0, newCookie.length-1);
	    newCookie = newCookie+"]\"";
	    alert(newCookie);
	    $.cookie('newcart', escape(newCookie));
	}
	
	
	/**
	 * 判断选中的地址是否与购买物品同一个国家
	 */
	function isSameCountry(items, countryCode){
		flag = true;
		for (var i=0;i<items.length;i++){
			tmp = items[i].countryCode;
			if(tmp != countryCode){
				flag = false;
			}
		}
		return flag;
	}
	/**
	 * 判断items中发货国家是否都一样
	 */
	function isDifferentCountry(items){
		iss = 0;
		if(items.length > 1)
			for (var i=0;i<items.length;i++){
				if(i!=0){
					tmp = items[i].countryCode;
					if(iss != tmp)
						return true;
					else
						return false;
				}else{
					iss = items[i].countryCode;
				}
			}
		else
			return false;
	}
	/**
	 * 判断items中国际运输服务是否都一样
	 */
	function isDifferentISS(items){
		iss = 0;
		if(items.length > 1)
			for (var i=0;i<items.length;i++){
				if(i!=0){
					tmp = items[i].iss;
					if(iss != tmp)
						return true;
					else
						return false;
				}else{
					iss = items[i].iss;
				}
			}
		else
			return false;
	}
	
	/**
	 * 购买数量检测
	 */
	$('#buycount').keyup(function(){
		count = $(this).val()+"";
		count = count.replace(new RegExp("[^0-9]","gm"),"");
		if(count == '0'){
			count = "1";
		}
		$(this).val(count);
	});
	/**
	 * 添加到购物车
	 */
	$('#addtocart').click(function(){
		var skuId = $(this).attr('value'); //若无单品则传productId
		if(skuId == undefined){
			return;
		}
		buycount = $('#buycount').val();
		available = $('#availableQuantity').text();
		buycount = parseInt(buycount);
		available = parseInt(available);
		if(buycount > available){
			alert("购买量大于库存量，请重新输入");
			$('#buycount').val("1");
		}else{
			var data = "sku="+skuId+"&number="+buycount+"&hasChildren="+$('#hasChildren').val();
			$.ajax({
				url:'/addtocart',
				type:'GET',
				data: data,
				success: function(data){
					$('#addtocart').removeClass('btn-danger').text('已添加到购物车');
				},
				error: function(data){
					alert('添加失败');
				}
			});
		}
	});
	/*
	 * 购物车删除按钮
	 */
	$('#carts a.del').click(function(){
		tr= $(this).parents('tr');
		itemId = $(tr).find('input[name="itemId"]').val();
		$.ajax({
			url: '/deletefromcart',
			type: 'GET',
			data: 'sku='+itemId,
			success: function(data){
				$(tr).remove();
				fresh_sum();
			}
		});
	});
	/**
	 * 全选按钮
	 */
	$('input[name="all-select"]').click(function(){
		if(this.checked){
			$('tbody input.cartItem').each(function(){
			  this.checked = true;
			});
		}else{
			$('tbody input.cartItem').each(function(){
			  this.checked = false;
			});
		}
		fresh_sum();
	});
	$('input:checkbox').click(function(){
		fresh_sum();
	});
	/**
	 * 改变购物数量
	 */
	$('#carts input').on('keyup',function(){
		count = $(this).val()+"";
		count = count.replace(new RegExp("[^0-9]","gm"),"");
		if(count == '')
			count = 1;
		$(this).val(count);
		tr = $(this).parents("tr");
		item_id = $(tr).find('input[name="itemId"]').val();
		data = "id="+item_id+"&count="+count;
		$.ajax({
			url:'/product/price',
			type:'GET',
			data: data,
			success: function(data){
				$(tr).find('td.price').html(data);
				data = parseInt(data);
				ifee = $(tr).find('td.ifee').text();
				ifee = parseInt(ifee);
				$(tr).find('td.sum').html(count * data + ifee);
				fresh_sum();
			},
			error: function(data){
				alert('add error');
			}
		});
	});
	/**
	 * 计算总数
	 */
	function fresh_sum(){
		total = 0;
		willbuy = getItemsWillBuy();
		$(willbuy).each(function(item){
			tmp = willbuy[item].sum;
			total+=tmp;
		});
		$('#total').text(total);
	}
	
	function getItems(items){
		var json = "[";
		$(items).each(function(index){
			tmpJson = items[index].toJson+",";
			json += tmpJson;
		});
		json = json.substring(0, json.length-1);
		json = json+"]";
		return json;
	}
	/**
	 * 提交订单
	 */
	$('#check').click(function(){
		radio = $('#addresses input:checked');
		if(radio.length == 0){
			alert("请选择一个收货地址");
			return false;
		}
		address = $(radio).parents('li').attr('value');
		countryCode = $(radio).parents('li').find('span').attr('value');
		willBuy = getItemsWillBuy();
		if(willBuy.length == 0){
			alert('您还没有购买东西哦');
			return false;
		}
		issFlag = isDifferentISS(willBuy);
		if(issFlag){
			alert('购买列表中含有不同的国际运送服务，不能一起下单，请拆分下单');
			return false;
		}
		countryFlag = isDifferentCountry(willBuy);
		if(countryFlag){
			alert('购买列表中的产品是不同发货国家，请拆分下单');
			return false;
		}
		sameFlag = isSameCountry(willBuy, countryCode);
		if(!sameFlag){
			alert('提供国际运输服务的国家与您的地址不同，请使用发货国家相同的地址');
			return false;
		}
		var orderItems = getItems(willBuy);
		var data = "addressId="+address+"&orderItems="+orderItems;
		$.ajax({
			url:'/order/create',
			type:'GET',
			data: data,
			success: function(data){
//				alert('add success');
				window.location.href="/customer/orders/all";
			},
			error: function(data){
				alert('add error');
			}
		});
		
	});
});
/**
 * 定义orderItem类
 */
function orderItem(id, count, iss, ifee, countryCode, price){
	this.id = id;
	this.count = parseInt(count);
	this.iss = iss;
	this.ifee = parseInt(ifee);
	this.countryCode = countryCode;
	this.price = parseInt(price);
	this.sum = price * count + this.ifee;
	this.toJson = '{'+
		'"itemId":'+ id+','+
		'"num":'+count + '}';
}
/**
 * 获取已经选中了的物品
 */
function getItemsWillBuy(){
	var items = new Array();
	i = 0;
	$('tbody tr').each(function(index){
		will = $(this).find('input:checkbox').is(':checked');
		if(will){
			id = $(this).find('input[name="itemId"]').val();
			count = $(this).find('input[name="num"]').val();
			iss = $(this).find('input.iss').val();
			ifee = $(this).find('td.ifee').text();
			price = $(this).find('td.price').text();
			countryCode = $(this).find('input.countryCode').val();
			oi = new orderItem(id, count,iss, ifee, countryCode, price);
			items[i] = oi;
			i++;
		}
	});
	return items;
}