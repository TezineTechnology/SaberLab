//region imports
//author Bruno Tezine
//endregion

class EIuguSender{
	String id;
	String name;

	EIuguSender({
		this.id,
		this.name
});

	factory EIuguSender.fromJson(Map<String, dynamic> json){
		return EIuguSender(
			id: json['id'] as String,
			name: json['name'] as String,
		);
	}

	Map<String, dynamic> toJson() {
		return <String, dynamic>{
			'id': id,
			'name': name,
		};
	}}