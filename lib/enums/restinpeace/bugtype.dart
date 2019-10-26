
class BugType {
	static const Bug= 1;
	static const Enhancement= 2;

	static fromJson(dynamic json){
		int value = int.parse(json);
		return value;
		}
}