//region imports
//author Bruno Tezine
//endregion

class EIuguFaturaVariable{
	String id;
	String variable;
	String value;

	EIuguFaturaVariable({
		this.id,
		this.variable,
		this.value
});

	factory EIuguFaturaVariable.fromJson(Map<String, dynamic> json){
		return EIuguFaturaVariable(
			id: json['id'] as String,
			variable: json['variable'] as String,
			value: json['value'] as String,
		);
	}

	Map<String, dynamic> toJson() {
		return <String, dynamic>{
			'id': id,
			'variable': variable,
			'value': value,
		};
	}}