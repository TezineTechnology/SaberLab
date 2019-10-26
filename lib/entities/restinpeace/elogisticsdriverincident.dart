//region imports
//author Bruno Tezine
//endregion

class ELogisticsDriverIncident{
	String id;
	int visualID;
	String companyID;
	String driverID;
	String title;
	String description;
	DateTime creationDateUTC;
	DateTime modificationDateUTC;
	String driverName;

	ELogisticsDriverIncident({
		this.id,
		this.visualID,
		this.companyID,
		this.driverID,
		this.title,
		this.description,
		this.creationDateUTC,
		this.modificationDateUTC,
		this.driverName
});

	factory ELogisticsDriverIncident.fromJson(Map<String, dynamic> json){
		return ELogisticsDriverIncident(
			id: json['id'] as String,
			visualID: json['visualID'] as int,
			companyID: json['companyID'] as String,
			driverID: json['driverID'] as String,
			title: json['title'] as String,
			description: json['description'] as String,
			creationDateUTC: DateTime.parse(json['creationDateUTC'] as String),
			modificationDateUTC: DateTime.parse(json['modificationDateUTC'] as String),
			driverName: json['driverName'] as String,
		);
	}

	Map<String, dynamic> toJson() {
		return <String, dynamic>{
			'id': id,
			'visualID': visualID,
			'companyID': companyID,
			'driverID': driverID,
			'title': title,
			'description': description,
			'creationDateUTC': creationDateUTC?.toIso8601String(),
			'modificationDateUTC': modificationDateUTC?.toIso8601String(),
			'driverName': driverName,
		};
	}}