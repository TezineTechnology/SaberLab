
class BraspagPaymentStatus {
	static const NotFinished= 0;
	static const Authorized= 1;
	static const PaymentConfirmed= 2;
	static const Denied= 3;
	static const Voided= 10;
	static const Refunded= 11;
	static const Pending= 12;
	static const Aborted= 13;
	static const Scheduled= 20;

	static fromJson(dynamic json){
		int value = int.parse(json);
		return value;
		}
}