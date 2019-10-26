
class DriverLogMode {
	static const NotLogging= 0;
	static const LoggingWithoutGPS= 1;
	static const LoggingWithGPS= 2;

	static fromJson(dynamic json){
		int value = int.parse(json);
		return value;
		}
}