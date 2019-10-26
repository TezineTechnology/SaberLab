//region imports
//author Bruno Tezine
//endregion

class ECompanyBillToPay{
	String id;
	String companyID;
	String toEntityID;
	DateTime issueDate;
	DateTime dueDate;
	String docNumber;
	int amount;
	int totalPaid;
	String description;
	DateTime creationDateUTC;
	DateTime modificationDateUTC;
	String entityName;

	ECompanyBillToPay({
		this.id,
		this.companyID,
		this.toEntityID,
		this.issueDate,
		this.dueDate,
		this.docNumber,
		this.amount,
		this.totalPaid,
		this.description,
		this.creationDateUTC,
		this.modificationDateUTC,
		this.entityName
});

	factory ECompanyBillToPay.fromJson(Map<String, dynamic> json){
		return ECompanyBillToPay(
			id: json['id'] as String,
			companyID: json['companyID'] as String,
			toEntityID: json['toEntityID'] as String,
			issueDate: json['issueDate'] as DateTime,
			dueDate: json['dueDate'] as DateTime,
			docNumber: json['docNumber'] as String,
			amount: json['amount'] as int,
			totalPaid: json['totalPaid'] as int,
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
			'toEntityID': toEntityID,
			'issueDate': issueDate,
			'dueDate': dueDate,
			'docNumber': docNumber,
			'amount': amount,
			'totalPaid': totalPaid,
			'description': description,
			'creationDateUTC': creationDateUTC?.toIso8601String(),
			'modificationDateUTC': modificationDateUTC?.toIso8601String(),
			'entityName': entityName,
		};
	}}