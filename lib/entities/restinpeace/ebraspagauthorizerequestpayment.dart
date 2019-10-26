//region imports
//author Bruno Tezine
import 'package:saberlab_frontend_web/entities/restinpeace/ebraspagauthorizerequestcreditcard.dart';
//endregion

class EBraspagAuthorizeRequestPayment{
	String Type;
	int Amount;
	int Installments;
	String SoftDescriptor;
	EBraspagAuthorizeRequestCreditCard CreditCard;

	EBraspagAuthorizeRequestPayment({
		this.Type,
		this.Amount,
		this.Installments,
		this.SoftDescriptor,
		this.CreditCard
});

	factory EBraspagAuthorizeRequestPayment.fromJson(Map<String, dynamic> json){
		return EBraspagAuthorizeRequestPayment(
			Type: json['Type'] as String,
			Amount: json['Amount'] as int,
			Installments: json['Installments'] as int,
			SoftDescriptor: json['SoftDescriptor'] as String,
			CreditCard: json['CreditCard'] as EBraspagAuthorizeRequestCreditCard == null ? null : EBraspagAuthorizeRequestCreditCard.fromJson(json['CreditCard'] as Map<String, dynamic>),
		);
	}

	Map<String, dynamic> toJson() {
		return <String, dynamic>{
			'Type': Type,
			'Amount': Amount,
			'Installments': Installments,
			'SoftDescriptor': SoftDescriptor,
			'CreditCard': CreditCard,
		};
	}}