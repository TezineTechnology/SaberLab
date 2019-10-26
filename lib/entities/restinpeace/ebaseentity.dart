//region imports
//author Bruno Tezine
import 'package:saberlab_frontend_web/enums/restinpeace/entitytype.dart';
import 'package:saberlab_frontend_web/entities/restinpeace/ebaseaddress.dart';
//endregion

class EBaseEntity{
	String id;
	String companyID;
	EntityType type;
	String name;
	String surname;
	String email;
	String login;
	String password;
	String mobile;
	int gender;
	int status;
	String rg;
	String cpf;
	int permissions;
	String firebaseToken;
	String appleToken;
	String mobileVersion;
	String razaoSocial;
	String inscricaoEstadual;
	String simplesNacional;
	String cnpj;
	String website;
	String contactName;
	String contactPhone;
	DateTime creationDateUTC;
	DateTime lastAccessUTC;
	DateTime modificationDateUTC;
	String token;
	int totalListCount;
	EBaseAddress addressList;

	EBaseEntity({
		this.id,
		this.companyID,
		this.type,
		this.name,
		this.surname,
		this.email,
		this.login,
		this.password,
		this.mobile,
		this.gender,
		this.status,
		this.rg,
		this.cpf,
		this.permissions,
		this.firebaseToken,
		this.appleToken,
		this.mobileVersion,
		this.razaoSocial,
		this.inscricaoEstadual,
		this.simplesNacional,
		this.cnpj,
		this.website,
		this.contactName,
		this.contactPhone,
		this.creationDateUTC,
		this.lastAccessUTC,
		this.modificationDateUTC,
		this.token,
		this.totalListCount,
		this.addressList
});

	factory EBaseEntity.fromJson(Map<String, dynamic> json){
		return EBaseEntity(
			id: json['id'] as String,
			companyID: json['companyID'] as String,
			type: json['type'] as EntityType == null ? null : EntityType.fromJson(json['type'] as Map<String, dynamic>),
			name: json['name'] as String,
			surname: json['surname'] as String,
			email: json['email'] as String,
			login: json['login'] as String,
			password: json['password'] as String,
			mobile: json['mobile'] as String,
			gender: json['gender'] as int,
			status: json['status'] as int,
			rg: json['rg'] as String,
			cpf: json['cpf'] as String,
			permissions: json['permissions'] as int,
			firebaseToken: json['firebaseToken'] as String,
			appleToken: json['appleToken'] as String,
			mobileVersion: json['mobileVersion'] as String,
			razaoSocial: json['razaoSocial'] as String,
			inscricaoEstadual: json['inscricaoEstadual'] as String,
			simplesNacional: json['simplesNacional'] as String,
			cnpj: json['cnpj'] as String,
			website: json['website'] as String,
			contactName: json['contactName'] as String,
			contactPhone: json['contactPhone'] as String,
			creationDateUTC: DateTime.parse(json['creationDateUTC'] as String),
			lastAccessUTC: DateTime.parse(json['lastAccessUTC'] as String),
			modificationDateUTC: DateTime.parse(json['modificationDateUTC'] as String),
			token: json['token'] as String,
			totalListCount: json['totalListCount'] as int,
			addressList: json['addressList'] as EBaseAddress == null ? null : EBaseAddress.fromJson(json['addressList'] as Map<String, dynamic>),
		);
	}

	Map<String, dynamic> toJson() {
		return <String, dynamic>{
			'id': id,
			'companyID': companyID,
			'type': type,
			'name': name,
			'surname': surname,
			'email': email,
			'login': login,
			'password': password,
			'mobile': mobile,
			'gender': gender,
			'status': status,
			'rg': rg,
			'cpf': cpf,
			'permissions': permissions,
			'firebaseToken': firebaseToken,
			'appleToken': appleToken,
			'mobileVersion': mobileVersion,
			'razaoSocial': razaoSocial,
			'inscricaoEstadual': inscricaoEstadual,
			'simplesNacional': simplesNacional,
			'cnpj': cnpj,
			'website': website,
			'contactName': contactName,
			'contactPhone': contactPhone,
			'creationDateUTC': creationDateUTC?.toIso8601String(),
			'lastAccessUTC': lastAccessUTC?.toIso8601String(),
			'modificationDateUTC': modificationDateUTC?.toIso8601String(),
			'token': token,
			'totalListCount': totalListCount,
			'addressList': addressList,
		};
	}}