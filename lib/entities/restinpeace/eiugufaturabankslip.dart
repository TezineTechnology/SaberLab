//region imports
//author Bruno Tezine
//endregion

class EIuguFaturaBankSlip{
	String digitable_line;
	String barcode_data;
	String barcode;

	EIuguFaturaBankSlip({
		this.digitable_line,
		this.barcode_data,
		this.barcode
});

	factory EIuguFaturaBankSlip.fromJson(Map<String, dynamic> json){
		return EIuguFaturaBankSlip(
			digitable_line: json['digitable_line'] as String,
			barcode_data: json['barcode_data'] as String,
			barcode: json['barcode'] as String,
		);
	}

	Map<String, dynamic> toJson() {
		return <String, dynamic>{
			'digitable_line': digitable_line,
			'barcode_data': barcode_data,
			'barcode': barcode,
		};
	}}