//region imports
//author Bruno Tezine
//endregion

class ECompanyProposal{
	String id;
	String companyID;
	String toEntityID;
	DateTime issueDate;
	DateTime dueDate;
	String title;
	String description;
	int total;
	DateTime creationDateUTC;
	DateTime modificationDateUTC;
	String toEntityName;

	ECompanyProposal({
		this.id,
		this.companyID,
		this.toEntityID,
		this.issueDate,
		this.dueDate,
		this.title,
		this.description,
		this.total,
		this.creationDateUTC,
		this.modificationDateUTC,
		this.toEntityName
});

	factory ECompanyProposal.fromJson(Map<String, dynamic> json){
		return ECompanyProposal(
			id: json['id'] as String,
			companyID: json['companyID'] as String,
			toEntityID: json['toEntityID'] as String,
			issueDate: json['issueDate'] as DateTime,
			dueDate: json['dueDate'] as DateTime,
			title: json['title'] as String,
			description: json['description'] as String,
			total: json['total'] as int,
			creationDateUTC: DateTime.parse(json['creationDateUTC'] as String),
			modificationDateUTC: DateTime.parse(json['modificationDateUTC'] as String),
			toEntityName: json['toEntityName'] as String,
		);
	}

	Map<String, dynamic> toJson() {
		return <String, dynamic>{
			'id': id,
			'companyID': companyID,
			'toEntityID': toEntityID,
			'issueDate': issueDate,
			'dueDate': dueDate,
			'title': title,
			'description': description,
			'total': total,
			'creationDateUTC': creationDateUTC?.toIso8601String(),
			'modificationDateUTC': modificationDateUTC?.toIso8601String(),
			'toEntityName': toEntityName,
		};
	}}