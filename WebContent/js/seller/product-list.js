$(document).ready(function(){
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
							"<td>"+item.active+"</td>" +
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