//region imports
//author Bruno Tezine
//endregion

class EDeliveryProductAddon{
	String id;
	String parentID;
	String companyID;
	String internalName;
	String name;
	int price;
	bool isGroupName;
	String parentGroupName;

	EDeliveryProductAddon({
		this.id,
		this.parentID,
		this.companyID,
		this.internalName,
		this.name,
		this.price,
		this.isGroupName,
		this.parentGroupName
});

	factory EDeliveryProductAddon.fromJson(Map<String, dynamic> json){
		return EDeliveryProductAddon(
			id: json['id'] as String,
			parentID: json['parentID'] as String,
			companyID: json['companyID'] as String,
			internalName: json['internalName'] as String,
			name: json['name'] as String,
			price: json['price'] as int,
			isGroupName: json['isGroupName'] as bool,
			parentGroupName: json['parentGroupName'] as String,
		);
	}

	Map<String, dynamic> toJson() {
		return <String, dynamic>{
			'id': id,
			'parentID': parentID,
			'companyID': companyID,
			'internalName': internalName,
			'name': name,
			'price': price,
			'isGroupName': isGroupName,
			'parentGroupName': parentGroupName,
		};
	}}