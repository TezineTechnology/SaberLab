
class BraspagCardBrand {
	static const Amex= 0;
	static const Diners= 1;
	static const Discover= 2;
	static const JCB= 3;
	static const Master= 4;
	static const Dankort= 5;
	static const Cartebleue= 6;
	static const Maestro= 7;
	static const Visa= 8;
	static const Elo= 9;
	static const Hipercard= 10;

	static fromJson(dynamic json){
		int value = int.parse(json);
		return value;
		}
}