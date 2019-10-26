//region imports
//author Bruno Tezine
//endregion

class EBraspagAuthorizeRequestCustomer{
	String Name;

	EBraspagAuthorizeRequestCustomer({
		this.Name
});

	factory EBraspagAuthorizeRequestCustomer.fromJson(Map<String, dynamic> json){
		return EBraspagAuthorizeRequestCustomer(
			Name: json['Name'] as String,
		);
	}

	Map<String, dynamic> toJson() {
		return <String, dynamic>{
			'Name': Name,
		};
	}}