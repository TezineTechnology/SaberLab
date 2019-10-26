//region imports
//author Bruno Tezine
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../codes/bool_helper.dart';
import 'package:saberlab_frontend_web/codes/defines.dart';
import 'package:saberlab_frontend_web/entities/restinpeace/ecoordinate.dart';
import 'package:saberlab_frontend_web/entities/restinpeace/ecoordinates.dart';
import 'package:saberlab_frontend_web/entities/restinpeace/edistanceandduration.dart';
//endregion

class GISService{

	static Future<int> getEstimatedTime(int fromLat, int fromLong, int toLat, int toLong) async {
		var uri = Uri.http(Defines.RestBaseURL,  '/api/v1/SGISService/GetEstimatedTime/${fromLat}/${fromLong}/${toLat}/${toLong}');
		final response = await http.get(uri,
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},);

		if (response.statusCode != 200) print('(GISService)GetEstimatedTime error. Status code: ${response.statusCode}');
		return int.parse(response.body);
	}

	static Future<int> getEstimatedTimeToArriveAtPoint(String driverCoordinates, int pointID) async {
		var uri = Uri.http(Defines.RestBaseURL,  '/api/v1/SGISService/GetEstimatedTimeToArriveAtPoint/${driverCoordinates}/${pointID}');
		final response = await http.get(uri,
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},);

		if (response.statusCode != 200) print('(GISService)GetEstimatedTimeToArriveAtPoint error. Status code: ${response.statusCode}');
		return int.parse(response.body);
	}

	static Future<List<ECoordinate>> getPossibleCoordinatesFromAddress(String endereco) async {
		var uri = Uri.http(Defines.RestBaseURL,  '/api/v1/SGISService/GetPossibleCoordinatesFromAddress/${endereco}');
		final response = await http.get(uri,
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},);

		if (response.statusCode != 200) print('(GISService)GetPossibleCoordinatesFromAddress error. Status code: ${response.statusCode}');
		return (json.decode(response.body) as List).map((e) => new ECoordinate.fromJson(e)).toList();
	}

	static Future<List<ECoordinate>> getPossibleSPCoordinatesFromAddress(String endereco) async {
		var uri = Uri.http(Defines.RestBaseURL,  '/api/v1/SGISService/GetPossibleSPCoordinatesFromAddress/${endereco}');
		final response = await http.get(uri,
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},);

		if (response.statusCode != 200) print('(GISService)GetPossibleSPCoordinatesFromAddress error. Status code: ${response.statusCode}');
		return (json.decode(response.body) as List).map((e) => new ECoordinate.fromJson(e)).toList();
	}

	static Future<ECoordinate> getCoordenadaDoEndereco(ECoordinate eCoordinate) async {
		var uri = Uri.http(Defines.RestBaseURL,  '/api/v1/SGISService/GetCoordenadaDoEndereco');
		final response = await http.post(uri,
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},
				body: json.encode(eCoordinate.toJson()));

		if (response.statusCode != 200) print('(GISService)GetCoordenadaDoEndereco error. Status code: ${response.statusCode}');
		return ECoordinate.fromJson(json.decode(response.body));
	}

	static Future<ECoordinate> getCoordinatesFromAddress(String address, String country) async {
		var queryParameters = {
		'country': (country).toString(),
		};

		var uri = Uri.http(Defines.RestBaseURL,  '/api/v1/SGISService/GetCoordinatesFromAddress/${address}', queryParameters);
		final response = await http.post(uri,
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},);

		if (response.statusCode != 200) print('(GISService)GetCoordinatesFromAddress error. Status code: ${response.statusCode}');
		return ECoordinate.fromJson(json.decode(response.body));
	}

	static Future<EDistanceAndDuration> getDistanceWithGoogle(ECoordinates eCoordinates) async {
		var uri = Uri.http(Defines.RestBaseURL,  '/api/v1/SGISService/GetDistanceWithGoogle');
		final response = await http.put(uri,
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},
				body: json.encode(eCoordinates.toJson()));

		if (response.statusCode != 200) print('(GISService)GetDistanceWithGoogle error. Status code: ${response.statusCode}');
		return EDistanceAndDuration.fromJson(json.decode(response.body));
	}

	static Future<ECoordinate> getAddressOfPostalCode(String postalCode) async {
		var uri = Uri.http(Defines.RestBaseURL,  '/api/v1/SGISService/GetAddressOfPostalCode/${postalCode}');
		final response = await http.get(uri,
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},);

		if (response.statusCode != 200) print('(GISService)GetAddressOfPostalCode error. Status code: ${response.statusCode}');
		return ECoordinate.fromJson(json.decode(response.body));
	}

}
