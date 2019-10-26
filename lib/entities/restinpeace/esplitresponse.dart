//region imports
//author Bruno Tezine
//endregion

class ESplitResponse{
	bool success;
	String errorMessage;
	String internalErrorMessage;
	int tripID;
	int driverID;
	int userID;
	String stackTrace;
	int subordinateTotal;
	int internalPaymentID;
	String braspagPaymentID;

	ESplitResponse({
		this.success,
		this.errorMessage,
		this.internalErrorMessage,
		this.tripID,
		this.driverID,
		this.userID,
		this.stackTrace,
		this.subordinateTotal,
		this.internalPaymentID,
		this.braspagPaymentID
});

	factory ESplitResponse.fromJson(Map<String, dynamic> json){
		return ESplitResponse(
			success: json['success'] as bool,
			errorMessage: json['errorMessage'] as String,
			internalErrorMessage: json['internalErrorMessage'] as String,
			tripID: json['tripID'] as int,
			driverID: json['driverID'] as int,
			userID: json['userID'] as int,
			stackTrace: json['stackTrace'] as String,
			subordinateTotal: json['subordinateTotal'] as int,
			internalPaymentID: json['internalPaymentID'] as int,
			braspagPaymentID: json['braspagPaymentID'] as String,
		);
	}

	Map<String, dynamic> toJson() {
		return <String, dynamic>{
			'success': success,
			'errorMessage': errorMessage,
			'internalErrorMessage': internalErrorMessage,
			'tripID': tripID,
			'driverID': driverID,
			'userID': userID,
			'stackTrace': stackTrace,
			'subordinateTotal': subordinateTotal,
			'internalPaymentID': internalPaymentID,
			'braspagPaymentID': braspagPaymentID,
		};
	}}