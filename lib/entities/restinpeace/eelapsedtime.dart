//region imports
//author Bruno Tezine
//endregion

class EElapsedTime{
	int id;
	String functionName;
	int milisecondsElapsed;
	int driverID;
	int companyID;
	DateTime dateInsertedUTC;

	EElapsedTime({
		this.id,
		this.functionName,
		this.milisecondsElapsed,
		this.driverID,
		this.companyID,
		this.dateInsertedUTC
});

	factory EElapsedTime.fromJson(Map<String, dynamic> json){
		return EElapsedTime(
			id: json['id'] as int,
			functionName: json['functionName'] as String,
			milisecondsElapsed: json['milisecondsElapsed'] as int,
			driverID: json['driverID'] as int,
			companyID: json['companyID'] as int,
			dateInsertedUTC: DateTime.parse(json['dateInsertedUTC'] as String),
		);
	}

	Map<String, dynamic> toJson() {
		return <String, dynamic>{
			'id': id,
			'functionName': functionName,
			'milisecondsElapsed': milisecondsElapsed,
			'driverID': driverID,
			'companyID': companyID,
			'dateInsertedUTC': dateInsertedUTC?.toIso8601String(),
		};
	}}