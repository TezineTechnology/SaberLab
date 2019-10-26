//region imports
//author Bruno Tezine
//endregion

class ECompanyAdminUser{
	String id;
	String companyID;
	String name;
	String email;
	String password;
	int permissions;
	DateTime creationDateUTC;
	DateTime lastAccessUTC;

	ECompanyAdminUser({
		this.id,
		this.companyID,
		this.name,
		this.email,
		this.password,
		this.permissions,
		this.creationDateUTC,
		this.lastAccessUTC
});

	factory ECompanyAdminUser.fromJson(Map<String, dynamic> json){
		return ECompanyAdminUser(
			id: json['id'] as String,
			companyID: json['companyID'] as String,
			name: json['name'] as String,
			email: json['email'] as String,
			password: json['password'] as String,
			permissions: json['permissions'] as int,
			creationDateUTC: DateTime.parse(json['creationDateUTC'] as String),
			lastAccessUTC: DateTime.parse(json['lastAccessUTC'] as String),
		);
	}

	Map<String, dynamic> toJson() {
		return <String, dynamic>{
			'id': id,
			'companyID': companyID,
			'name': name,
			'email': email,
			'password': password,
			'permissions': permissions,
			'creationDateUTC': creationDateUTC?.toIso8601String(),
			'lastAccessUTC': lastAccessUTC?.toIso8601String(),
		};
	}}