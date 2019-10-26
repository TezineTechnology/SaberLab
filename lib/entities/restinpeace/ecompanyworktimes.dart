//region imports
//author Bruno Tezine
import 'package:fcharts/fcharts.dart';
//endregion

class ECompanyWorkTimes{
	String id;
	String companyID;
	TimeSpan mondayStart;
	TimeSpan mondayEnd;
	TimeSpan tuesdayStart;
	TimeSpan tuesdayEnd;
	TimeSpan wednesdayStart;
	TimeSpan wednesdayEnd;
	TimeSpan thursdayStart;
	TimeSpan thursdayEnd;
	TimeSpan fridayStart;
	TimeSpan fridayEnd;
	TimeSpan saturdayStart;
	TimeSpan saturdayEnd;
	TimeSpan sundayStart;
	TimeSpan sundayEnd;

	ECompanyWorkTimes({
		this.id,
		this.companyID,
		this.mondayStart,
		this.mondayEnd,
		this.tuesdayStart,
		this.tuesdayEnd,
		this.wednesdayStart,
		this.wednesdayEnd,
		this.thursdayStart,
		this.thursdayEnd,
		this.fridayStart,
		this.fridayEnd,
		this.saturdayStart,
		this.saturdayEnd,
		this.sundayStart,
		this.sundayEnd
});

	factory ECompanyWorkTimes.fromJson(Map<String, dynamic> json){
		return ECompanyWorkTimes(
			id: json['id'] as String,
			companyID: json['companyID'] as String,
			mondayStart: json['mondayStart'] as TimeSpan,
			mondayEnd: json['mondayEnd'] as TimeSpan,
			tuesdayStart: json['tuesdayStart'] as TimeSpan,
			tuesdayEnd: json['tuesdayEnd'] as TimeSpan,
			wednesdayStart: json['wednesdayStart'] as TimeSpan,
			wednesdayEnd: json['wednesdayEnd'] as TimeSpan,
			thursdayStart: json['thursdayStart'] as TimeSpan,
			thursdayEnd: json['thursdayEnd'] as TimeSpan,
			fridayStart: json['fridayStart'] as TimeSpan,
			fridayEnd: json['fridayEnd'] as TimeSpan,
			saturdayStart: json['saturdayStart'] as TimeSpan,
			saturdayEnd: json['saturdayEnd'] as TimeSpan,
			sundayStart: json['sundayStart'] as TimeSpan,
			sundayEnd: json['sundayEnd'] as TimeSpan,
		);
	}

	Map<String, dynamic> toJson() {
		return <String, dynamic>{
			'id': id,
			'companyID': companyID,
			'mondayStart': mondayStart,
			'mondayEnd': mondayEnd,
			'tuesdayStart': tuesdayStart,
			'tuesdayEnd': tuesdayEnd,
			'wednesdayStart': wednesdayStart,
			'wednesdayEnd': wednesdayEnd,
			'thursdayStart': thursdayStart,
			'thursdayEnd': thursdayEnd,
			'fridayStart': fridayStart,
			'fridayEnd': fridayEnd,
			'saturdayStart': saturdayStart,
			'saturdayEnd': saturdayEnd,
			'sundayStart': sundayStart,
			'sundayEnd': sundayEnd,
		};
	}}