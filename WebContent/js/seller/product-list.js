$(document).ready(function(){
	
	$('#edit').click(function(){
		var msg = "Edit option will reset the translation status, are you sure ?"; 
		if (confirm(msg)==true){ 
			return true; 
		}else{ 
			return false; 
		} 
	});
	
	$("tbody").delegate("a.delete-item","click",function(){
		itemId = $(this).attr("value");
		tr = $(this).parents('tr');
		$.ajax({
			url: '/seller/item/delete?itemId='+itemId,
			type: 'GET',
			data: '',
			success: function(data){
				$(tr).hide();
			},
			error: function(data){
				
			}
		});
	});
	
	
	$('tbody button.delete-product').click(function(){
		tr = $(this).parents('tr');
		productId = $(tr).find('td.product-id').text();
		flag = confirm('Are you sure to delete this product ?');
		if(flag)
			$.ajax({
				url:'/seller/product/delete?id='+productId,
				type:'GET',
				data: '',
				success: function(data){
					$(tr).hide();
				},
				error:function(data){
					
				}
			});
	});
	
	$('tbody button.show-children').click(function(){
		tr = $(this).parents('tr');
		productId = $(tr).find('td.product-id').text();
		$.ajax({
			url:'/product/item/'+productId+'.json',
			type:'GET',
			data: '',
			success: function(data){
				html = "";
				$(tr).parent().find('tr.success').remove();
				$.each(data,function(index, item){
					tmp = "<tr class='success'>" +
							"<td>"+item.sku+"</td>" +
							"<td>"+item.featureJson+"</td>" +
							"<td>"+item.retailPrice+"</td>" +
							"<td>"+item.promotionPrice+"</td>" +
							"<td>"+item.wholePrice+"</td>" +
							"<td>"+item.availableQuantity+"</td>" +
							"<td>"+(item.active == 0 ? "Warning" : "OK")+"</td>" +
							"<td>"+(item.sellable == 7 ? "Stop selling" : "OK")+"</td>" +
							"<td><a class='btn btn-primary edit-item' href=\"/seller/item/edit?itemId="+ item.id +"\">Edit</a>" +
								"<a class='btn btn-danger delete-item' value=\""+ item.id +"\">Delete</a></td>";
					html+=tmp;
				});
				$(tr).after(html);
			},
			error: function(data){
				alert('sorry, something is wrong, please contact the admin');
			}
		});
	});
});