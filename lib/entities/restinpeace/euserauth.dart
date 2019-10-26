//region imports
//author Bruno Tezine
//endregion

class EUserAuth{
	bool authenticated;
	String id;
	String companyID;
	int languageCode;
	int respCreateUser;
	String token;
	String name;
	String cpf;

	EUserAuth({
		this.authenticated,
		this.id,
		this.companyID,
		this.languageCode,
		this.respCreateUser,
		this.token,
		this.name,
		this.cpf
});

	factory EUserAuth.fromJson(Map<String, dynamic> json){
		return EUserAuth(
			authenticated: json['authenticated'] as bool,
			id: json['id'] as String,
			companyID: json['companyID'] as String,
			languageCode: json['languageCode'] as int,
			respCreateUser: json['respCreateUser'] as int,
			token: json['token'] as String,
			name: json['name'] as String,
			cpf: json['cpf'] as String,
		);
	}

	Map<String, dynamic> toJson() {
		return <String, dynamic>{
			'authenticated': authenticated,
			'id': id,
			'companyID': companyID,
			'languageCode': languageCode,
			'respCreateUser': respCreateUser,
			'token': token,
			'name': name,
			'cpf': cpf,
		};
	}}