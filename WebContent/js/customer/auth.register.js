$(document).ready(function(){
	$('#submit').click(function evt(){
		checkInput;
		flag = email_flag && password_flag && repassword_flag;
		if(!flag){
			evt = evt || window.event;  
	        if (window.event) {//IE  
	            window.event.returnValue = false;  
	        } else {  
	            evt.preventDefault();  
	        }  
		}
	});
});