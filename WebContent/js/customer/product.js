$(document).ready(function(){
	initShow();//处理显示问题
});
function initShow(){
	initPromotion();
	initWhole();
}
function initPromotion(){
	var pp = $('#promotionPrice').text();
	pp = parseFloat(pp);
	var pt = $('#promotionTime').text();
	pt = pt.replace(/\s/g,'');
	if(pp == 0 || pt.length < 3){
		$('#promotion').addClass("hidden");
	}
}
function initWhole(){
	var wl = $('#wholePrice').text();
	wl = parseFloat(wl);
	var mi = $('#minimumQuantity').text();
	mi = parseInt(mi);
	var ma = $('#maximumAcceptQuantity').text();
	ma = parseInt(ma);
	if(wl == 0 || mi == 0 || ma == 0){
		$('#whole').addClass('hidden');
	}
}