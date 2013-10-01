var template_begin = "<table>"+
	"<tr>"+
		"<td>Name:</td>"+
	"	<td><input type=\"text\" name=\"name\" value=\"\" access=\"text\"></td>"+
	"</tr>"+
	"<tr>"+
		"<td>Address:</td>"+
		"<td><input type=\"text\" name=\"address\" value=\"\" access=\"text\"></td>"+
	"</tr>"+
	"<tr>"+
		"<td>City:</td>"+
		"<td><input type=\"text\" name=\"city\" value=\"\" access=\"text\"></td>"+
	"</tr>";
var template_end=
	"<tr>"+
		"<td>PostCode:</td>"+
		"<td><input type=\"text\" name=\"postCode\" value=\"\" access=\"text\"></td>"+
	"</tr>"+
	"<tr>"+
		"<td><button class=\"btn btn-info add\">Add</button></td>"+
		"<td><a class=\"btn btn-danger cancel\">Cancel</a></td>"+
	"</tr>"+
"</table>";
$(document).ready(function(){
	$('#new').click(function(){
		but = $(this);
		$(this).addClass('hidden');
		$.ajax({
			url:'/country/list',
			type:'GET',
			data: "",
			success: function(data){
				select_html = "<tr><td>Country</td><td><select name='country_id'>"
				$.each(data, function(index, country){
					tmp = '<option value='+country['id']+'>'+country['name']+'</option>';
					select_html +=tmp;
				});
				select_html += '</select></td>';
				html = template_begin + select_html + template_end;
				$(but).after(html);
			},
			error: function(data){
			}
		});
	});
	$('#addresses').delegate("a.cancel","click",function(){
		var table = $(this).parents('table');
		$(table).remove();
		$('#new').removeClass('hidden');
	});
	$('#addresses').delegate("button","click",function(){
		var li = $(this).parents('li');
		var addressId = $(li).attr('value');
		$.ajax({
			url:'/address/'+addressId+'/delete',
			type:'GET',
			data: '',
			success: function(data){
				
			},
			error: function(data){
				
			}
		})
		$(li).remove();
	});
	$('#addresses').delegate("button.add","click",function(){
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
		country_code = $(table).find('select').val();
		address += ('countryCode='+country_code);
		if(address != ""){
			$.ajax({
				url:'/address/add',
				type:'GET',
				data: address,
				success: function(data){
					$(table).remove();
					
					var li = '<li value="'+data['id']+'"><input type="radio" name="address">'+
								'<span value="'+data['countryCode']+'"> '+
									data['country']+','+ data['city']+','+data['address']+','+data['name']+' -- '+data['postCode']+
								'<span>'+
								'<button class="delete">Delete</button>'+
								'</li>';
					
					$('#new').before(li);
					$('#new').removeClass('hidden');
				},
				error: function(data){
				}
			});
		}
		
	});
});