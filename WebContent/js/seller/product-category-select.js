$(document).ready(function(){
	$('.category').click(function(){
//		coo = $.cookie('clientlanguage');
		$(this).siblings().each(function(){
			$(this).removeClass('active');
		});
		$(this).addClass('active');
		var parentId = $(this).find('input').val();
		$(".subcategories").empty();
		$('.third-categories').empty();
		$.ajax({
			type: "GET",
			url: "/productLine/list",
			data: "parentId="+parentId,
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
			}
		});
	});
	$(".subcategories").delegate(".subcategory","click",function(){
		$(this).siblings().each(function(){
			$(this).removeClass('active');
		});
		$(this).addClass('active');
		var parentId = $(this).find('input').val();
		$.ajax({
			type: "GET",
			url: "/productLine/list",
			data: "parentId="+parentId,
			success: function(data){
				var html="";
				$.each(data,function(index,cate){
					var li = "<li class=\"third-category\">"+
	    						"<span>"+cate["name"]+"</span>"+
	    						"<input type=\"hidden\" value=\""+cate["id"]+"\"></input>"+
	    					 "</li>";
					html+=li;
				});
				$(".third-categories").html(html);
			},
			error: function(){
			}
		});
	});
	$(".third-categories").delegate(".third-category","click",function(){
		$(this).siblings().each(function(){
			$(this).removeClass('active');
		});
		$(this).addClass('active');
	});
	$('#categoryConfirm').click(function(){
		var ca = $('.category').filter('.active');
		var su = $('.subcategory').filter('.active');
		var th = $('.third-category').filter('.active');
		if(ca.length == 0 || su.length == 0){
			alert("请选择子类");
		}else{
			var ca_id =  $(ca).find('input').val();
			var su_id =  $(su).find('input').val();
			var th_id =  $(th).find('input').val();
			params = "productLine="+ca_id+"&categoryId="+su_id;
			if(th_id != undefined)
			    params = params + "&nodeId="+th_id;
			window.location.href="/seller/product/productadd?"+params;
		}
	});
});