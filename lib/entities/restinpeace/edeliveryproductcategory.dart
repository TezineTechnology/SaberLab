//region imports
//author Bruno Tezine
//endregion

class EDeliveryProductCategory{
	String id;
	String companyID;
	String name;
	int position;

	EDeliveryProductCategory({
		this.id,
		this.companyID,
		this.name,
		this.position
});

	factory EDeliveryProductCategory.fromJson(Map<String, dynamic> json){
		return EDeliveryProductCategory(
			id: json['id'] as String,
			companyID: json['companyID'] as String,
			name: json['name'] as String,
			position: json['position'] as int,
		);
	}

	Map<String, dynamic> toJson() {
		return <String, dynamic>{
			'id': id,
			'companyID': companyID,
			'name': name,
			'position': position,
		};
	}}