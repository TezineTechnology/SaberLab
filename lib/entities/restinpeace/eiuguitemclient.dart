//region imports
//author Bruno Tezine
//endregion

class EIuguItemClient{
	String id;
	String email;
	String name;
	String notes;
	DateTime created_at;
	DateTime updated_at;

	EIuguItemClient({
		this.id,
		this.email,
		this.name,
		this.notes,
		this.created_at,
		this.updated_at
});

	factory EIuguItemClient.fromJson(Map<String, dynamic> json){
		return EIuguItemClient(
			id: json['id'] as String,
			email: json['email'] as String,
			name: json['name'] as String,
			notes: json['notes'] as String,
			created_at: DateTime.parse(json['created_at'] as String),
			updated_at: DateTime.parse(json['updated_at'] as String),
		);
	}

	Map<String, dynamic> toJson() {
		return <String, dynamic>{
			'id': id,
			'email': email,
			'name': name,
			'notes': notes,
			'created_at': created_at?.toIso8601String(),
			'updated_at': updated_at?.toIso8601String(),
		};
	}}