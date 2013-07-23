var template = "<table>"+
	"<tr>"+
		"<td>收件人:</td>"+
	"	<td><input type=\"text\" name=\"name\" value=\"\"></td>"+
	"</tr>"+
	"<tr>"+
		"<td>地址:</td>"+
		"<td><input type=\"text\" name=\"address\" value=\"\"></td>"+
	"</tr>"+
	"<tr>"+
		"<td>城市:</td>"+
		"<td><input type=\"text\" name=\"city\" value=\"\"></td>"+
	"</tr>"+
	"<tr>"+
		"<td>国家:</td>"+
		"<td><input type=\"text\" name=\"country\" value=\"\"></td>"+
	"</tr>"+
	"<tr>"+
		"<td>邮编:</td>"+
		"<td><input type=\"text\" name=\"postCode\" value=\"\"></td>"+
	"</tr>"+
	"<tr>"+
		"<td></td>"+
		"<td><button class=\"btn btn-info\" id=\"create\">添加</button></td>"+
	"</tr>"+
"</table>";
$(document).ready(function(){
	$('#new').click(function(){
		$(this).after(template);
	});
	$('#addresses').delegate("button","click",function(){
		var address = "";
		var table = $(this).parents('table');
		$(table).find('input').each(function(){
			var name = $(this).attr('name');
			var value = $(this).val();
			if(value != ''){
				var tmp = name+"="+value+"&";
				address += tmp;
			}
		});
		$.ajax({
			url:'/address/add',
			type:'GET',
			data: address,
			success: function(data){
				$(table).remove();
				var radio = "<input type=\"radio\" value=\""+data['id']+"\" name=\"address\"/>"
					+data['country']+data['city']+data['address']+data['name']+"--"+data['postCode']+"<p/>";
				$('#new').before(radio);
			},
			error: function(data){
				alert('fuck, wrong params');
			}
		});
	});
});