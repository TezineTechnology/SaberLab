//region imports
//author Bruno Tezine
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../codes/bool_helper.dart';
import 'package:saberlab_frontend_web/codes/defines.dart';
import 'package:saberlab_frontend_web/entities/restinpeace/ecity.dart';
//endregion

class CitiesService{

	static Future<ECity> getByID(int cityID) async {
		var uri = Uri.http(Defines.RestBaseURL,  '/api/v1/SCitiesService/GetByID/${cityID}');
		final response = await http.get(uri,
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},);

		if (response.statusCode != 200) print('(CitiesService)GetByID error. Status code: ${response.statusCode}');
		return ECity.fromJson(json.decode(response.body));
	}

	static Future<List<ECity>> getAllByState(int stateID) async {
		var uri = Uri.http(Defines.RestBaseURL,  '/api/v1/SCitiesService/GetAllByState/${stateID}');
		final response = await http.get(uri,
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},);

		if (response.statusCode != 200) print('(CitiesService)GetAllByState error. Status code: ${response.statusCode}');
		return (json.decode(response.body) as List).map((e) => new ECity.fromJson(e)).toList();
	}

	static Future<List<ECity>> searchCityByName(String name, {int listCount=-1, int pageNumber=0}) async {
		var queryParameters = {
		'listCount': (listCount).toString(),
		'pageNumber': (pageNumber).toString(),
		};

		var uri = Uri.http(Defines.RestBaseURL,  '/api/v1/SCitiesService/SearchCityByName/${name}', queryParameters);
		final response = await http.get(uri,
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},);

		if (response.statusCode != 200) print('(CitiesService)SearchCityByName error. Status code: ${response.statusCode}');
		return (json.decode(response.body) as List).map((e) => new ECity.fromJson(e)).toList();
	}

}
