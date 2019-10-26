//region imports
//author Bruno Tezine
//endregion

class EDistanceAndDuration{
	bool success;
	int distanceInMeters;
	int travelTimeInSeconds;
	String errorText;

	EDistanceAndDuration({
		this.success,
		this.distanceInMeters,
		this.travelTimeInSeconds,
		this.errorText
});

	factory EDistanceAndDuration.fromJson(Map<String, dynamic> json){
		return EDistanceAndDuration(
			success: json['success'] as bool,
			distanceInMeters: json['distanceInMeters'] as int,
			travelTimeInSeconds: json['travelTimeInSeconds'] as int,
			errorText: json['errorText'] as String,
		);
	}

	Map<String, dynamic> toJson() {
		return <String, dynamic>{
			'success': success,
			'distanceInMeters': distanceInMeters,
			'travelTimeInSeconds': travelTimeInSeconds,
			'errorText': errorText,
		};
	}}