
class RespCreateUser {
	static const LoginExists= 1;
	static const EmailExists= 2;
	static const UnknownError= 3;
	static const Ok= 4;
	static const DbError= 5;
	static const RegiaoNaoAtendida= 6;

	static fromJson(dynamic json){
		int value = int.parse(json);
		return value;
		}
}