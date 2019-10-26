//region imports
//author Bruno Tezine
//endregion

class EIuguBankSlip{
	bool active;
	int extra_due;
	int reprint_extra_due;

	EIuguBankSlip({
		this.active,
		this.extra_due,
		this.reprint_extra_due
});

	factory EIuguBankSlip.fromJson(Map<String, dynamic> json){
		return EIuguBankSlip(
			active: json['active'] as bool,
			extra_due: json['extra_due'] as int,
			reprint_extra_due: json['reprint_extra_due'] as int,
		);
	}

	Map<String, dynamic> toJson() {
		return <String, dynamic>{
			'active': active,
			'extra_due': extra_due,
			'reprint_extra_due': reprint_extra_due,
		};
	}}