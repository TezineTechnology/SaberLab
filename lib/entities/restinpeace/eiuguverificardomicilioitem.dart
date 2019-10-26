//region imports
//author Bruno Tezine
//endregion

class EIuguVerificarDomicilioItem{
	String id;
	String status;
	DateTime created_at;
	DateTime updated_at;
	String account;
	String agency;
	dynamic operation;
	String feedback;
	String bank;

	EIuguVerificarDomicilioItem({
		this.id,
		this.status,
		this.created_at,
		this.updated_at,
		this.account,
		this.agency,
		this.operation,
		this.feedback,
		this.bank
});

	factory EIuguVerificarDomicilioItem.fromJson(Map<String, dynamic> json){
		return EIuguVerificarDomicilioItem(
			id: json['id'] as String,
			status: json['status'] as String,
			created_at: DateTime.parse(json['created_at'] as String),
			updated_at: DateTime.parse(json['updated_at'] as String),
			account: json['account'] as String,
			agency: json['agency'] as String,
			operation: json['operation'] as dynamic,
			feedback: json['feedback'] as String,
			bank: json['bank'] as String,
		);
	}

	Map<String, dynamic> toJson() {
		return <String, dynamic>{
			'id': id,
			'status': status,
			'created_at': created_at?.toIso8601String(),
			'updated_at': updated_at?.toIso8601String(),
			'account': account,
			'agency': agency,
			'operation': operation,
			'feedback': feedback,
			'bank': bank,
		};
	}}