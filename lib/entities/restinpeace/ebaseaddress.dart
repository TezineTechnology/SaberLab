//region imports
//author Bruno Tezine
//endregion

class EBaseAddress{
	String id;
	String companyID;
	String entityID;
	String name;
	String completeAddress;
	String street;
	String number;
	String addressComplement;
	String referencePoint;
	String neighborhood;
	String postalCode;
	int cityID;
	int stateID;
	int countryID;
	String phone1;
	String phone2;
	int latitude;
	int longitude;
	DateTime creationDateUTC;
	DateTime modificationDateUTC;
	String cityName;
	String stateName;
	String countryName;

	EBaseAddress({
		this.id,
		this.companyID,
		this.entityID,
		this.name,
		this.completeAddress,
		this.street,
		this.number,
		this.addressComplement,
		this.referencePoint,
		this.neighborhood,
		this.postalCode,
		this.cityID,
		this.stateID,
		this.countryID,
		this.phone1,
		this.phone2,
		this.latitude,
		this.longitude,
		this.creationDateUTC,
		this.modificationDateUTC,
		this.cityName,
		this.stateName,
		this.countryName
});

	factory EBaseAddress.fromJson(Map<String, dynamic> json){
		return EBaseAddress(
			id: json['id'] as String,
			companyID: json['companyID'] as String,
			entityID: json['entityID'] as String,
			name: json['name'] as String,
			completeAddress: json['completeAddress'] as String,
			street: json['street'] as String,
			number: json['number'] as String,
			addressComplement: json['addressComplement'] as String,
			referencePoint: json['referencePoint'] as String,
			neighborhood: json['neighborhood'] as String,
			postalCode: json['postalCode'] as String,
			cityID: json['cityID'] as int,
			stateID: json['stateID'] as int,
			countryID: json['countryID'] as int,
			phone1: json['phone1'] as String,
			phone2: json['phone2'] as String,
			latitude: json['latitude'] as int,
			longitude: json['longitude'] as int,
			creationDateUTC: DateTime.parse(json['creationDateUTC'] as String),
			modificationDateUTC: DateTime.parse(json['modificationDateUTC'] as String),
			cityName: json['cityName'] as String,
			stateName: json['stateName'] as String,
			countryName: json['countryName'] as String,
		);
	}

	Map<String, dynamic> toJson() {
		return <String, dynamic>{
			'id': id,
			'companyID': companyID,
			'entityID': entityID,
			'name': name,
			'completeAddress': completeAddress,
			'street': street,
			'number': number,
			'addressComplement': addressComplement,
			'referencePoint': referencePoint,
			'neighborhood': neighborhood,
			'postalCode': postalCode,
			'cityID': cityID,
			'stateID': stateID,
			'countryID': countryID,
			'phone1': phone1,
			'phone2': phone2,
			'latitude': latitude,
			'longitude': longitude,
			'creationDateUTC': creationDateUTC?.toIso8601String(),
			'modificationDateUTC': modificationDateUTC?.toIso8601String(),
			'cityName': cityName,
			'stateName': stateName,
			'countryName': countryName,
		};
	}}