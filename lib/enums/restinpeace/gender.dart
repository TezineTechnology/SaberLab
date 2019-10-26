
class Gender {
	static const Male= 1;
	static const Female= 2;

	static fromJson(dynamic json){
		int value = int.parse(json);
		return value;
		}
}