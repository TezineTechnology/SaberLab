//region imports
//author Bruno Tezine
//endregion

class EBraspagConsultEventRequest{
	String accessToken;
	DateTime initialForecastedDate;
	DateTime finalForecastedDate;
	DateTime initialPaymentDate;
	DateTime finalPaymentDate;
	int pageIndex;
	int pageSize;
	String eventStatus;
	bool includeAllSubordinates;
	String merchantIds;

	EBraspagConsultEventRequest({
		this.accessToken,
		this.initialForecastedDate,
		this.finalForecastedDate,
		this.initialPaymentDate,
		this.finalPaymentDate,
		this.pageIndex,
		this.pageSize,
		this.eventStatus,
		this.includeAllSubordinates,
		this.merchantIds
});

	factory EBraspagConsultEventRequest.fromJson(Map<String, dynamic> json){
		return EBraspagConsultEventRequest(
			accessToken: json['accessToken'] as String,
			initialForecastedDate: json['initialForecastedDate'] as DateTime,
			finalForecastedDate: json['finalForecastedDate'] as DateTime,
			initialPaymentDate: json['initialPaymentDate'] as DateTime,
			finalPaymentDate: json['finalPaymentDate'] as DateTime,
			pageIndex: json['pageIndex'] as int,
			pageSize: json['pageSize'] as int,
			eventStatus: json['eventStatus'] as String,
			includeAllSubordinates: json['includeAllSubordinates'] as bool,
			merchantIds: json['merchantIds'] as String,
		);
	}

	Map<String, dynamic> toJson() {
		return <String, dynamic>{
			'accessToken': accessToken,
			'initialForecastedDate': initialForecastedDate,
			'finalForecastedDate': finalForecastedDate,
			'initialPaymentDate': initialPaymentDate,
			'finalPaymentDate': finalPaymentDate,
			'pageIndex': pageIndex,
			'pageSize': pageSize,
			'eventStatus': eventStatus,
			'includeAllSubordinates': includeAllSubordinates,
			'merchantIds': merchantIds,
		};
	}}