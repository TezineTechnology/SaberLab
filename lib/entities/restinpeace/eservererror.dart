//region imports
//author Bruno Tezine
//endregion

class EServerError{
	int id;
	DateTime dateError;
	int userID;
	String message;
	String content;
	String stackTrace;
	String ip;
	int totalListCount;

	EServerError({
		this.id,
		this.dateError,
		this.userID,
		this.message,
		this.content,
		this.stackTrace,
		this.ip,
		this.totalListCount
});

	factory EServerError.fromJson(Map<String, dynamic> json){
		return EServerError(
			id: json['id'] as int,
			dateError: DateTime.parse(json['dateError'] as String),
			userID: json['userID'] as int,
			message: json['message'] as String,
			content: json['content'] as String,
			stackTrace: json['stackTrace'] as String,
			ip: json['ip'] as String,
			totalListCount: json['totalListCount'] as int,
		);
	}

	Map<String, dynamic> toJson() {
		return <String, dynamic>{
			'id': id,
			'dateError': dateError?.toIso8601String(),
			'userID': userID,
			'message': message,
			'content': content,
			'stackTrace': stackTrace,
			'ip': ip,
			'totalListCount': totalListCount,
		};
	}}