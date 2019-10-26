//region imports
//author Bruno Tezine
//endregion

class EBraspagRequest{
	int id;
	String paymentID;
	String token;
	String url;
	String requestBody;
	String response;
	String flurlException;
	String exception;
	String actionName;

	EBraspagRequest({
		this.id,
		this.paymentID,
		this.token,
		this.url,
		this.requestBody,
		this.response,
		this.flurlException,
		this.exception,
		this.actionName
});

	factory EBraspagRequest.fromJson(Map<String, dynamic> json){
		return EBraspagRequest(
			id: json['id'] as int,
			paymentID: json['paymentID'] as String,
			token: json['token'] as String,
			url: json['url'] as String,
			requestBody: json['requestBody'] as String,
			response: json['response'] as String,
			flurlException: json['flurlException'] as String,
			exception: json['exception'] as String,
			actionName: json['actionName'] as String,
		);
	}

	Map<String, dynamic> toJson() {
		return <String, dynamic>{
			'id': id,
			'paymentID': paymentID,
			'token': token,
			'url': url,
			'requestBody': requestBody,
			'response': response,
			'flurlException': flurlException,
			'exception': exception,
			'actionName': actionName,
		};
	}}