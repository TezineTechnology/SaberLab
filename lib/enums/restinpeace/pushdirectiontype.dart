
class PushDirectionType {
	static const ToDriver= 1;
	static const ToUser= 2;

	static fromJson(dynamic json){
		int value = int.parse(json);
		return value;
		}
}