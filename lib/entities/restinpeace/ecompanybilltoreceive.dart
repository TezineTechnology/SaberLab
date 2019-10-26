//region imports
//author Bruno Tezine
//endregion

class ECompanyBillToReceive{
	String id;
	String companyID;
	String fromEntityID;
	DateTime issueDate;
	DateTime dueDate;
	String docNumber;
	int amount;
	int amountReceived;
	String description;
	DateTime creationDateUTC;
	DateTime modificationDateUTC;
	String entityName;

	ECompanyBillToReceive({
		this.id,
		this.companyID,
		this.fromEntityID,
		this.issueDate,
		this.dueDate,
		this.docNumber,
		this.amount,
		this.amountReceived,
		this.description,
		this.creationDateUTC,
		this.modificationDateUTC,
		this.entityName
});

	factory ECompanyBillToReceive.fromJson(Map<String, dynamic> json){
		return ECompanyBillToReceive(
			id: json['id'] as String,
			companyID: json['companyID'] as String,
			fromEntityID: json['fromEntityID'] as String,
			issueDate: json['issueDate'] as DateTime,
			dueDate: json['dueDate'] as DateTime,
			docNumber: json['docNumber'] as String,
			amount: json['amount'] as int,
			amountReceived: json['amountReceived'] as int,
			description: json['description'] as String,
			creationDateUTC: DateTime.parse(json['creationDateUTC'] as String),
			modificationDateUTC: DateTime.parse(json['modificationDateUTC'] as String),
			entityName: json['entityName'] as String,
		);
	}

	Map<String, dynamic> toJson() {
		return <String, dynamic>{
			'id': id,
			'companyID': companyID,
			'fromEntityID': fromEntityID,
			'issueDate': issueDate,
			'dueDate': dueDate,
			'docNumber': docNumber,
			'amount': amount,
			'amountReceived': amountReceived,
			'description': description,
			'creationDateUTC': creationDateUTC?.toIso8601String(),
			'modificationDateUTC': modificationDateUTC?.toIso8601String(),
			'entityName': entityName,
		};
	}}