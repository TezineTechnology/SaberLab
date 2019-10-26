//region imports
//author Bruno Tezine
//endregion

class ETermsOfUse{
	int id;
	String version;
	int appType;
	String appTypeName;
	String content;

	ETermsOfUse({
		this.id,
		this.version,
		this.appType,
		this.appTypeName,
		this.content
});

	factory ETermsOfUse.fromJson(Map<String, dynamic> json){
		return ETermsOfUse(
			id: json['id'] as int,
			version: json['version'] as String,
			appType: json['appType'] as int,
			appTypeName: json['appTypeName'] as String,
			content: json['content'] as String,
		);
	}

	Map<String, dynamic> toJson() {
		return <String, dynamic>{
			'id': id,
			'version': version,
			'appType': appType,
			'appTypeName': appTypeName,
			'content': content,
		};
	}}