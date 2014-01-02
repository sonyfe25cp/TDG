//1
$(document).ready(function(){
	$('input[access=email]').blur(function(){
		value = $(this).val();
		input = $(this);
		if(email_flag){
			$(input).parent().find('span').remove();
			$(input).parents('.control-group').removeClass("success").removeClass("error");
			$.ajax({
				url: '/isCustomerEmailExist',
				type: "GET",
				data: "email="+value,
				success: function(data){
					if(data == true){
						$(input).after("<span class=\"help-inline\">邮箱已存在</span>");
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
	$('#submit').click(function evt(){
		checkInput;
		flag = email_flag && password_flag && repassword_flag && int_flag;
		if(!flag){
			alert('请认真填写完所有信息。');
			return false;
//			evt = evt || window.event;  
//	        if (window.event) {//IE  
//	            window.event.returnValue = false;  
//	        } else {  
//	            evt.preventDefault();  
//	        }  
		}
	});
});