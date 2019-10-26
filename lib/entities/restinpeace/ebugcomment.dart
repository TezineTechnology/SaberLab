//region imports
//author Bruno Tezine
//endregion

class EBugComment{
	int id;
	int bugID;
	DateTime creationDateUTC;
	int userID;
	int driverID;
	String comment;
	int totalListCount;
	String companyUserName;

	EBugComment({
		this.id,
		this.bugID,
		this.creationDateUTC,
		this.userID,
		this.driverID,
		this.comment,
		this.totalListCount,
		this.companyUserName
});

	factory EBugComment.fromJson(Map<String, dynamic> json){
		return EBugComment(
			id: json['id'] as int,
			bugID: json['bugID'] as int,
			creationDateUTC: DateTime.parse(json['creationDateUTC'] as String),
			userID: json['userID'] as int,
			driverID: json['driverID'] as int,
			comment: json['comment'] as String,
			totalListCount: json['totalListCount'] as int,
			companyUserName: json['companyUserName'] as String,
		);
	}

	Map<String, dynamic> toJson() {
		return <String, dynamic>{
			'id': id,
			'bugID': bugID,
			'creationDateUTC': creationDateUTC?.toIso8601String(),
			'userID': userID,
			'driverID': driverID,
			'comment': comment,
			'totalListCount': totalListCount,
			'companyUserName': companyUserName,
		};
	}}