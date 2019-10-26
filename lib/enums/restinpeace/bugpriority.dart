
class BugPriority {
	static const Unkown= 0;
	static const Low= 1;
	static const Medium= 2;
	static const High= 3;
	static const ExtraHigh= 4;

	static fromJson(dynamic json){
		int value = int.parse(json);
		return value;
		}
}