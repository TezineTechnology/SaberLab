
class DriverStatus {
	static const NotEnabled= 0;
	static const Available= 1;
	static const Busy= 2;
	static const OffTime= 3;

	static fromJson(dynamic json){
		int value = int.parse(json);
		return value;
		}
}