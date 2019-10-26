//region imports
//author Bruno Tezine
//endregion

class EBraspagToken{
	String access_token;
	String token_type;
	String expires_in;

	EBraspagToken({
		this.access_token,
		this.token_type,
		this.expires_in
});

	factory EBraspagToken.fromJson(Map<String, dynamic> json){
		return EBraspagToken(
			access_token: json['access_token'] as String,
			token_type: json['token_type'] as String,
			expires_in: json['expires_in'] as String,
		);
	}

	Map<String, dynamic> toJson() {
		return <String, dynamic>{
			'access_token': access_token,
			'token_type': token_type,
			'expires_in': expires_in,
		};
	}}