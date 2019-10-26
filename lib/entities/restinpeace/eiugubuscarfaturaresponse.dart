//region imports
//author Bruno Tezine
import 'package:saberlab_frontend_web/entities/restinpeace/eiugufaturabankslip.dart';
import 'package:saberlab_frontend_web/entities/restinpeace/eiugufaturafinancialreturndate.dart';
import 'package:saberlab_frontend_web/entities/restinpeace/eiugufaturaitem.dart';
import 'package:saberlab_frontend_web/entities/restinpeace/eiugufaturavariable.dart';
//endregion

class EIuguBuscarFaturaResponse{
	String id;
	String due_date;
	String currency;
	dynamic discount_cents;
	String email;
	int items_total_cents;
	dynamic notification_url;
	dynamic return_url;
	String status;
	dynamic tax_cents;
	DateTime updated_at;
	int total_cents;
	dynamic paid_at;
	dynamic commission_cents;
	String secure_id;
	String secure_url;
	dynamic customer_id;
	dynamic user_id;
	String total;
	String taxes_paid;
	String financial_return_date;
	String commission;
	dynamic interest;
	dynamic discount;
	String created_at;
	dynamic refundable;
	dynamic installments;
	EIuguFaturaBankSlip bank_slip;
	EIuguFaturaFinancialReturnDate financial_return_dates;
	EIuguFaturaItem items;
	EIuguFaturaVariable variables;
	dynamic custom_variables;
	dynamic logs;

	EIuguBuscarFaturaResponse({
		this.id,
		this.due_date,
		this.currency,
		this.discount_cents,
		this.email,
		this.items_total_cents,
		this.notification_url,
		this.return_url,
		this.status,
		this.tax_cents,
		this.updated_at,
		this.total_cents,
		this.paid_at,
		this.commission_cents,
		this.secure_id,
		this.secure_url,
		this.customer_id,
		this.user_id,
		this.total,
		this.taxes_paid,
		this.financial_return_date,
		this.commission,
		this.interest,
		this.discount,
		this.created_at,
		this.refundable,
		this.installments,
		this.bank_slip,
		this.financial_return_dates,
		this.items,
		this.variables,
		this.custom_variables,
		this.logs
});

	factory EIuguBuscarFaturaResponse.fromJson(Map<String, dynamic> json){
		return EIuguBuscarFaturaResponse(
			id: json['id'] as String,
			due_date: json['due_date'] as String,
			currency: json['currency'] as String,
			discount_cents: json['discount_cents'] as dynamic,
			email: json['email'] as String,
			items_total_cents: json['items_total_cents'] as int,
			notification_url: json['notification_url'] as dynamic,
			return_url: json['return_url'] as dynamic,
			status: json['status'] as String,
			tax_cents: json['tax_cents'] as dynamic,
			updated_at: DateTime.parse(json['updated_at'] as String),
			total_cents: json['total_cents'] as int,
			paid_at: json['paid_at'] as dynamic,
			commission_cents: json['commission_cents'] as dynamic,
			secure_id: json['secure_id'] as String,
			secure_url: json['secure_url'] as String,
			customer_id: json['customer_id'] as dynamic,
			user_id: json['user_id'] as dynamic,
			total: json['total'] as String,
			taxes_paid: json['taxes_paid'] as String,
			financial_return_date: json['financial_return_date'] as String,
			commission: json['commission'] as String,
			interest: json['interest'] as dynamic,
			discount: json['discount'] as dynamic,
			created_at: json['created_at'] as String,
			refundable: json['refundable'] as dynamic,
			installments: json['installments'] as dynamic,
			bank_slip: json['bank_slip'] as EIuguFaturaBankSlip == null ? null : EIuguFaturaBankSlip.fromJson(json['bank_slip'] as Map<String, dynamic>),
			financial_return_dates: json['financial_return_dates'] as EIuguFaturaFinancialReturnDate == null ? null : EIuguFaturaFinancialReturnDate.fromJson(json['financial_return_dates'] as Map<String, dynamic>),
			items: json['items'] as EIuguFaturaItem == null ? null : EIuguFaturaItem.fromJson(json['items'] as Map<String, dynamic>),
			variables: json['variables'] as EIuguFaturaVariable == null ? null : EIuguFaturaVariable.fromJson(json['variables'] as Map<String, dynamic>),
			custom_variables: json['custom_variables'] as dynamic,
			logs: json['logs'] as dynamic,
		);
	}

	Map<String, dynamic> toJson() {
		return <String, dynamic>{
			'id': id,
			'due_date': due_date,
			'currency': currency,
			'discount_cents': discount_cents,
			'email': email,
			'items_total_cents': items_total_cents,
			'notification_url': notification_url,
			'return_url': return_url,
			'status': status,
			'tax_cents': tax_cents,
			'updated_at': updated_at?.toIso8601String(),
			'total_cents': total_cents,
			'paid_at': paid_at,
			'commission_cents': commission_cents,
			'secure_id': secure_id,
			'secure_url': secure_url,
			'customer_id': customer_id,
			'user_id': user_id,
			'total': total,
			'taxes_paid': taxes_paid,
			'financial_return_date': financial_return_date,
			'commission': commission,
			'interest': interest,
			'discount': discount,
			'created_at': created_at,
			'refundable': refundable,
			'installments': installments,
			'bank_slip': bank_slip,
			'financial_return_dates': financial_return_dates,
			'items': items,
			'variables': variables,
			'custom_variables': custom_variables,
			'logs': logs,
		};
	}}