
class RecoverResponse {
	static const EmailSent= 1;
	static const EMailNotFound= 2;

	static fromJson(dynamic json){
		int value = int.parse(json);
		return value;
		}
}