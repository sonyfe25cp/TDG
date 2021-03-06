//12
$(document).ready(function(){
	
	$('#submit').click(function(){
		if($('#licenseRead').is(':checked') ){
			var submit_flag = int_flag && text_flag && password_flag && email_flag;
			if(!submit_flag){
				alert("Please fill out complete information");
				return false;
			}
		}else{
			alert('please read the license and agree with it');
			return false;
		}
	});
	
	
	$("input").keypress(function (e) {
		var keyCode = e.keyCode ? e.keyCode : e.which ? e.which : e.charCode;
		if (keyCode == 13) {
			for (var i = 0; i < this.form.elements.length; i++) {
				if (this == this.form.elements[i]) break;
			}
			i = (i + 1) % this.form.elements.length;
			this.form.elements[i].focus();
			return false;
		} else {
			return true;
		}
	});
	$('input[access=email]').blur(function(){
		value = $(this).val();
		input = $(this);
		if(email_flag){
			$(input).parent().find('span').remove();
			$(input).parents('.control-group').removeClass("success").removeClass("error");
			$.ajax({
				url: '/isSellerEmailExist',
				type: "GET",
				data: "email="+value,
				success: function(data){
					if(data == true){
						$(input).after("<span class=\"help-inline\">The email exists.</span>");
						$(input).parents('.control-group').addClass("error");
						email_flag = false;
					}else{
						$(input).parents('.control-group').addClass("success");
						email_flag = true;
					}
				},
				error: function(){
				}
			});
		}
	});
});