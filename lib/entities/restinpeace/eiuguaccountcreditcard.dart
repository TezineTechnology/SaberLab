//region imports
//author Bruno Tezine
//endregion

class EIuguAccountCreditCard{
	bool active;
	String soft_descriptor;
	bool installments;
	bool installments_pass_interest;
	String max_installments;
	String max_installments_without_interest;
	bool two_step_transaction;

	EIuguAccountCreditCard({
		this.active,
		this.soft_descriptor,
		this.installments,
		this.installments_pass_interest,
		this.max_installments,
		this.max_installments_without_interest,
		this.two_step_transaction
});

	factory EIuguAccountCreditCard.fromJson(Map<String, dynamic> json){
		return EIuguAccountCreditCard(
			active: json['active'] as bool,
			soft_descriptor: json['soft_descriptor'] as String,
			installments: json['installments'] as bool,
			installments_pass_interest: json['installments_pass_interest'] as bool,
			max_installments: json['max_installments'] as String,
			max_installments_without_interest: json['max_installments_without_interest'] as String,
			two_step_transaction: json['two_step_transaction'] as bool,
		);
	}

	Map<String, dynamic> toJson() {
		return <String, dynamic>{
			'active': active,
			'soft_descriptor': soft_descriptor,
			'installments': installments,
			'installments_pass_interest': installments_pass_interest,
			'max_installments': max_installments,
			'max_installments_without_interest': max_installments_without_interest,
			'two_step_transaction': two_step_transaction,
		};
	}}