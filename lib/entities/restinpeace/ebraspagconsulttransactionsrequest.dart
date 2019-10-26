//region imports
//author Bruno Tezine
//endregion

class EBraspagConsultTransactionsRequest{
	DateTime initialCaptureDate;
	DateTime finalCaptureDate;
	int pageIndex;
	int pageSize;
	String eventStatus;
	bool includeAllSubordinates;
	String merchantIds;

	EBraspagConsultTransactionsRequest({
		this.initialCaptureDate,
		this.finalCaptureDate,
		this.pageIndex,
		this.pageSize,
		this.eventStatus,
		this.includeAllSubordinates,
		this.merchantIds
});

	factory EBraspagConsultTransactionsRequest.fromJson(Map<String, dynamic> json){
		return EBraspagConsultTransactionsRequest(
			initialCaptureDate: json['initialCaptureDate'] as DateTime,
			finalCaptureDate: json['finalCaptureDate'] as DateTime,
			pageIndex: json['pageIndex'] as int,
			pageSize: json['pageSize'] as int,
			eventStatus: json['eventStatus'] as String,
			includeAllSubordinates: json['includeAllSubordinates'] as bool,
			merchantIds: json['merchantIds'] as String,
		);
	}

	Map<String, dynamic> toJson() {
		return <String, dynamic>{
			'initialCaptureDate': initialCaptureDate,
			'finalCaptureDate': finalCaptureDate,
			'pageIndex': pageIndex,
			'pageSize': pageSize,
			'eventStatus': eventStatus,
			'includeAllSubordinates': includeAllSubordinates,
			'merchantIds': merchantIds,
		};
	}}