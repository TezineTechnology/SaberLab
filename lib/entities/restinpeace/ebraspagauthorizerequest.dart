//region imports
//author Bruno Tezine
import 'package:saberlab_frontend_web/entities/restinpeace/ebraspagauthorizerequestcustomer.dart';
import 'package:saberlab_frontend_web/entities/restinpeace/ebraspagauthorizerequestpayment.dart';
//endregion

class EBraspagAuthorizeRequest{
	String MerchantOrderId;
	EBraspagAuthorizeRequestCustomer Customer;
	EBraspagAuthorizeRequestPayment Payment;

	EBraspagAuthorizeRequest({
		this.MerchantOrderId,
		this.Customer,
		this.Payment
});

	factory EBraspagAuthorizeRequest.fromJson(Map<String, dynamic> json){
		return EBraspagAuthorizeRequest(
			MerchantOrderId: json['MerchantOrderId'] as String,
			Customer: json['Customer'] as EBraspagAuthorizeRequestCustomer == null ? null : EBraspagAuthorizeRequestCustomer.fromJson(json['Customer'] as Map<String, dynamic>),
			Payment: json['Payment'] as EBraspagAuthorizeRequestPayment == null ? null : EBraspagAuthorizeRequestPayment.fromJson(json['Payment'] as Map<String, dynamic>),
		);
	}

	Map<String, dynamic> toJson() {
		return <String, dynamic>{
			'MerchantOrderId': MerchantOrderId,
			'Customer': Customer,
			'Payment': Payment,
		};
	}}