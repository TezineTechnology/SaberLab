//region imports
//author Bruno Tezine
//endregion

class EResponse{
	bool ok;
	String errorMessage;
	int errorCode;
	String columnsContent;
	dynamic content;
	int id;
	String idString;
	int deliveryFileID;
	String invoice_id;
	int iuguRequestID;

	EResponse({
		this.ok,
		this.errorMessage,
		this.errorCode,
		this.columnsContent,
		this.content,
		this.id,
		this.idString,
		this.deliveryFileID,
		this.invoice_id,
		this.iuguRequestID
});

	factory EResponse.fromJson(Map<String, dynamic> json){
		return EResponse(
			ok: json['ok'] as bool,
			errorMessage: json['errorMessage'] as String,
			errorCode: json['errorCode'] as int,
			columnsContent: json['columnsContent'] as String,
			content: json['content'] as dynamic,
			id: json['id'] as int,
			idString: json['idString'] as String,
			deliveryFileID: json['deliveryFileID'] as int,
			invoice_id: json['invoice_id'] as String,
			iuguRequestID: json['iuguRequestID'] as int,
		);
	}

	Map<String, dynamic> toJson() {
		return <String, dynamic>{
			'ok': ok,
			'errorMessage': errorMessage,
			'errorCode': errorCode,
			'columnsContent': columnsContent,
			'content': content,
			'id': id,
			'idString': idString,
			'deliveryFileID': deliveryFileID,
			'invoice_id': invoice_id,
			'iuguRequestID': iuguRequestID,
		};
	}}