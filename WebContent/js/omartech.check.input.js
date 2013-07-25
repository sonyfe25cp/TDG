var email_flag = false;
var password_flag = false;
var repassword_flag = false;
var int_flag = false;
var float_flag = false;
var text_flag = false;
$(document).ready(function(){
	$(document).delegate("input", "blur", checkInput);
});
function checkInput(){
	var inputType = $(this).attr("access");
	var value = $(this).val();
	input = $(this);
	$(input).parent().find('span').remove();
	$(input).parents('.control-group').removeClass("success").removeClass("error");
	switch(inputType){
	case "email":
		eamil_flag = isValidMail(value);
		if(value.length > 1){
			if(eamil_flag){
				 $(input).parents('.control-group').addClass("success");
				 email_flag = true;
			}else{
			    $(input).after("<span class=\"help-inline\">邮箱格式错误</span>");
			    $(input).parents('.control-group').addClass("error");
			    email_flag = false;
			}
		}else{
			
		}
		break;
	case "text":
		if(value.length == 0 ){
			$(this).after("<span class=\"help-inline\">内容不能为空</span>");
		    $(input).parents('.control-group').addClass("error");
		    text_flag = false;
		}else{
			text_flag = true;
		}
		break;
	case "password":
		if(value.length < 6 || value.length > 16){
			$(this).after("<span class=\"help-inline\">密码长度不符合要求</span>");
			$(input).parents('.control-group').addClass("error");
			password_flag = false;
		}else{
			$(input).parents('.control-group').addClass("success");
			password_flag = true;
		}
		break;
	case "repassword":
		if(value.length < 6 || value.length > 16){
			$(this).after("<span class=\"help-inline\">密码长度不符合要求</span>");
			$(input).parents('.control-group').addClass("error");
			repassword_flag = false;
		}else{
			if(value != $('#password').val()){
				$(this).after("<span class=\"help-inline\">密码不一致，请重新输入</span>");
				$(input).parents('.control-group').addClass("error");
				repassword_flag = false;
			}else{
				$(input).parents('.control-group').addClass("success");
				repassword_flag = true;
			}
		}
		break;
	case "int":
		int_flag = isInt(value);
		if(int_flag){
			$(input).parents('.control-group').addClass("success");
		}else{
			$(input).parents('.control-group').addClass("error");
		}
		break;
	case "float":
		float_flag = isInt(value);
		if(float_flag){
			$(input).parents('.control-group').addClass("success");
		}else{
			$(input).parents('.control-group').addClass("error");
		}
		break;
	}
}

function isValidMail(sText) {
	var reMail = /^(?:[a-z\d]+[_\-\+\.]?)*[a-z\d]+@(?:([a-z\d]+\-?)*[a-z\d]+\.)+([a-z]{2,})+$/;
	return reMail.test(sText);
}
function isInt(sText) {
	var reInt = /^[0-9]+$/;
	return reInt.test(sText);
}
function isFloat(sText) {
	var reFloat = /^[0-9]+(.[0-9]{1,2})?$/;
	return reFloat.test(sText);
}