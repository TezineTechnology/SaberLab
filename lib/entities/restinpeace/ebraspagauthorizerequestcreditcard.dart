//region imports
//author Bruno Tezine
//endregion

class EBraspagAuthorizeRequestCreditCard{
	String CardNumber;
	String Holder;
	String ExpirationDate;
	String SecurityCode;
	String Brand;

	EBraspagAuthorizeRequestCreditCard({
		this.CardNumber,
		this.Holder,
		this.ExpirationDate,
		this.SecurityCode,
		this.Brand
});

	factory EBraspagAuthorizeRequestCreditCard.fromJson(Map<String, dynamic> json){
		return EBraspagAuthorizeRequestCreditCard(
			CardNumber: json['CardNumber'] as String,
			Holder: json['Holder'] as String,
			ExpirationDate: json['ExpirationDate'] as String,
			SecurityCode: json['SecurityCode'] as String,
			Brand: json['Brand'] as String,
		);
	}

	Map<String, dynamic> toJson() {
		return <String, dynamic>{
			'CardNumber': CardNumber,
			'Holder': Holder,
			'ExpirationDate': ExpirationDate,
			'SecurityCode': SecurityCode,
			'Brand': Brand,
		};
	}}