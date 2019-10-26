//region imports
//author Bruno Tezine
//endregion

class ECompanyConfig{
	bool acceptCreditCard;
	bool acceptDebitCard;
	bool acceptCash;

	ECompanyConfig({
		this.acceptCreditCard,
		this.acceptDebitCard,
		this.acceptCash
});

	factory ECompanyConfig.fromJson(Map<String, dynamic> json){
		return ECompanyConfig(
			acceptCreditCard: json['acceptCreditCard'] as bool,
			acceptDebitCard: json['acceptDebitCard'] as bool,
			acceptCash: json['acceptCash'] as bool,
		);
	}

	Map<String, dynamic> toJson() {
		return <String, dynamic>{
			'acceptCreditCard': acceptCreditCard,
			'acceptDebitCard': acceptDebitCard,
			'acceptCash': acceptCash,
		};
	}}