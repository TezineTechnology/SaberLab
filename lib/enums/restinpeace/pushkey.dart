
class PushKey {
	static const TripID= 1;
	static const DriverID= 2;
	static const TripAccepted= 3;
	static const NewTrip= 4;
	static const DriverAcceptedTrip= 5;
	static const DriverArrivedAtStartAddress= 6;
	static const DriverFinalizedTrip= 7;
	static const MsgFromUserToDriver= 8;
	static const MsgFromDriverToUser= 9;
	static const MsgFromUttiliToDriver= 10;
	static const DriverEnabled= 11;

	static fromJson(dynamic json){
		int value = int.parse(json);
		return value;
		}
}