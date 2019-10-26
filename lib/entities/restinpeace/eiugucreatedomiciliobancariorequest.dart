//region imports
//author Bruno Tezine
//endregion

class EIuguCreateDomicilioBancarioRequest{
	String agency;
	String account;
	String account_type;
	String bank;
	String document;

	EIuguCreateDomicilioBancarioRequest({
		this.agency,
		this.account,
		this.account_type,
		this.bank,
		this.document
});

	factory EIuguCreateDomicilioBancarioRequest.fromJson(Map<String, dynamic> json){
		return EIuguCreateDomicilioBancarioRequest(
			agency: json['agency'] as String,
			account: json['account'] as String,
			account_type: json['account_type'] as String,
			bank: json['bank'] as String,
			document: json['document'] as String,
		);
	}

	Map<String, dynamic> toJson() {
		return <String, dynamic>{
			'agency': agency,
			'account': account,
			'account_type': account_type,
			'bank': bank,
			'document': document,
		};
	}}