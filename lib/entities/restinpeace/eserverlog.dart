//region imports
//author Bruno Tezine
//endregion

class EServerLog{
	String id;
	DateTime creationDate;
	String companyAdminUserID;
	String content;
	String braspagPaymentID;
	String userName;
	String driverName;
	String tripName;

	EServerLog({
		this.id,
		this.creationDate,
		this.companyAdminUserID,
		this.content,
		this.braspagPaymentID,
		this.userName,
		this.driverName,
		this.tripName
});

	factory EServerLog.fromJson(Map<String, dynamic> json){
		return EServerLog(
			id: json['id'] as String,
			creationDate: DateTime.parse(json['creationDate'] as String),
			companyAdminUserID: json['companyAdminUserID'] as String,
			content: json['content'] as String,
			braspagPaymentID: json['braspagPaymentID'] as String,
			userName: json['userName'] as String,
			driverName: json['driverName'] as String,
			tripName: json['tripName'] as String,
		);
	}

	Map<String, dynamic> toJson() {
		return <String, dynamic>{
			'id': id,
			'creationDate': creationDate?.toIso8601String(),
			'companyAdminUserID': companyAdminUserID,
			'content': content,
			'braspagPaymentID': braspagPaymentID,
			'userName': userName,
			'driverName': driverName,
			'tripName': tripName,
		};
	}}