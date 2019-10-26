//region imports
//author Bruno Tezine
//endregion

class EIuguReceiver{
	String id;
	String name;

	EIuguReceiver({
		this.id,
		this.name
});

	factory EIuguReceiver.fromJson(Map<String, dynamic> json){
		return EIuguReceiver(
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