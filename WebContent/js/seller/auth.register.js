//1
$(document).ready(function(){
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
});