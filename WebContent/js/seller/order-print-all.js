//12221121111
$(document).ready(function(){
	$('input[name="all-select"]').click(function(){
		if(this.checked){
			$('tbody input[name="print"]').each(function(){
			  this.checked = true;
			});
		}else{
			$('tbody input[name="print"]').each(function(){
			  this.checked = false;
			});
		}
	});
	
	$('input[type="checkbox"]').click(function(){
		printAll();
	});
	
	function printAll(){
		var ids = "";
		$('tbody tr').each(function(){
			var checkbox = $(this).find('input[type="checkbox"]:checked').val();
			if(checkbox != undefined){
				var id = $(this).find('.order_id').val();
//				alert(id);
				ids += (id+",");
			}
		});
		
		if(ids.length != 0){
			$('#idArray').val(ids);
			$('#print_all').removeClass('disabled').addClass('btn-primary');
		}else{
			$('#print_all').removeClass('btn-primary').addClass('disabled');
			$('#idArray').val('');
		}
	}
	$('#print_all').click(function(){
		var idArray = $('#idArray').val();
		if(idArray  != ''){
//			alert(idArray);
//			window.location.href="/seller/order/printall?ids="+idArray;
			window.open("/seller/order/printall?ids="+idArray, "_target");
		}
	});
//			windows.location.href= "/seller/order/printerall?ids="+ids;
//			$.ajax({
//				url: '/seller/order/printall',
//				data: "ids="+ids,
//				success: function(){
//					alert('h');
//				},
//				error: function(){
//					
//				}
//			});
//		}
//	}
	
});