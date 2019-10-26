//region imports
//author Bruno Tezine
//endregion

class EIuguClient{
	int id;
	int userID;
	String clientID;
	String subClientID;
	int driverID;

	EIuguClient({
		this.id,
		this.userID,
		this.clientID,
		this.subClientID,
		this.driverID
});

	factory EIuguClient.fromJson(Map<String, dynamic> json){
		return EIuguClient(
			id: json['id'] as int,
			userID: json['userID'] as int,
			clientID: json['clientID'] as String,
			subClientID: json['subClientID'] as String,
			driverID: json['driverID'] as int,
		);
	}

	Map<String, dynamic> toJson() {
		return <String, dynamic>{
			'id': id,
			'userID': userID,
			'clientID': clientID,
			'subClientID': subClientID,
			'driverID': driverID,
		};
	}}