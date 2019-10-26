
class LanguageCode {
	static const PortugueseBrazil= 1;
	static const Italian= 2;
	static const English= 3;

	static fromJson(dynamic json){
		int value = int.parse(json);
		return value;
		}
}