$(document).ready(function(){
	
	$('input[name="all-select"]').click(function(){
		if(this.checked){
			$('tbody input[name="translation"]').each(function(){
			  this.checked = true;
			});
		}else{
			$('tbody input[name="translation"]').each(function(){
			  this.checked = false;
			});
		}
	});
	
	$('.translators').delegate('input', 'click', function(){
		$('#at').removeClass('disabled').addClass('btn-primary');
		
	});
	$('#at').click(function(){
		var size = $('tbody input[name="translation"]:checked').size();
		var translators = $('.translators input[name="translator"]:checked').size();
		var taskType = $(this).attr("value");
		if(translators == 0){
			alert("Please choose a translator");
			return;
		}
		translatorId = $('.translators input[name="translator"]:checked').attr("value");
		if(size == 0){
			alert('Please choose product need to translate.');
		}else{
			array = "";
			$('tbody input[name="translation"]:checked').each(function(){
				tmp = $(this).val()+",";
				array +=tmp;
			});
			$.ajax({
				url: '/admin/translationTask/batch',
				data: "ids="+array+"&taskType="+taskType+"&translatorId="+translatorId,
				success: function(){
					 window.location.reload();
				},
				error: function(){
					
				}
			});
		}
	});
});