
class ErrorCode {
	static const NoError= 0;
	static const Unknown= 1;
	static const ServerException= 2;
	static const MobileExists= 3;
	static const EmailExists= 4;

	static fromJson(dynamic json){
		int value = int.parse(json);
		return value;
		}
}