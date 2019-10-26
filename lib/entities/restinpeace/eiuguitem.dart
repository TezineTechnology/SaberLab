//region imports
//author Bruno Tezine
//endregion

class EIuguItem{
	String id;
	String name;
	bool verified;

	EIuguItem({
		this.id,
		this.name,
		this.verified
});

	factory EIuguItem.fromJson(Map<String, dynamic> json){
		return EIuguItem(
			id: json['id'] as String,
			name: json['name'] as String,
			verified: json['verified'] as bool,
		);
	}

	Map<String, dynamic> toJson() {
		return <String, dynamic>{
			'id': id,
			'name': name,
			'verified': verified,
		};
	}}