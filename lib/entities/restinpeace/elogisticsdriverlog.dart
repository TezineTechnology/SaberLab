//region imports
//author Bruno Tezine
//endregion

class ELogisticsDriverLog{
	String id;
	String driverID;
	DateTime creationDateUTC;
	String content;
	int tripID;
	int driverStatus;
	String driverName;
	String tripName;
	String userName;
	String driverStatusName;

	ELogisticsDriverLog({
		this.id,
		this.driverID,
		this.creationDateUTC,
		this.content,
		this.tripID,
		this.driverStatus,
		this.driverName,
		this.tripName,
		this.userName,
		this.driverStatusName
});

	factory ELogisticsDriverLog.fromJson(Map<String, dynamic> json){
		return ELogisticsDriverLog(
			id: json['id'] as String,
			driverID: json['driverID'] as String,
			creationDateUTC: DateTime.parse(json['creationDateUTC'] as String),
			content: json['content'] as String,
			tripID: json['tripID'] as int,
			driverStatus: json['driverStatus'] as int,
			driverName: json['driverName'] as String,
			tripName: json['tripName'] as String,
			userName: json['userName'] as String,
			driverStatusName: json['driverStatusName'] as String,
		);
	}

	Map<String, dynamic> toJson() {
		return <String, dynamic>{
			'id': id,
			'driverID': driverID,
			'creationDateUTC': creationDateUTC?.toIso8601String(),
			'content': content,
			'tripID': tripID,
			'driverStatus': driverStatus,
			'driverName': driverName,
			'tripName': tripName,
			'userName': userName,
			'driverStatusName': driverStatusName,
		};
	}}