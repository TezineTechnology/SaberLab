
class BraspagFraudAnalysisReasonCode {
	static const Success= 100;
	static const MissingMandatoryFields= 101;
	static const InvalidField= 102;
	static const GeneralSystemFailure= 150;
	static const OrderReceivedWithServerTimeout= 151;
	static const OrderReceivedWithTimeout= 152;
	static const CardExpired= 202;
	static const InvalidAccountNumber= 231;
	static const ProblemsOnDealerConfig= 234;
	static const FraudPointsExceed= 400;
	static const OrderMarkedForRevision= 480;
	static const OrderRejectedByRevision= 481;

	static fromJson(dynamic json){
		int value = int.parse(json);
		return value;
		}
}