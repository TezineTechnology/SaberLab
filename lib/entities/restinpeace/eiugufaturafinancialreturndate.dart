//region imports
//author Bruno Tezine
//endregion

class EIuguFaturaFinancialReturnDate{
	int id;
	int installment;
	String return_date;
	String status;
	String amount;
	String taxes;
	String executed_date;
	bool advanced;

	EIuguFaturaFinancialReturnDate({
		this.id,
		this.installment,
		this.return_date,
		this.status,
		this.amount,
		this.taxes,
		this.executed_date,
		this.advanced
});

	factory EIuguFaturaFinancialReturnDate.fromJson(Map<String, dynamic> json){
		return EIuguFaturaFinancialReturnDate(
			id: json['id'] as int,
			installment: json['installment'] as int,
			return_date: json['return_date'] as String,
			status: json['status'] as String,
			amount: json['amount'] as String,
			taxes: json['taxes'] as String,
			executed_date: json['executed_date'] as String,
			advanced: json['advanced'] as bool,
		);
	}

	Map<String, dynamic> toJson() {
		return <String, dynamic>{
			'id': id,
			'installment': installment,
			'return_date': return_date,
			'status': status,
			'amount': amount,
			'taxes': taxes,
			'executed_date': executed_date,
			'advanced': advanced,
		};
	}}