//region imports
//author Bruno Tezine
import 'package:saberlab_frontend_web/entities/restinpeace/eiugupaymentdata.dart';
//endregion

class EIuguPaymentMethod{
	String id;
	String description;
	String item_type;
	String customer_id;
	EIuguPaymentData data;

	EIuguPaymentMethod({
		this.id,
		this.description,
		this.item_type,
		this.customer_id,
		this.data
});

	factory EIuguPaymentMethod.fromJson(Map<String, dynamic> json){
		return EIuguPaymentMethod(
			id: json['id'] as String,
			description: json['description'] as String,
			item_type: json['item_type'] as String,
			customer_id: json['customer_id'] as String,
			data: json['data'] as EIuguPaymentData == null ? null : EIuguPaymentData.fromJson(json['data'] as Map<String, dynamic>),
		);
	}

	Map<String, dynamic> toJson() {
		return <String, dynamic>{
			'id': id,
			'description': description,
			'item_type': item_type,
			'customer_id': customer_id,
			'data': data,
		};
	}}