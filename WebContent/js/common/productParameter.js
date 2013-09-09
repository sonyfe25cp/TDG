$(document).ready(function(){
	$('.productParameters').delegate("button", "click", function(){
		parentTr = $(this).parents("tr");
		parentId = $(parentTr).find("td:first").text();
		$.ajax({
			url: "/productParameter/list",
			data: "parentId="+parentId,
			success: function(data){
				html = "";
				$.each(data, function(index, line){
				if(line["level"] == 2){
					style = "success";
					add ="";
				}else{
					style = "warning";
					add = "<a class=\"btn btn-primary\" href=\"/admin/productParameter/new?parentId="+line["id"]+"\">添加</a>";
				}
				tmp = ""+
					"<tr class='"+style+"'>"+
					"	<td>"+line["id"]+"</td>"+
					"	<td>"+line["name"]+"</td>"+
					"	<td>"+line["english"]+"</td>"+
					"	<td>"+line["pvalue"]+"</td>"+
					"	<td>"+
							"<button class=\"btn btn-info\">查看</button>"+
							"<a class=\"btn btn-info\" href=\"/admin/productParameter/edit?id="+line["id"]+"\">编辑</a>"+
							add+
						"</td>"+
					"</tr>";
					html += tmp;
				});
				$(parentTr).after(html);
			},
			error: function(){
				
			}
		});
	});

});
