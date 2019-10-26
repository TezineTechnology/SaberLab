//region imports
//author Bruno Tezine
//endregion

class EFile{
	String id;
	String companyID;
	DateTime creationDateUTC;
	String companyName;
	String contentBase64;

	EFile({
		this.id,
		this.companyID,
		this.creationDateUTC,
		this.companyName,
		this.contentBase64
});

	factory EFile.fromJson(Map<String, dynamic> json){
		return EFile(
			id: json['id'] as String,
			companyID: json['companyID'] as String,
			creationDateUTC: DateTime.parse(json['creationDateUTC'] as String),
			companyName: json['companyName'] as String,
			contentBase64: json['contentBase64'] as String,
		);
	}

	Map<String, dynamic> toJson() {
		return <String, dynamic>{
			'id': id,
			'companyID': companyID,
			'creationDateUTC': creationDateUTC?.toIso8601String(),
			'companyName': companyName,
			'contentBase64': contentBase64,
		};
	}}