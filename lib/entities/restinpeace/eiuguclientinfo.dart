//region imports
//author Bruno Tezine
import 'package:saberlab_frontend_web/entities/restinpeace/eiugupaymentmethod.dart';
//endregion

class EIuguClientInfo{
	String id;
	String email;
	String name;
	String notes;
	DateTime created_at;
	DateTime updated_at;
	dynamic custom_variables;
	EIuguPaymentMethod paymentMethods;

	EIuguClientInfo({
		this.id,
		this.email,
		this.name,
		this.notes,
		this.created_at,
		this.updated_at,
		this.custom_variables,
		this.paymentMethods
});

	factory EIuguClientInfo.fromJson(Map<String, dynamic> json){
		return EIuguClientInfo(
			id: json['id'] as String,
			email: json['email'] as String,
			name: json['name'] as String,
			notes: json['notes'] as String,
			created_at: DateTime.parse(json['created_at'] as String),
			updated_at: DateTime.parse(json['updated_at'] as String),
			custom_variables: json['custom_variables'] as dynamic,
			paymentMethods: json['paymentMethods'] as EIuguPaymentMethod == null ? null : EIuguPaymentMethod.fromJson(json['paymentMethods'] as Map<String, dynamic>),
		);
	}

	Map<String, dynamic> toJson() {
		return <String, dynamic>{
			'id': id,
			'email': email,
			'name': name,
			'notes': notes,
			'created_at': created_at?.toIso8601String(),
			'updated_at': updated_at?.toIso8601String(),
			'custom_variables': custom_variables,
			'paymentMethods': paymentMethods,
		};
	}}