//region imports
//author Bruno Tezine
//endregion

class EIuguCreateDomicilioBancarioResponse{
	bool success;

	EIuguCreateDomicilioBancarioResponse({
		this.success
});

	factory EIuguCreateDomicilioBancarioResponse.fromJson(Map<String, dynamic> json){
		return EIuguCreateDomicilioBancarioResponse(
			success: json['success'] as bool,
		);
	}

	Map<String, dynamic> toJson() {
		return <String, dynamic>{
			'success': success,
		};
	}}