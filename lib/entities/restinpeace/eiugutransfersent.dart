//region imports
//author Bruno Tezine
import 'package:saberlab_frontend_web/entities/restinpeace/eiugureceiver.dart';
//endregion

class EIuguTransferSent{
	String id;
	DateTime created_at;
	String amount_cents;
	String amount_localized;
	EIuguReceiver receiver;

	EIuguTransferSent({
		this.id,
		this.created_at,
		this.amount_cents,
		this.amount_localized,
		this.receiver
});

	factory EIuguTransferSent.fromJson(Map<String, dynamic> json){
		return EIuguTransferSent(
			id: json['id'] as String,
			created_at: DateTime.parse(json['created_at'] as String),
			amount_cents: json['amount_cents'] as String,
			amount_localized: json['amount_localized'] as String,
			receiver: json['receiver'] as EIuguReceiver == null ? null : EIuguReceiver.fromJson(json['receiver'] as Map<String, dynamic>),
		);
	}

	Map<String, dynamic> toJson() {
		return <String, dynamic>{
			'id': id,
			'created_at': created_at?.toIso8601String(),
			'amount_cents': amount_cents,
			'amount_localized': amount_localized,
			'receiver': receiver,
		};
	}}