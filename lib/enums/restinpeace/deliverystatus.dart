
class DeliveryStatus {
	static const PendingApproval= 1;
	static const Approved= 2;
	static const Delivering= 3;
	static const Delivered= 4;
	static const CanceledByUser= 5;
	static const CanceledByCompany= 6;

	static fromJson(dynamic json){
		int value = int.parse(json);
		return value;
		}
}