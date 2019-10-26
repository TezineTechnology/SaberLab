//region imports
//author Bruno Tezine
//endregion

class ELastVerificationRequestData{
	String price_range;
	String physical_products;
	String business_type;
	String person_type;
	String automatic_transfer;
	String cpf;
	String name;
	String address;
	String cep;
	String city;
	String state;
	String telephone;
	String bank;
	String bank_ag;
	String account_type;
	String bank_cc;
	String document_id;
	String document_cpf;
	String document_activity;

	ELastVerificationRequestData({
		this.price_range,
		this.physical_products,
		this.business_type,
		this.person_type,
		this.automatic_transfer,
		this.cpf,
		this.name,
		this.address,
		this.cep,
		this.city,
		this.state,
		this.telephone,
		this.bank,
		this.bank_ag,
		this.account_type,
		this.bank_cc,
		this.document_id,
		this.document_cpf,
		this.document_activity
});

	factory ELastVerificationRequestData.fromJson(Map<String, dynamic> json){
		return ELastVerificationRequestData(
			price_range: json['price_range'] as String,
			physical_products: json['physical_products'] as String,
			business_type: json['business_type'] as String,
			person_type: json['person_type'] as String,
			automatic_transfer: json['automatic_transfer'] as String,
			cpf: json['cpf'] as String,
			name: json['name'] as String,
			address: json['address'] as String,
			cep: json['cep'] as String,
			city: json['city'] as String,
			state: json['state'] as String,
			telephone: json['telephone'] as String,
			bank: json['bank'] as String,
			bank_ag: json['bank_ag'] as String,
			account_type: json['account_type'] as String,
			bank_cc: json['bank_cc'] as String,
			document_id: json['document_id'] as String,
			document_cpf: json['document_cpf'] as String,
			document_activity: json['document_activity'] as String,
		);
	}

	Map<String, dynamic> toJson() {
		return <String, dynamic>{
			'price_range': price_range,
			'physical_products': physical_products,
			'business_type': business_type,
			'person_type': person_type,
			'automatic_transfer': automatic_transfer,
			'cpf': cpf,
			'name': name,
			'address': address,
			'cep': cep,
			'city': city,
			'state': state,
			'telephone': telephone,
			'bank': bank,
			'bank_ag': bank_ag,
			'account_type': account_type,
			'bank_cc': bank_cc,
			'document_id': document_id,
			'document_cpf': document_cpf,
			'document_activity': document_activity,
		};
	}}