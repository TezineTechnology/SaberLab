
class PaymentMethodType {
	static const CreditCard= 1;
	static const Debit= 2;
	static const Cash= 3;
	static const PayPal= 4;

	static fromJson(dynamic json){
		int value = int.parse(json);
		return value;
		}
}