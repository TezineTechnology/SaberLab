//region imports
//author Bruno Tezine
import 'package:saberlab_frontend_web/entities/restinpeace/eiugusender.dart';
//endregion

class EIuguTransferReceived{
	String id;
	DateTime created_at;
	String amount_cents;
	String amount_localized;
	EIuguSender sender;

	EIuguTransferReceived({
		this.id,
		this.created_at,
		this.amount_cents,
		this.amount_localized,
		this.sender
});

	factory EIuguTransferReceived.fromJson(Map<String, dynamic> json){
		return EIuguTransferReceived(
			id: json['id'] as String,
			created_at: DateTime.parse(json['created_at'] as String),
			amount_cents: json['amount_cents'] as String,
			amount_localized: json['amount_localized'] as String,
			sender: json['sender'] as EIuguSender == null ? null : EIuguSender.fromJson(json['sender'] as Map<String, dynamic>),
		);
	}

	Map<String, dynamic> toJson() {
		return <String, dynamic>{
			'id': id,
			'created_at': created_at?.toIso8601String(),
			'amount_cents': amount_cents,
			'amount_localized': amount_localized,
			'sender': sender,
		};
	}}