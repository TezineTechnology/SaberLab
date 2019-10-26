//region imports
//author Bruno Tezine
//endregion

class ELogisticsDriverAuth{
	bool authenticated;
	String id;
	int languageCode;
	int tripsCount;
	String token;
	String name;
	int driverLogMode;
	int recoveryDriverState;
	int recoveryTripID;
	int recoveryUserID;

	ELogisticsDriverAuth({
		this.authenticated,
		this.id,
		this.languageCode,
		this.tripsCount,
		this.token,
		this.name,
		this.driverLogMode,
		this.recoveryDriverState,
		this.recoveryTripID,
		this.recoveryUserID
});

	factory ELogisticsDriverAuth.fromJson(Map<String, dynamic> json){
		return ELogisticsDriverAuth(
			authenticated: json['authenticated'] as bool,
			id: json['id'] as String,
			languageCode: json['languageCode'] as int,
			tripsCount: json['tripsCount'] as int,
			token: json['token'] as String,
			name: json['name'] as String,
			driverLogMode: json['driverLogMode'] as int,
			recoveryDriverState: json['recoveryDriverState'] as int,
			recoveryTripID: json['recoveryTripID'] as int,
			recoveryUserID: json['recoveryUserID'] as int,
		);
	}

	Map<String, dynamic> toJson() {
		return <String, dynamic>{
			'authenticated': authenticated,
			'id': id,
			'languageCode': languageCode,
			'tripsCount': tripsCount,
			'token': token,
			'name': name,
			'driverLogMode': driverLogMode,
			'recoveryDriverState': recoveryDriverState,
			'recoveryTripID': recoveryTripID,
			'recoveryUserID': recoveryUserID,
		};
	}}