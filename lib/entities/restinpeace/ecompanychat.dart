//region imports
//author Bruno Tezine
//endregion

class ECompanyChat{
	String id;
	String companyID;
	String companyAdminUserID;
	String companyMobileUserID;
	int chatDirection;
	String content;
	DateTime creationDateUTC;
	DateTime creationDateLocal;
	String senderName;
	String receiverName;
	String color;

	ECompanyChat({
		this.id,
		this.companyID,
		this.companyAdminUserID,
		this.companyMobileUserID,
		this.chatDirection,
		this.content,
		this.creationDateUTC,
		this.creationDateLocal,
		this.senderName,
		this.receiverName,
		this.color
});

	factory ECompanyChat.fromJson(Map<String, dynamic> json){
		return ECompanyChat(
			id: json['id'] as String,
			companyID: json['companyID'] as String,
			companyAdminUserID: json['companyAdminUserID'] as String,
			companyMobileUserID: json['companyMobileUserID'] as String,
			chatDirection: json['chatDirection'] as int,
			content: json['content'] as String,
			creationDateUTC: DateTime.parse(json['creationDateUTC'] as String),
			creationDateLocal: json['creationDateLocal'] as DateTime,
			senderName: json['senderName'] as String,
			receiverName: json['receiverName'] as String,
			color: json['color'] as String,
		);
	}

	Map<String, dynamic> toJson() {
		return <String, dynamic>{
			'id': id,
			'companyID': companyID,
			'companyAdminUserID': companyAdminUserID,
			'companyMobileUserID': companyMobileUserID,
			'chatDirection': chatDirection,
			'content': content,
			'creationDateUTC': creationDateUTC?.toIso8601String(),
			'creationDateLocal': creationDateLocal,
			'senderName': senderName,
			'receiverName': receiverName,
			'color': color,
		};
	}}