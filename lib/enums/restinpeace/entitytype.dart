
class EntityType {
	static const Unknown= 0;
	static const Employee= 1;
	static const Supplier= 2;
	static const Client= 3;
	static const Driver= 4;

	static fromJson(dynamic json){
		int value = int.parse(json);
		return value;
		}
}