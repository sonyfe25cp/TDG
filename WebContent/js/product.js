function item(item_value){
	this.id = item_value['id'];
	this.sku = item_value['sku'];
	this.retailPrice = item_value['retailPrice'];
	this.wholePrice = item_value['wholePrice'];
	featureJson = item_value['featureJson'];
	this.color = featureJson['color'];
	this.size = featureJson['size'];
	this.beginTime = item_value['promotionTime'];
	this.endTime = item_value['promotionEnd'];
	this.proPrice = item_value['promotionPrice'];
	this.image = item_value['image'];
	this.minimumQuantity = item_value['minimumQuantity'];
	this.maximumAcceptQuantity = item_value['maximumAcceptQuantity'];
	this.availableQuantity = item_value['availableQuantity']; 
	this.wholePrice = item_value['wholePrice'];
}