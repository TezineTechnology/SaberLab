//region imports
//author Bruno Tezine
//endregion

class EIuguBankAddress{
	String bank;
	String bank_cc;
	String bank_ag;
	String account_type;

	EIuguBankAddress({
		this.bank,
		this.bank_cc,
		this.bank_ag,
		this.account_type
});

	factory EIuguBankAddress.fromJson(Map<String, dynamic> json){
		return EIuguBankAddress(
			bank: json['bank'] as String,
			bank_cc: json['bank_cc'] as String,
			bank_ag: json['bank_ag'] as String,
			account_type: json['account_type'] as String,
		);
	}

	Map<String, dynamic> toJson() {
		return <String, dynamic>{
			'bank': bank,
			'bank_cc': bank_cc,
			'bank_ag': bank_ag,
			'account_type': account_type,
		};
	}}