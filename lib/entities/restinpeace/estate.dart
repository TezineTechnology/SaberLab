//region imports
//author Bruno Tezine
//endregion

class EState{
	int id;
	int countryID;
	String code;
	String name;
	bool newState;

	EState({
		this.id,
		this.countryID,
		this.code,
		this.name,
		this.newState
});

	factory EState.fromJson(Map<String, dynamic> json){
		return EState(
			id: json['id'] as int,
			countryID: json['countryID'] as int,
			code: json['code'] as String,
			name: json['name'] as String,
			newState: json['newState'] as bool,
		);
	}

	Map<String, dynamic> toJson() {
		return <String, dynamic>{
			'id': id,
			'countryID': countryID,
			'code': code,
			'name': name,
			'newState': newState,
		};
	}}