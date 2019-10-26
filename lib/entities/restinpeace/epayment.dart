//region imports
//author Bruno Tezine
//endregion

class EPayment{
	int id;
	int driverID;
	String braspagPaymentID;
	String returnCode;
	String returnMessage;
	int orderTotal;
	int driverTotal;
	int uttiliTotal;
	int mdr;
	DateTime receivedDate;
	DateTime captureDate;
	String proofOfSale;
	String authorizationCode;
	String tid;
	String creditCardBrand;
	int status;
	String getLink;
	int driverTotalDecimal;
	int orderTotalDecimal;

	EPayment({
		this.id,
		this.driverID,
		this.braspagPaymentID,
		this.returnCode,
		this.returnMessage,
		this.orderTotal,
		this.driverTotal,
		this.uttiliTotal,
		this.mdr,
		this.receivedDate,
		this.captureDate,
		this.proofOfSale,
		this.authorizationCode,
		this.tid,
		this.creditCardBrand,
		this.status,
		this.getLink,
		this.driverTotalDecimal,
		this.orderTotalDecimal
});

	factory EPayment.fromJson(Map<String, dynamic> json){
		return EPayment(
			id: json['id'] as int,
			driverID: json['driverID'] as int,
			braspagPaymentID: json['braspagPaymentID'] as String,
			returnCode: json['returnCode'] as String,
			returnMessage: json['returnMessage'] as String,
			orderTotal: json['orderTotal'] as int,
			driverTotal: json['driverTotal'] as int,
			uttiliTotal: json['uttiliTotal'] as int,
			mdr: json['mdr'] as int,
			receivedDate: DateTime.parse(json['receivedDate'] as String),
			captureDate: json['captureDate'] as DateTime,
			proofOfSale: json['proofOfSale'] as String,
			authorizationCode: json['authorizationCode'] as String,
			tid: json['tid'] as String,
			creditCardBrand: json['creditCardBrand'] as String,
			status: json['status'] as int,
			getLink: json['getLink'] as String,
			driverTotalDecimal: json['driverTotalDecimal'] as int,
			orderTotalDecimal: json['orderTotalDecimal'] as int,
		);
	}

	Map<String, dynamic> toJson() {
		return <String, dynamic>{
			'id': id,
			'driverID': driverID,
			'braspagPaymentID': braspagPaymentID,
			'returnCode': returnCode,
			'returnMessage': returnMessage,
			'orderTotal': orderTotal,
			'driverTotal': driverTotal,
			'uttiliTotal': uttiliTotal,
			'mdr': mdr,
			'receivedDate': receivedDate?.toIso8601String(),
			'captureDate': captureDate,
			'proofOfSale': proofOfSale,
			'authorizationCode': authorizationCode,
			'tid': tid,
			'creditCardBrand': creditCardBrand,
			'status': status,
			'getLink': getLink,
			'driverTotalDecimal': driverTotalDecimal,
			'orderTotalDecimal': orderTotalDecimal,
		};
	}}