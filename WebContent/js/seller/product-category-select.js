$(document).ready(function(){
	$('.category').click(function(){
		var cid = $(this).find('input').val();
		$.ajax({
			type: "GET",
			url: "/seller/product/subcategory",
			data: "cid="+cid,
			success: function(){
				
			},
			error: function(){
				alert("");
			}
		});
	});
});