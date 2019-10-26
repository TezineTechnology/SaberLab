//region imports
//author Bruno Tezine
import 'package:saberlab_frontend_web/entities/restinpeace/eiugubankaddress.dart';
//endregion

class EIuguBankTransfer{
	String id;
	String status;
	String created_at;
	String updated_at;
	String amount;
	String account_name;
	String account_id;
	EIuguBankAddress bank_address;

	EIuguBankTransfer({
		this.id,
		this.status,
		this.created_at,
		this.updated_at,
		this.amount,
		this.account_name,
		this.account_id,
		this.bank_address
});

	factory EIuguBankTransfer.fromJson(Map<String, dynamic> json){
		return EIuguBankTransfer(
			id: json['id'] as String,
			status: json['status'] as String,
			created_at: json['created_at'] as String,
			updated_at: json['updated_at'] as String,
			amount: json['amount'] as String,
			account_name: json['account_name'] as String,
			account_id: json['account_id'] as String,
			bank_address: json['bank_address'] as EIuguBankAddress == null ? null : EIuguBankAddress.fromJson(json['bank_address'] as Map<String, dynamic>),
		);
	}

	Map<String, dynamic> toJson() {
		return <String, dynamic>{
			'id': id,
			'status': status,
			'created_at': created_at,
			'updated_at': updated_at,
			'amount': amount,
			'account_name': account_name,
			'account_id': account_id,
			'bank_address': bank_address,
		};
	}}