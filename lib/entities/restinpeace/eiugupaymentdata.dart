//region imports
//author Bruno Tezine
//endregion

class EIuguPaymentData{
	String holder_name;
	String display_number;
	String brand;
	int month;
	int year;

	EIuguPaymentData({
		this.holder_name,
		this.display_number,
		this.brand,
		this.month,
		this.year
});

	factory EIuguPaymentData.fromJson(Map<String, dynamic> json){
		return EIuguPaymentData(
			holder_name: json['holder_name'] as String,
			display_number: json['display_number'] as String,
			brand: json['brand'] as String,
			month: json['month'] as int,
			year: json['year'] as int,
		);
	}

	Map<String, dynamic> toJson() {
		return <String, dynamic>{
			'holder_name': holder_name,
			'display_number': display_number,
			'brand': brand,
			'month': month,
			'year': year,
		};
	}}