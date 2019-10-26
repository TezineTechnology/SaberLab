//region imports
//author Bruno Tezine
//endregion

class EEmailSent{
	String id;
	int type;
	int fileID;
	String toEmail;
	String title;
	String body;
	String fromCompanyAdminUserId;
	DateTime creationDateUTC;
	String toUserName;

	EEmailSent({
		this.id,
		this.type,
		this.fileID,
		this.toEmail,
		this.title,
		this.body,
		this.fromCompanyAdminUserId,
		this.creationDateUTC,
		this.toUserName
});

	factory EEmailSent.fromJson(Map<String, dynamic> json){
		return EEmailSent(
			id: json['id'] as String,
			type: json['type'] as int,
			fileID: json['fileID'] as int,
			toEmail: json['toEmail'] as String,
			title: json['title'] as String,
			body: json['body'] as String,
			fromCompanyAdminUserId: json['fromCompanyAdminUserId'] as String,
			creationDateUTC: DateTime.parse(json['creationDateUTC'] as String),
			toUserName: json['toUserName'] as String,
		);
	}

	Map<String, dynamic> toJson() {
		return <String, dynamic>{
			'id': id,
			'type': type,
			'fileID': fileID,
			'toEmail': toEmail,
			'title': title,
			'body': body,
			'fromCompanyAdminUserId': fromCompanyAdminUserId,
			'creationDateUTC': creationDateUTC?.toIso8601String(),
			'toUserName': toUserName,
		};
	}}