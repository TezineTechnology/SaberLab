
class CreditCardBrand {
	static const Master= 1;
	static const Visa= 2;
	static const AmericanExpress= 3;
	static const Elo= 4;
	static const Discover= 5;

	static fromJson(dynamic json){
		int value = int.parse(json);
		return value;
		}
}