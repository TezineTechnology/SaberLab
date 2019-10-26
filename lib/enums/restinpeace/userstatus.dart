
class UserStatus {
	static const Enabled= 1;
	static const Blocked= 2;

	static fromJson(dynamic json){
		int value = int.parse(json);
		return value;
		}
}