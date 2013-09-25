$(document).ready(function(){
	
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
				$.each(data,function(index, item){
					tmp = "<tr class='success'>" +
							"<td>"+item.sku+"</td>" +
							"<td>"+item.featureJson+"</td>" +
							"<td>"+item.retailPrice+"</td>" +
							"<td>"+item.promotionPrice+"</td>" +
							"<td>"+item.wholePrice+"</td>" +
							"<td>"+item.availableQuantity+"</td>" +
							"<td>"+(item.active == 0 ? "Warning" : "OK")+"</td>" +
							"<td></td>" +
							"<td><a class='btn btn-primary' href='/seller/item/edit?itemId="+item.id+"'>Edit</a>" +
								"<a class='btn btn-danger' href='/seller/item/delete?itemId="+item.id+"'>Delete</a></td>";
					html+=tmp;
				});
				$(tr).after(html);
			},
			error: function(data){
				alert('you missed something~~~ please check!');
			}
		});
	});
});