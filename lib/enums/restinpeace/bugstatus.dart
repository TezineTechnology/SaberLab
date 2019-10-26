
class BugStatus {
	static const New= 1;
	static const InProgress= 20;
	static const Closed= 30;

	static fromJson(dynamic json){
		int value = int.parse(json);
		return value;
		}
}