//region imports
//author Bruno Tezine
//endregion

class ECoordinate{
	String texto;
	String nome;
	int relevancia;
	int latitude;
	int longitude;
	String pais;
	String estado;
	String cep;
	String cidade;
	String rua;
	bool valido;
	String numero;
	String bairro;
	String shortAddressWithoutCity;
	bool isValid;
	int stateID;
	int cityID;

	ECoordinate({
		this.texto,
		this.nome,
		this.relevancia,
		this.latitude,
		this.longitude,
		this.pais,
		this.estado,
		this.cep,
		this.cidade,
		this.rua,
		this.valido,
		this.numero,
		this.bairro,
		this.shortAddressWithoutCity,
		this.isValid,
		this.stateID,
		this.cityID
});

	factory ECoordinate.fromJson(Map<String, dynamic> json){
		return ECoordinate(
			texto: json['texto'] as String,
			nome: json['nome'] as String,
			relevancia: json['relevancia'] as int,
			latitude: json['latitude'] as int,
			longitude: json['longitude'] as int,
			pais: json['pais'] as String,
			estado: json['estado'] as String,
			cep: json['cep'] as String,
			cidade: json['cidade'] as String,
			rua: json['rua'] as String,
			valido: json['valido'] as bool,
			numero: json['numero'] as String,
			bairro: json['bairro'] as String,
			shortAddressWithoutCity: json['shortAddressWithoutCity'] as String,
			isValid: json['isValid'] as bool,
			stateID: json['stateID'] as int,
			cityID: json['cityID'] as int,
		);
	}

	Map<String, dynamic> toJson() {
		return <String, dynamic>{
			'texto': texto,
			'nome': nome,
			'relevancia': relevancia,
			'latitude': latitude,
			'longitude': longitude,
			'pais': pais,
			'estado': estado,
			'cep': cep,
			'cidade': cidade,
			'rua': rua,
			'valido': valido,
			'numero': numero,
			'bairro': bairro,
			'shortAddressWithoutCity': shortAddressWithoutCity,
			'isValid': isValid,
			'stateID': stateID,
			'cityID': cityID,
		};
	}}