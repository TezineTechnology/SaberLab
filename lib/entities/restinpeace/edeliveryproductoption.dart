//region imports
//author Bruno Tezine
//endregion

class EDeliveryProductOption{
	String id;
	String parentID;
	String companyID;
	String name;
	String internalName;
	int price;
	bool isGroupName;
	bool isMandatory;
	String parentGroupName;
	String completeParentGroupName;
	String completeGroupName;

	EDeliveryProductOption({
		this.id,
		this.parentID,
		this.companyID,
		this.name,
		this.internalName,
		this.price,
		this.isGroupName,
		this.isMandatory,
		this.parentGroupName,
		this.completeParentGroupName,
		this.completeGroupName
});

	factory EDeliveryProductOption.fromJson(Map<String, dynamic> json){
		return EDeliveryProductOption(
			id: json['id'] as String,
			parentID: json['parentID'] as String,
			companyID: json['companyID'] as String,
			name: json['name'] as String,
			internalName: json['internalName'] as String,
			price: json['price'] as int,
			isGroupName: json['isGroupName'] as bool,
			isMandatory: json['isMandatory'] as bool,
			parentGroupName: json['parentGroupName'] as String,
			completeParentGroupName: json['completeParentGroupName'] as String,
			completeGroupName: json['completeGroupName'] as String,
		);
	}

	Map<String, dynamic> toJson() {
		return <String, dynamic>{
			'id': id,
			'parentID': parentID,
			'companyID': companyID,
			'name': name,
			'internalName': internalName,
			'price': price,
			'isGroupName': isGroupName,
			'isMandatory': isMandatory,
			'parentGroupName': parentGroupName,
			'completeParentGroupName': completeParentGroupName,
			'completeGroupName': completeGroupName,
		};
	}}