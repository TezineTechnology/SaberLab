//region imports
//author Bruno Tezine
import 'package:saberlab_frontend_web/entities/restinpeace/edeliveryproductinbasket.dart';
//endregion

class EDeliveryConfirmOrder{
	String userID;
	String companyID;
	String comments;
	int paymentMethodType;
	int total;
	int changeFor;
	DateTime creationDateLocal;
	EDeliveryProductInBasket productList;

	EDeliveryConfirmOrder({
		this.userID,
		this.companyID,
		this.comments,
		this.paymentMethodType,
		this.total,
		this.changeFor,
		this.creationDateLocal,
		this.productList
});

	factory EDeliveryConfirmOrder.fromJson(Map<String, dynamic> json){
		return EDeliveryConfirmOrder(
			userID: json['userID'] as String,
			companyID: json['companyID'] as String,
			comments: json['comments'] as String,
			paymentMethodType: json['paymentMethodType'] as int,
			total: json['total'] as int,
			changeFor: json['changeFor'] as int,
			creationDateLocal: json['creationDateLocal'] as DateTime,
			productList: json['productList'] as EDeliveryProductInBasket == null ? null : EDeliveryProductInBasket.fromJson(json['productList'] as Map<String, dynamic>),
		);
	}

	Map<String, dynamic> toJson() {
		return <String, dynamic>{
			'userID': userID,
			'companyID': companyID,
			'comments': comments,
			'paymentMethodType': paymentMethodType,
			'total': total,
			'changeFor': changeFor,
			'creationDateLocal': creationDateLocal,
			'productList': productList,
		};
	}}