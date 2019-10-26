//region imports
//author Bruno Tezine
import 'package:saberlab_frontend_web/entities/restinpeace/eiuguinvoiceitem2.dart';
//endregion

class EIuguInvoiceItem{
	String id;
	String due_date;
	String currency;
	String customer_id;
	dynamic discount_cents;
	String email;
	dynamic expiration_url;
	dynamic notification_url;
	dynamic return_url;
	String status;
	dynamic tax_cents;
	DateTime updated_at;
	int total_cents;
	int commission_cents;
	String secure_id;
	String secure_url;
	dynamic user_id;
	String commission;
	String total;
	String created_at;
	EIuguInvoiceItem2 items;
	dynamic variables;
	dynamic logs;

	EIuguInvoiceItem({
		this.id,
		this.due_date,
		this.currency,
		this.customer_id,
		this.discount_cents,
		this.email,
		this.expiration_url,
		this.notification_url,
		this.return_url,
		this.status,
		this.tax_cents,
		this.updated_at,
		this.total_cents,
		this.commission_cents,
		this.secure_id,
		this.secure_url,
		this.user_id,
		this.commission,
		this.total,
		this.created_at,
		this.items,
		this.variables,
		this.logs
});

	factory EIuguInvoiceItem.fromJson(Map<String, dynamic> json){
		return EIuguInvoiceItem(
			id: json['id'] as String,
			due_date: json['due_date'] as String,
			currency: json['currency'] as String,
			customer_id: json['customer_id'] as String,
			discount_cents: json['discount_cents'] as dynamic,
			email: json['email'] as String,
			expiration_url: json['expiration_url'] as dynamic,
			notification_url: json['notification_url'] as dynamic,
			return_url: json['return_url'] as dynamic,
			status: json['status'] as String,
			tax_cents: json['tax_cents'] as dynamic,
			updated_at: DateTime.parse(json['updated_at'] as String),
			total_cents: json['total_cents'] as int,
			commission_cents: json['commission_cents'] as int,
			secure_id: json['secure_id'] as String,
			secure_url: json['secure_url'] as String,
			user_id: json['user_id'] as dynamic,
			commission: json['commission'] as String,
			total: json['total'] as String,
			created_at: json['created_at'] as String,
			items: json['items'] as EIuguInvoiceItem2 == null ? null : EIuguInvoiceItem2.fromJson(json['items'] as Map<String, dynamic>),
			variables: json['variables'] as dynamic,
			logs: json['logs'] as dynamic,
		);
	}

	Map<String, dynamic> toJson() {
		return <String, dynamic>{
			'id': id,
			'due_date': due_date,
			'currency': currency,
			'customer_id': customer_id,
			'discount_cents': discount_cents,
			'email': email,
			'expiration_url': expiration_url,
			'notification_url': notification_url,
			'return_url': return_url,
			'status': status,
			'tax_cents': tax_cents,
			'updated_at': updated_at?.toIso8601String(),
			'total_cents': total_cents,
			'commission_cents': commission_cents,
			'secure_id': secure_id,
			'secure_url': secure_url,
			'user_id': user_id,
			'commission': commission,
			'total': total,
			'created_at': created_at,
			'items': items,
			'variables': variables,
			'logs': logs,
		};
	}}