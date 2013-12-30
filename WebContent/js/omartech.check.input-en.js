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
			    $(input).after("<span class=\"help-inline\">Wrong Email Format</span>");
			    $(input).parents('.control-group').addClass("error");
			    email_flag = false;
			}
		}else{
			
		}
		break;
	case "text":
		if(value.length == 0 ){
			$(this).after("<span class=\"help-inline\">Can not be blank</span>");
		    $(input).parents('.control-group').addClass("error");
		    text_flag = false;
		}else{
			$(input).parents('.control-group').addClass("success");
			text_flag = true;
		}
		break;
	case "password":
		if(value.length < 6 || value.length > 16){
			$(this).after("<span class=\"help-inline\">The length should be between 6 and 16</span>");
			$(input).parents('.control-group').addClass("error");
			password_flag = false;
		}else{
			$(input).parents('.control-group').addClass("success");
			password_flag = true;
		}
		break;
	case "repassword":
		if(value.length < 6 || value.length > 16){
			$(this).after("<span class=\"help-inline\">The length should be between 6 and 16</span>");
			$(input).parents('.control-group').addClass("error");
			repassword_flag = false;
		}else{
			if(value != $('#password').val()){
				$(this).after("<span class=\"help-inline\">The password and repassword do not match</span>");
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
		float_flag = isFloat(value);
		if(float_flag){
			$(input).parents('.control-group').addClass("success");
		}else{
			$(input).parents('.control-group').addClass("error");
		}
		break;
	case "money":
		money_flag = isFloat(value);
		if(money_flag){
			$(input).parents('.control-group').addClass("success");
		}else{
			$(input).parents('.control-group').addClass("error");
		}
		break;
	}
}

function isValidMail(sText) {
	var reMail = /^[a-z]([a-z0-9]*[-_]?[a-z0-9]+)*@([a-z0-9]*[-_]?[a-z0-9]+)+[\.][a-z]{2,3}([\.][a-z]{2})?$/i;
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