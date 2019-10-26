
class BraspagHttpStatusCode {
	static const OkCaptureVoidGet= 200;
	static const OkAuthorization= 201;
	static const BadRequest= 400;
	static const ResourceNotFound= 404;
	static const InternalServerError= 500;

	static fromJson(dynamic json){
		int value = int.parse(json);
		return value;
		}
}