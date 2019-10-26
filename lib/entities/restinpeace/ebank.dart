//region imports
//author Bruno Tezine
//endregion

class EBank{
	int id;
	String name;
	String code;

	EBank({
		this.id,
		this.name,
		this.code
});

	factory EBank.fromJson(Map<String, dynamic> json){
		return EBank(
			id: json['id'] as int,
			name: json['name'] as String,
			code: json['code'] as String,
		);
	}

	Map<String, dynamic> toJson() {
		return <String, dynamic>{
			'id': id,
			'name': name,
			'code': code,
		};
	}}