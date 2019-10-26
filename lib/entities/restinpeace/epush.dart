//region imports
//author Bruno Tezine
//endregion

class EPush{
	int id;
	int pushType;
	String title;
	String message;
	int badge;
	String sound;
	int driverID;
	int userID;
	int tripID;
	int directionType;
	int status;
	DateTime creationDateUTC;
	String key1;
	String value1;
	String key2;
	String value2;
	String key3;
	String value3;
	String userName;
	String firebaseToken;
	String applePushToken;
	bool sendNotification;

	EPush({
		this.id,
		this.pushType,
		this.title,
		this.message,
		this.badge,
		this.sound,
		this.driverID,
		this.userID,
		this.tripID,
		this.directionType,
		this.status,
		this.creationDateUTC,
		this.key1,
		this.value1,
		this.key2,
		this.value2,
		this.key3,
		this.value3,
		this.userName,
		this.firebaseToken,
		this.applePushToken,
		this.sendNotification
});

	factory EPush.fromJson(Map<String, dynamic> json){
		return EPush(
			id: json['id'] as int,
			pushType: json['pushType'] as int,
			title: json['title'] as String,
			message: json['message'] as String,
			badge: json['badge'] as int,
			sound: json['sound'] as String,
			driverID: json['driverID'] as int,
			userID: json['userID'] as int,
			tripID: json['tripID'] as int,
			directionType: json['directionType'] as int,
			status: json['status'] as int,
			creationDateUTC: DateTime.parse(json['creationDateUTC'] as String),
			key1: json['key1'] as String,
			value1: json['value1'] as String,
			key2: json['key2'] as String,
			value2: json['value2'] as String,
			key3: json['key3'] as String,
			value3: json['value3'] as String,
			userName: json['userName'] as String,
			firebaseToken: json['firebaseToken'] as String,
			applePushToken: json['applePushToken'] as String,
			sendNotification: json['sendNotification'] as bool,
		);
	}

	Map<String, dynamic> toJson() {
		return <String, dynamic>{
			'id': id,
			'pushType': pushType,
			'title': title,
			'message': message,
			'badge': badge,
			'sound': sound,
			'driverID': driverID,
			'userID': userID,
			'tripID': tripID,
			'directionType': directionType,
			'status': status,
			'creationDateUTC': creationDateUTC?.toIso8601String(),
			'key1': key1,
			'value1': value1,
			'key2': key2,
			'value2': value2,
			'key3': key3,
			'value3': value3,
			'userName': userName,
			'firebaseToken': firebaseToken,
			'applePushToken': applePushToken,
			'sendNotification': sendNotification,
		};
	}}