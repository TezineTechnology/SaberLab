//region imports
//author Bruno Tezine
//endregion

class EBraspagConsultTransactionsSchedule{
	String merchantId;
	String forecastedDate;
	int installments;
	int installmentAmount;
	int installmentNumber;
	String Event;
	String eventDescription;
	String eventStatus;
	String paymentId;
	String capturedDate;
	String driverName;
	int amount;
	int tripID;

	EBraspagConsultTransactionsSchedule({
		this.merchantId,
		this.forecastedDate,
		this.installments,
		this.installmentAmount,
		this.installmentNumber,
		this.Event,
		this.eventDescription,
		this.eventStatus,
		this.paymentId,
		this.capturedDate,
		this.driverName,
		this.amount,
		this.tripID
});

	factory EBraspagConsultTransactionsSchedule.fromJson(Map<String, dynamic> json){
		return EBraspagConsultTransactionsSchedule(
			merchantId: json['merchantId'] as String,
			forecastedDate: json['forecastedDate'] as String,
			installments: json['installments'] as int,
			installmentAmount: json['installmentAmount'] as int,
			installmentNumber: json['installmentNumber'] as int,
			Event: json['Event'] as String,
			eventDescription: json['eventDescription'] as String,
			eventStatus: json['eventStatus'] as String,
			paymentId: json['paymentId'] as String,
			capturedDate: json['capturedDate'] as String,
			driverName: json['driverName'] as String,
			amount: json['amount'] as int,
			tripID: json['tripID'] as int,
		);
	}

	Map<String, dynamic> toJson() {
		return <String, dynamic>{
			'merchantId': merchantId,
			'forecastedDate': forecastedDate,
			'installments': installments,
			'installmentAmount': installmentAmount,
			'installmentNumber': installmentNumber,
			'Event': Event,
			'eventDescription': eventDescription,
			'eventStatus': eventStatus,
			'paymentId': paymentId,
			'capturedDate': capturedDate,
			'driverName': driverName,
			'amount': amount,
			'tripID': tripID,
		};
	}}