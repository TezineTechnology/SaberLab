//region imports
//author Bruno Tezine
//endregion

class EIuguInvoiceItem2{
	String id;
	String description;
	int price_cents;
	int quantity;
	DateTime created_at;
	DateTime updated_at;
	String price;

	EIuguInvoiceItem2({
		this.id,
		this.description,
		this.price_cents,
		this.quantity,
		this.created_at,
		this.updated_at,
		this.price
});

	factory EIuguInvoiceItem2.fromJson(Map<String, dynamic> json){
		return EIuguInvoiceItem2(
			id: json['id'] as String,
			description: json['description'] as String,
			price_cents: json['price_cents'] as int,
			quantity: json['quantity'] as int,
			created_at: DateTime.parse(json['created_at'] as String),
			updated_at: DateTime.parse(json['updated_at'] as String),
			price: json['price'] as String,
		);
	}

	Map<String, dynamic> toJson() {
		return <String, dynamic>{
			'id': id,
			'description': description,
			'price_cents': price_cents,
			'quantity': quantity,
			'created_at': created_at?.toIso8601String(),
			'updated_at': updated_at?.toIso8601String(),
			'price': price,
		};
	}}