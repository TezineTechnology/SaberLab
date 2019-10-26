//region imports
//author Bruno Tezine
//endregion

class ECity{
	int id;
	int countryID;
	int stateID;
	String name;
	String asciiName;
	String stateName;
	String countryName;

	ECity({
		this.id,
		this.countryID,
		this.stateID,
		this.name,
		this.asciiName,
		this.stateName,
		this.countryName
});

	factory ECity.fromJson(Map<String, dynamic> json){
		return ECity(
			id: json['id'] as int,
			countryID: json['countryID'] as int,
			stateID: json['stateID'] as int,
			name: json['name'] as String,
			asciiName: json['asciiName'] as String,
			stateName: json['stateName'] as String,
			countryName: json['countryName'] as String,
		);
	}

	Map<String, dynamic> toJson() {
		return <String, dynamic>{
			'id': id,
			'countryID': countryID,
			'stateID': stateID,
			'name': name,
			'asciiName': asciiName,
			'stateName': stateName,
			'countryName': countryName,
		};
	}}