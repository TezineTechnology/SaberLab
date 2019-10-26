//region imports
//author Bruno Tezine
import 'package:saberlab_frontend_web/enums/restinpeace/deliverystatus.dart';
import 'package:saberlab_frontend_web/entities/restinpeace/edeliveryproductinbasket.dart';
//endregion

class EDeliveryOrder{
	String id;
	String companyID;
	int visualID;
	String entityID;
	int paymentMethodType;
	DateTime exitDateUTC;
	DateTime deliveryDateUTC;
	DeliveryStatus status;
	String content;
	int qualification;
	String userComment;
	int discount;
	String notes;
	int change;
	int changeFor;
	int total;
	DateTime creationDateUTC;
	DateTime creationDateLocal;
	DateTime modificationDateUTC;
	String entityName;
	String statusName;
	EDeliveryProductInBasket productList;

	EDeliveryOrder({
		this.id,
		this.companyID,
		this.visualID,
		this.entityID,
		this.paymentMethodType,
		this.exitDateUTC,
		this.deliveryDateUTC,
		this.status,
		this.content,
		this.qualification,
		this.userComment,
		this.discount,
		this.notes,
		this.change,
		this.changeFor,
		this.total,
		this.creationDateUTC,
		this.creationDateLocal,
		this.modificationDateUTC,
		this.entityName,
		this.statusName,
		this.productList
});

	factory EDeliveryOrder.fromJson(Map<String, dynamic> json){
		return EDeliveryOrder(
			id: json['id'] as String,
			companyID: json['companyID'] as String,
			visualID: json['visualID'] as int,
			entityID: json['entityID'] as String,
			paymentMethodType: json['paymentMethodType'] as int,
			exitDateUTC: json['exitDateUTC'] as DateTime,
			deliveryDateUTC: json['deliveryDateUTC'] as DateTime,
			status: json['status'] as DeliveryStatus == null ? null : DeliveryStatus.fromJson(json['status'] as Map<String, dynamic>),
			content: json['content'] as String,
			qualification: json['qualification'] as int,
			userComment: json['userComment'] as String,
			discount: json['discount'] as int,
			notes: json['notes'] as String,
			change: json['change'] as int,
			changeFor: json['changeFor'] as int,
			total: json['total'] as int,
			creationDateUTC: DateTime.parse(json['creationDateUTC'] as String),
			creationDateLocal: json['creationDateLocal'] as DateTime,
			modificationDateUTC: DateTime.parse(json['modificationDateUTC'] as String),
			entityName: json['entityName'] as String,
			statusName: json['statusName'] as String,
			productList: json['productList'] as EDeliveryProductInBasket == null ? null : EDeliveryProductInBasket.fromJson(json['productList'] as Map<String, dynamic>),
		);
	}

	Map<String, dynamic> toJson() {
		return <String, dynamic>{
			'id': id,
			'companyID': companyID,
			'visualID': visualID,
			'entityID': entityID,
			'paymentMethodType': paymentMethodType,
			'exitDateUTC': exitDateUTC,
			'deliveryDateUTC': deliveryDateUTC,
			'status': status,
			'content': content,
			'qualification': qualification,
			'userComment': userComment,
			'discount': discount,
			'notes': notes,
			'change': change,
			'changeFor': changeFor,
			'total': total,
			'creationDateUTC': creationDateUTC?.toIso8601String(),
			'creationDateLocal': creationDateLocal,
			'modificationDateUTC': modificationDateUTC?.toIso8601String(),
			'entityName': entityName,
			'statusName': statusName,
			'productList': productList,
		};
	}}