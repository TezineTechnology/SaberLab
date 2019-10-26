//region imports
//author Bruno Tezine
//endregion

class EBug{
	int id;
	int type;
	int appType;
	String title;
	String description;
	DateTime creationDateUTC;
	int driverID;
	int userID;
	int status;
	int priority;
	String statusName;
	String typeName;
	int totalListCount;
	String companyUserName;
	String appTypeName;
	String priorityName;

	EBug({
		this.id,
		this.type,
		this.appType,
		this.title,
		this.description,
		this.creationDateUTC,
		this.driverID,
		this.userID,
		this.status,
		this.priority,
		this.statusName,
		this.typeName,
		this.totalListCount,
		this.companyUserName,
		this.appTypeName,
		this.priorityName
});

	factory EBug.fromJson(Map<String, dynamic> json){
		return EBug(
			id: json['id'] as int,
			type: json['type'] as int,
			appType: json['appType'] as int,
			title: json['title'] as String,
			description: json['description'] as String,
			creationDateUTC: DateTime.parse(json['creationDateUTC'] as String),
			driverID: json['driverID'] as int,
			userID: json['userID'] as int,
			status: json['status'] as int,
			priority: json['priority'] as int,
			statusName: json['statusName'] as String,
			typeName: json['typeName'] as String,
			totalListCount: json['totalListCount'] as int,
			companyUserName: json['companyUserName'] as String,
			appTypeName: json['appTypeName'] as String,
			priorityName: json['priorityName'] as String,
		);
	}

	Map<String, dynamic> toJson() {
		return <String, dynamic>{
			'id': id,
			'type': type,
			'appType': appType,
			'title': title,
			'description': description,
			'creationDateUTC': creationDateUTC?.toIso8601String(),
			'driverID': driverID,
			'userID': userID,
			'status': status,
			'priority': priority,
			'statusName': statusName,
			'typeName': typeName,
			'totalListCount': totalListCount,
			'companyUserName': companyUserName,
			'appTypeName': appTypeName,
			'priorityName': priorityName,
		};
	}}