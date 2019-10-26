
class HelpType {
	static const DriverHomeMap= 1;
	static const DriverMyPayments= 2;
	static const DriverMyTrips= 3;
	static const DriverMyQualifications= 4;
	static const DriverSupport= 5;
	static const DriverData= 6;
	static const DriverVehicleData= 7;
	static const DriverConfigPayment= 8;
	static const DriverConfigNotifications= 9;
	static const DriverMapToDest= 10;
	static const UserHomeCategories= 100;
	static const UserMyTrips= 101;
	static const UserPaymentMethods= 102;
	static const UserProfile= 103;
	static const UserAddresses= 104;
	static const UserHomeMap= 105;
	static const UserHomeMapConfirmed= 106;
	static const UserAddressEdit= 107;

	static fromJson(dynamic json){
		int value = int.parse(json);
		return value;
		}
}