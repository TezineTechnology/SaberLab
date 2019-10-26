//region imports
//author Bruno Tezine
//endregion

class EDeliveryProductInBasket{
	String id;
	String name;
	String brief;
	int quantity;
	int unitPrice;
	String option1ID;
	String option2ID;
	String addon1ID;
	String addon2ID;
	String addon3ID;
	String option1Name;
	String option2Name;
	String addon1Name;
	String addon2Name;
	String addon3Name;
	int option1Price;
	int option2Price;
	int addon1Price;
	int addon2Price;
	int addon3Price;
	String option1GroupName;
	String option2GroupName;
	String addon1GroupName;
	String addon2GroupName;
	String addon3GroupName;
	String comments;

	EDeliveryProductInBasket({
		this.id,
		this.name,
		this.brief,
		this.quantity,
		this.unitPrice,
		this.option1ID,
		this.option2ID,
		this.addon1ID,
		this.addon2ID,
		this.addon3ID,
		this.option1Name,
		this.option2Name,
		this.addon1Name,
		this.addon2Name,
		this.addon3Name,
		this.option1Price,
		this.option2Price,
		this.addon1Price,
		this.addon2Price,
		this.addon3Price,
		this.option1GroupName,
		this.option2GroupName,
		this.addon1GroupName,
		this.addon2GroupName,
		this.addon3GroupName,
		this.comments
});

	factory EDeliveryProductInBasket.fromJson(Map<String, dynamic> json){
		return EDeliveryProductInBasket(
			id: json['id'] as String,
			name: json['name'] as String,
			brief: json['brief'] as String,
			quantity: json['quantity'] as int,
			unitPrice: json['unitPrice'] as int,
			option1ID: json['option1ID'] as String,
			option2ID: json['option2ID'] as String,
			addon1ID: json['addon1ID'] as String,
			addon2ID: json['addon2ID'] as String,
			addon3ID: json['addon3ID'] as String,
			option1Name: json['option1Name'] as String,
			option2Name: json['option2Name'] as String,
			addon1Name: json['addon1Name'] as String,
			addon2Name: json['addon2Name'] as String,
			addon3Name: json['addon3Name'] as String,
			option1Price: json['option1Price'] as int,
			option2Price: json['option2Price'] as int,
			addon1Price: json['addon1Price'] as int,
			addon2Price: json['addon2Price'] as int,
			addon3Price: json['addon3Price'] as int,
			option1GroupName: json['option1GroupName'] as String,
			option2GroupName: json['option2GroupName'] as String,
			addon1GroupName: json['addon1GroupName'] as String,
			addon2GroupName: json['addon2GroupName'] as String,
			addon3GroupName: json['addon3GroupName'] as String,
			comments: json['comments'] as String,
		);
	}

	Map<String, dynamic> toJson() {
		return <String, dynamic>{
			'id': id,
			'name': name,
			'brief': brief,
			'quantity': quantity,
			'unitPrice': unitPrice,
			'option1ID': option1ID,
			'option2ID': option2ID,
			'addon1ID': addon1ID,
			'addon2ID': addon2ID,
			'addon3ID': addon3ID,
			'option1Name': option1Name,
			'option2Name': option2Name,
			'addon1Name': addon1Name,
			'addon2Name': addon2Name,
			'addon3Name': addon3Name,
			'option1Price': option1Price,
			'option2Price': option2Price,
			'addon1Price': addon1Price,
			'addon2Price': addon2Price,
			'addon3Price': addon3Price,
			'option1GroupName': option1GroupName,
			'option2GroupName': option2GroupName,
			'addon1GroupName': addon1GroupName,
			'addon2GroupName': addon2GroupName,
			'addon3GroupName': addon3GroupName,
			'comments': comments,
		};
	}}