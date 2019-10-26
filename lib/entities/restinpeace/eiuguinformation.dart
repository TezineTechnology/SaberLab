//region imports
//author Bruno Tezine
//endregion

class EIuguInformation{
	String key;
	String value;

	EIuguInformation({
		this.key,
		this.value
});

	factory EIuguInformation.fromJson(Map<String, dynamic> json){
		return EIuguInformation(
			key: json['key'] as String,
			value: json['value'] as String,
		);
	}

	Map<String, dynamic> toJson() {
		return <String, dynamic>{
			'key': key,
			'value': value,
		};
	}}