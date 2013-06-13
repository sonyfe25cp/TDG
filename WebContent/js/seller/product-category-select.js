$(document).ready(function(){
	$('.category').click(function(){
		$(this).siblings().each(function(){
			$(this).removeClass('active');
		});
		$(this).addClass('active');
		var cid = $(this).find('input').val();
		$.ajax({
			type: "GET",
			url: "/seller/product/subcategory",
			data: "cid="+cid,
			success: function(data){
				var html="";
				$.each(data,function(index,cate){
					var li = "<li class=\"subcategory\">"+
	    						"<span>"+cate["name"]+"</span>"+
	    						"<input type=\"hidden\" value=\""+cate["id"]+"\"></input>"+
	    					 "</li>";
					html+=li;
				});
				$(".subcategories").html(html);
			},
			error: function(){
				alert("");
			}
		});
	});
	$(".subcategories").delegate(".subcategory","click",function(){
		$(this).siblings().each(function(){
			$(this).removeClass('active');
		});
		$(this).addClass('active');
	});
	
	$('#categoryConfirm').click(function(){
		var li = $('.subcategory').filter('.active');
		if(li.length == 0){
			alert("请选择子类");
		}else{
			var cid =  $(li).find('input').val();
//			alert(cid);
			window.location.href="/seller/product/productadd?cid="+cid;
		}
	});
});