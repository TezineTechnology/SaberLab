//region imports
//author Bruno Tezine
import 'package:saberlab_frontend_web/entities/restinpeace/ecoordinate.dart';
import 'package:saberlab_frontend_web/entities/restinpeace/ecoordinate.dart';
//endregion

class ECoordinates{
	ECoordinate startCoordinate;
	ECoordinate destCoordinate;

	ECoordinates({
		this.startCoordinate,
		this.destCoordinate
});

	factory ECoordinates.fromJson(Map<String, dynamic> json){
		return ECoordinates(
			startCoordinate: json['startCoordinate'] as ECoordinate == null ? null : ECoordinate.fromJson(json['startCoordinate'] as Map<String, dynamic>),
			destCoordinate: json['destCoordinate'] as ECoordinate == null ? null : ECoordinate.fromJson(json['destCoordinate'] as Map<String, dynamic>),
		);
	}

	Map<String, dynamic> toJson() {
		return <String, dynamic>{
			'startCoordinate': startCoordinate,
			'destCoordinate': destCoordinate,
		};
	}}