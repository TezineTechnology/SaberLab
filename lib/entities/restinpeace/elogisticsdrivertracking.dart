//region imports
//author Bruno Tezine
//endregion

class ELogisticsDriverTracking{
	String id;
	String lastTrackingID;
	int tripID;
	int driverID;
	int tripStatus;
	int latitude;
	int longitude;
	DateTime dateUTC;
	DateTime dateLocal;
	int distanceFromLastPosition;
	int distanceFromLastRecord;
	bool shadow;
	bool isServiceStart;
	String seed;
	String driverName;
	String color;
	String title;

	ELogisticsDriverTracking({
		this.id,
		this.lastTrackingID,
		this.tripID,
		this.driverID,
		this.tripStatus,
		this.latitude,
		this.longitude,
		this.dateUTC,
		this.dateLocal,
		this.distanceFromLastPosition,
		this.distanceFromLastRecord,
		this.shadow,
		this.isServiceStart,
		this.seed,
		this.driverName,
		this.color,
		this.title
});

	factory ELogisticsDriverTracking.fromJson(Map<String, dynamic> json){
		return ELogisticsDriverTracking(
			id: json['id'] as String,
			lastTrackingID: json['lastTrackingID'] as String,
			tripID: json['tripID'] as int,
			driverID: json['driverID'] as int,
			tripStatus: json['tripStatus'] as int,
			latitude: json['latitude'] as int,
			longitude: json['longitude'] as int,
			dateUTC: DateTime.parse(json['dateUTC'] as String),
			dateLocal: DateTime.parse(json['dateLocal'] as String),
			distanceFromLastPosition: json['distanceFromLastPosition'] as int,
			distanceFromLastRecord: json['distanceFromLastRecord'] as int,
			shadow: json['shadow'] as bool,
			isServiceStart: json['isServiceStart'] as bool,
			seed: json['seed'] as String,
			driverName: json['driverName'] as String,
			color: json['color'] as String,
			title: json['title'] as String,
		);
	}

	Map<String, dynamic> toJson() {
		return <String, dynamic>{
			'id': id,
			'lastTrackingID': lastTrackingID,
			'tripID': tripID,
			'driverID': driverID,
			'tripStatus': tripStatus,
			'latitude': latitude,
			'longitude': longitude,
			'dateUTC': dateUTC?.toIso8601String(),
			'dateLocal': dateLocal?.toIso8601String(),
			'distanceFromLastPosition': distanceFromLastPosition,
			'distanceFromLastRecord': distanceFromLastRecord,
			'shadow': shadow,
			'isServiceStart': isServiceStart,
			'seed': seed,
			'driverName': driverName,
			'color': color,
			'title': title,
		};
	}}