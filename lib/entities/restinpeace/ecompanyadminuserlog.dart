//region imports
//author Bruno Tezine
//endregion

class ECompanyAdminUserLog{
	String id;
	String companyAdminUserID;
	String content;
	DateTime creationDateUTC;
	String adminUserName;

	ECompanyAdminUserLog({
		this.id,
		this.companyAdminUserID,
		this.content,
		this.creationDateUTC,
		this.adminUserName
});

	factory ECompanyAdminUserLog.fromJson(Map<String, dynamic> json){
		return ECompanyAdminUserLog(
			id: json['id'] as String,
			companyAdminUserID: json['companyAdminUserID'] as String,
			content: json['content'] as String,
			creationDateUTC: DateTime.parse(json['creationDateUTC'] as String),
			adminUserName: json['adminUserName'] as String,
		);
	}

	Map<String, dynamic> toJson() {
		return <String, dynamic>{
			'id': id,
			'companyAdminUserID': companyAdminUserID,
			'content': content,
			'creationDateUTC': creationDateUTC?.toIso8601String(),
			'adminUserName': adminUserName,
		};
	}}