//region imports
//author Bruno Tezine
//endregion

class EHelp{
	int id;
	String helpType;
	String content;
	String translatedContent;
	String contentPTBR;
	String contentIT;

	EHelp({
		this.id,
		this.helpType,
		this.content,
		this.translatedContent,
		this.contentPTBR,
		this.contentIT
});

	factory EHelp.fromJson(Map<String, dynamic> json){
		return EHelp(
			id: json['id'] as int,
			helpType: json['helpType'] as String,
			content: json['content'] as String,
			translatedContent: json['translatedContent'] as String,
			contentPTBR: json['contentPTBR'] as String,
			contentIT: json['contentIT'] as String,
		);
	}

	Map<String, dynamic> toJson() {
		return <String, dynamic>{
			'id': id,
			'helpType': helpType,
			'content': content,
			'translatedContent': translatedContent,
			'contentPTBR': contentPTBR,
			'contentIT': contentIT,
		};
	}}