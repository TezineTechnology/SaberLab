//region imports
//author Bruno Tezine
import 'package:saberlab_frontend_web/entities/restinpeace/ecompanyconfig.dart';
//endregion

class ECompany{
	String id;
	String name;
	String email;
	String completeAddress;
	String street;
	String number;
	String addressComplement;
	String referencePoint;
	String neighborhood;
	String postalCode;
	int cityID;
	int stateID;
	int countryID;
	String phone1;
	String phone2;
	String mobile;
	bool enabled;
	String website;
	String labSite;
	String cnpj;
	String razaoSocial;
	String inscricaoEstadual;
	String simplesNacional;
	String contactName;
	String contactPhone;
	String contactEmail;
	String modulesUsed;
	String config;
	DateTime creationDateUTC;
	DateTime modificationDateUTC;
	DateTime lastAccessUTC;
	ECompanyConfig eCompanyConfig;

	ECompany({
		this.id,
		this.name,
		this.email,
		this.completeAddress,
		this.street,
		this.number,
		this.addressComplement,
		this.referencePoint,
		this.neighborhood,
		this.postalCode,
		this.cityID,
		this.stateID,
		this.countryID,
		this.phone1,
		this.phone2,
		this.mobile,
		this.enabled,
		this.website,
		this.labSite,
		this.cnpj,
		this.razaoSocial,
		this.inscricaoEstadual,
		this.simplesNacional,
		this.contactName,
		this.contactPhone,
		this.contactEmail,
		this.modulesUsed,
		this.config,
		this.creationDateUTC,
		this.modificationDateUTC,
		this.lastAccessUTC,
		this.eCompanyConfig
});

	factory ECompany.fromJson(Map<String, dynamic> json){
		return ECompany(
			id: json['id'] as String,
			name: json['name'] as String,
			email: json['email'] as String,
			completeAddress: json['completeAddress'] as String,
			street: json['street'] as String,
			number: json['number'] as String,
			addressComplement: json['addressComplement'] as String,
			referencePoint: json['referencePoint'] as String,
			neighborhood: json['neighborhood'] as String,
			postalCode: json['postalCode'] as String,
			cityID: json['cityID'] as int,
			stateID: json['stateID'] as int,
			countryID: json['countryID'] as int,
			phone1: json['phone1'] as String,
			phone2: json['phone2'] as String,
			mobile: json['mobile'] as String,
			enabled: json['enabled'] as bool,
			website: json['website'] as String,
			labSite: json['labSite'] as String,
			cnpj: json['cnpj'] as String,
			razaoSocial: json['razaoSocial'] as String,
			inscricaoEstadual: json['inscricaoEstadual'] as String,
			simplesNacional: json['simplesNacional'] as String,
			contactName: json['contactName'] as String,
			contactPhone: json['contactPhone'] as String,
			contactEmail: json['contactEmail'] as String,
			modulesUsed: json['modulesUsed'] as String,
			config: json['config'] as String,
			creationDateUTC: DateTime.parse(json['creationDateUTC'] as String),
			modificationDateUTC: DateTime.parse(json['modificationDateUTC'] as String),
			lastAccessUTC: DateTime.parse(json['lastAccessUTC'] as String),
			eCompanyConfig: json['eCompanyConfig'] as ECompanyConfig == null ? null : ECompanyConfig.fromJson(json['eCompanyConfig'] as Map<String, dynamic>),
		);
	}

	Map<String, dynamic> toJson() {
		return <String, dynamic>{
			'id': id,
			'name': name,
			'email': email,
			'completeAddress': completeAddress,
			'street': street,
			'number': number,
			'addressComplement': addressComplement,
			'referencePoint': referencePoint,
			'neighborhood': neighborhood,
			'postalCode': postalCode,
			'cityID': cityID,
			'stateID': stateID,
			'countryID': countryID,
			'phone1': phone1,
			'phone2': phone2,
			'mobile': mobile,
			'enabled': enabled,
			'website': website,
			'labSite': labSite,
			'cnpj': cnpj,
			'razaoSocial': razaoSocial,
			'inscricaoEstadual': inscricaoEstadual,
			'simplesNacional': simplesNacional,
			'contactName': contactName,
			'contactPhone': contactPhone,
			'contactEmail': contactEmail,
			'modulesUsed': modulesUsed,
			'config': config,
			'creationDateUTC': creationDateUTC?.toIso8601String(),
			'modificationDateUTC': modificationDateUTC?.toIso8601String(),
			'lastAccessUTC': lastAccessUTC?.toIso8601String(),
			'eCompanyConfig': eCompanyConfig,
		};
	}}