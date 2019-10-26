//region imports
//author Bruno Tezine
//endregion

class EServerConfig{
	int id;
	int hangfireCountToday;
	DateTime lastHangfireDateUTC;
	int withoutStartRateAfterTotal;

	EServerConfig({
		this.id,
		this.hangfireCountToday,
		this.lastHangfireDateUTC,
		this.withoutStartRateAfterTotal
});

	factory EServerConfig.fromJson(Map<String, dynamic> json){
		return EServerConfig(
			id: json['id'] as int,
			hangfireCountToday: json['hangfireCountToday'] as int,
			lastHangfireDateUTC: json['lastHangfireDateUTC'] as DateTime,
			withoutStartRateAfterTotal: json['withoutStartRateAfterTotal'] as int,
		);
	}

	Map<String, dynamic> toJson() {
		return <String, dynamic>{
			'id': id,
			'hangfireCountToday': hangfireCountToday,
			'lastHangfireDateUTC': lastHangfireDateUTC,
			'withoutStartRateAfterTotal': withoutStartRateAfterTotal,
		};
	}}