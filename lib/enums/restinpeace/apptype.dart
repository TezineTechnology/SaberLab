
class AppType {
	static const Website= 1;
	static const MobileUser= 2;
	static const MobileDriver= 3;
	static const All= 4;

	static fromJson(dynamic json){
		int value = int.parse(json);
		return value;
		}
}