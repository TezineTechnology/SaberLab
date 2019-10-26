
class BraspagReturnCode {
	static const Authorized= 4;
	static const AuthorizedEither= 6;
	static const NonAuthorized= 5;
	static const CardExpired= 57;
	static const CardBlocked= 78;
	static const Timeout= 99;
	static const CardCanceled= 77;
	static const IssuesWithCard= 70;

	static fromJson(dynamic json){
		int value = int.parse(json);
		return value;
		}
}