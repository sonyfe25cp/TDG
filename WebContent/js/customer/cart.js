//1
$(document).ready(function(){
	var ChinaCode = 9;
	orderAble = true;
	//212121
	$('#addresses').delegate("input:radio","click",function(){
		wholeCheck();
	});
	/**
	 * 改变购物数量
	 */
	$('#carts input[name="num"]').on('keyup',function(){
		var address = getCurrentAddress();
		if(address.addressId == undefined){
			showErrAddress();
			return false;
		}
		var tr = $(this).parents('tr');
		var itemId = $(tr).find('input[name="itemId"]').val(); //同步数据库中的购物车
		var number = $(this).val();
		if(itemId != undefined && number !=undefined){
			updateCart(itemId, number, true);
		}
		
		wholeCheck();
	});
	
	function wholeCheck(){
		//1.获取地址
		var address = getCurrentAddress();
		
		//2.获取所选物品
//		var items = getItemsWillBuy();
		//3.清空各种警告信息
		clearWarnings();
		//4.对比每个商品的发货地和国际服务 与 选择的地址是否合适
		//	若不合适则标红+警告
		//	若合适则不管
		var countryCode = address.countryCode;
		$('tbody tr').each(function(index){
			var tr = $(this);
			var will = $(this).find('input:checkbox').is(':checked');
			if(will){
				var orderItem = parseItemFromTr(tr);
				var item_countryCode = orderItem.countryCode;
				if(countryCode == item_countryCode){//国家相同，不需要国际运费; 国际运费置，然后刷新当前行
					hideIss(tr);
				}else{
					if(orderItem.iss == 1 && countryCode == ChinaCode){ //如果提供国际运输，显示国际运输费；
						showIss(tr);
					}else{
						showErr(tr);
					}
				}
				var quantityFlag = checkQuantity(orderItem.id, orderItem.count);//检测库存量
				if(!quantityFlag){
					showErrCount(tr);
				}
			}
		});
		//5.计算可下单情况下的价格总额
		fresh_sum();
//		$('.alert').append(""+orderAble);
	}
	function hideIss(tr){
		$(tr).find('td.ifee').text('0');
		freshThisRow(tr);
	}
	function showIss(tr){
		var ifee = $(tr).find('input[name="ifee"]').val();
		if(ifee.length == 0){
			ifee = 0;
		}
		$(tr).find('td.ifee').text(ifee);
		freshThisRow(tr);
	}
	function showErr(tr){
		orderAble = false;
		$(tr).addClass('error');
		var error_html="<div><strong>错误</strong> 所选货物不提供到指定地址的快运服务，请重新选择</div>";
		$('#wrongMatch').removeClass('hidden').append(error_html);
	}
	function showErrCount(tr){
		orderAble = false;
		$(tr).addClass('error');
		var error_html="<div><strong>错误</strong> 所购买货物的数量大于库存或者单笔交易最大购买量，请调整购买数量</div>";
		$('#wrongMatch').removeClass('hidden').append(error_html);
	}
	function showErrAddress(){
		orderAble = false;
		var error_html="<div><strong>错误</strong> 请选择一个收获地址</div>";
		$('#wrongMatch').removeClass('hidden').append(error_html);
	}
	function clearWarnings(){
		orderAble = true;
		$('#wrongMatch').empty().addClass('hidden');
		$('tbody tr').each(function(){
			$(this).removeClass('error');
		});
	}
	//刷新当前行的数据；检查数量是否合适，获取对应价格，计算合计
	function freshThisRow(tr){
		var currentCount = getCurrentCount(tr);
		//1.检测数量是否符合
		var availableQuantity = $(tr).find("input[name='availableQuantity']").val();
		availableQuantity = parseInt(availableQuantity);
		if(currentCount > availableQuantity){//若购买量大于可购买量，标红，不可下单
			showErrCount(tr);
		}
		//2.核算 单价的价格
		var item_id = $(tr).find("input[name='itemId']").val();
		var pair = getRightPrice(item_id, currentCount);
		//更新行内价格
		setPrice(tr, pair);
		//3.核算 合计价格
		var ifee = $(tr).find('td.ifee').text();
		ifee = parseFloat(ifee);
		
		
		var discount_str = $(tr).find('input[name="discount"]').val();
		var discount = parseFloat(discount_str);
		var td_sum = currentCount * (pair.priceRMB * (1 - discount) + ifee);
		$(tr).find('td.sum').html(td_sum.toFixed(2));
		var td_tmpSum = currentCount * (pair.priceRMB + ifee);
		$(tr).find('td.tmpSum').html(td_tmpSum.toFixed(2));
	}
	function setPrice(tr, pricePair){
		$(tr).find('span.price').text(pricePair.price);
		$(tr).find('td.priceRMB').text(pricePair.priceRMB);
	}
	//获取该行的数量并验证
	function getCurrentCount(tr){
		var countInput = $(tr).find('input[name="num"]');
		var count = $(countInput).val()+"";
		count = count.replace(new RegExp("[^0-9]","gm"),"");
		if(count == ''){
			count = 1;
			$(countInput).val(count);
		}
		var currentCount = parseInt(count);
		return currentCount;
	}
	//根据数量和id，取回应该的价格
	function getRightPrice(item_id, count){
		var data = "id="+item_id+"&count="+count;
		var price = 0;
		var priceRMB = 0;
		$.ajax({
			url:'/product/price',
			type:'GET',
			data: data,
			async: false,
			success: function(data){
				price = parseFloat(data['price']);
				priceRMB = parseFloat(data['priceRMB']);
			},
			error: function(data){
				
			}
		});
		var pair = new pricePair(price, priceRMB);
		return pair;
	}
	//从当前行解析数据，真实数据
	function parseItemFromTr(tr){
		var id = $(tr).find('input[name="itemId"]').val();
		var count = $(tr).find('input[name="num"]').val();
		var iss = $(tr).find('input[name="iss"]').val();
		var ifee = $(tr).find('input[name="ifee"]').text();
		if(ifee.length == 0){
			ifee = 0;
		}
		var price = $(tr).find('td.priceRMB').text();
		var countryCode = $(tr).find('input[name="countryCode"]').val();
		var discount = $(tr).find('input[name="discount"]').val();
		var oo = new orderItem(id, count,iss, ifee, countryCode, price, discount);
		return oo;
	}
	function getCurrentAddress(){
		var radio = $('#addresses input:radio:checked');
		var length = radio.length;
		if(length == 0){
			showErrAddress();
		}
		var addressId = $(radio).parents('li').attr('value');
		var countryCode = $(radio).parents('li').find('span').attr('value');
		return new address(addressId, countryCode);
	}
	function address(addressId, countryCode){
		this.addressId = addressId;
		this.countryCode = countryCode;
	}
	
	/**
	 * 添加到购物车
	 */
	$('#addtocart').click(function(){
		var customerId = $('#customerId').text();
		if(customerId == undefined || customerId == 0){
			alert("请先登陆账号，再购买");
			return false;
		}
		var skuId = $(this).attr('value'); //若无单品则传productId
		if(skuId == undefined){
			return;
		}
		var buycount = $('#buycount').val();
		var available = $('#availableQuantity').text();
		buycount = parseInt(buycount);
		available = parseInt(available);
		if(buycount > available){
			alert("购买量大于库存量，请重新输入");
			$('#buycount').val("1");
		}else{
			updateCart(skuId, buycount, false);
		}
	});
	function updateCart(itemId, buyCount, isUpdate){
		var data = "sku="+itemId+"&number="+buyCount+"&isUpdate="+isUpdate;
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
	function checkQuantity(itemId, buyCount){
		var data = "itemId="+itemId+"&number="+buyCount;
		var flag = false;
		$.ajax({
			url:'/product/checkQuantity',
			type:'GET',
			async: false,
			data: data,
			success: function(data){
				flag = data;
			},
			error: function(data){
				flag = false;
			}
		});
		return flag;
	}
	/*
	 * 购物车删除按钮
	 */
	$('#carts a.del').click(function(){
		var tr= $(this).parents('tr');
		var itemId = $(tr).find('input[name="itemId"]').val();
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
		wholeCheck();
	});
	$('input:checkbox').click(function(){
		wholeCheck();
	});
	/**
	 * 计算总数
	 */
	function fresh_sum(){
		var total = 0;
		$('tbody tr').each(function(index){
			var will = $(this).find('input:checkbox').is(':checked');
			if(will){
				var sum = $(this).find('td.sum').text();
				sum = parseFloat(sum);
				total += sum;
			}
		});
		$('#total').text(total);
	}
	/**
	 * 提交订单
	 */
	$('#check').click(function(){
		wholeCheck();
		if(orderAble){//如果没错误就可以点下单
			var willBuy = getItemsWillBuy();
			var address = getCurrentAddress();
			var addressId = address.addressId;
			var data = "addressId="+addressId+"&orderItems="+willBuy;
			$.ajax({
				url:'/order/create',
				type:'POST',
				data: data,
				success: function(data){
					window.location.href="/customer/orders/all";
				},
				error: function(data){
					alert('add error');
				}
			});
		}else{
			alert("请注意看错误提示，修改后再下单");
		}
	});
	
});
/**
 * 定义价格对
 * @param price
 * @param priceRMB
 * @returns
 */
function pricePair(price, priceRMB){
	this.price = price;
	this.priceRMB = priceRMB;
}
/**
 * 定义orderItem类
 */
function orderItem(id, count, iss, ifee, countryCode, price, discount){
	this.id = id;
	this.count = parseInt(count);
	this.iss = iss;
	this.ifee = parseFloat(ifee);
	this.countryCode = countryCode;
	this.price = parseFloat(price);
	this.discount = parseFloat(discount);
	this.sum = price * count + this.ifee;
	this.toJson = '{'+
		'"itemId":'+ id+','+
		'"num":'+count + '}';
}
/**
 * 获取已经选中了的物品
 */
function getItemsWillBuy(){
	var json = "[";
	$('tbody tr').each(function(index){
		var will = $(this).find('input:checkbox').is(':checked');
		if(will){
			var id = $(this).find('input[name="itemId"]').val();
			var count = $(this).find('input[name="num"]').val();
			var tmpJson = '{'+
								'"itemId":'+ id+','+
								'"num":'+count + '},';
			json += tmpJson;
		}
	});
	json = json.substring(0, json.length-1);
	json = json+"]";
	return json;
}