//region imports
//author Bruno Tezine
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../codes/bool_helper.dart';
import 'package:saberlab_frontend_web/codes/defines.dart';
import 'package:saberlab_frontend_web/entities/restinpeace/elogisticsdriverincident.dart';
//endregion

class LogisticsDriversIncidentsService{

	static Future<List<ELogisticsDriverIncident>> getAll(String companyID, {int listCount=-1, int pageNumber=0, String orderBy='creationdateutc desc'}) async {
		var queryParameters = {
		'listCount': (listCount).toString(),
		'pageNumber': (pageNumber).toString(),
		'orderBy': (orderBy).toString(),
		};

		var uri = Uri.http(Defines.RestBaseURL,  '/api/v1/SLogisticsDriversIncidentsService/GetAll/${companyID}', queryParameters);
		final response = await http.get(uri,
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},);

		if (response.statusCode != 200) print('(LogisticsDriversIncidentsService)GetAll error. Status code: ${response.statusCode}');
		return (json.decode(response.body) as List).map((e) => new ELogisticsDriverIncident.fromJson(e)).toList();
	}

	static Future<ELogisticsDriverIncident> getByID(String id) async {
		var uri = Uri.http(Defines.RestBaseURL,  '/api/v1/SLogisticsDriversIncidentsService/GetByID/${id}');
		final response = await http.get(uri,
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},);

		if (response.statusCode != 200) print('(LogisticsDriversIncidentsService)GetByID error. Status code: ${response.statusCode}');
		return ELogisticsDriverIncident.fromJson(json.decode(response.body));
	}

	static Future<int> getCount(String companyID) async {
		var uri = Uri.http(Defines.RestBaseURL,  '/api/v1/SLogisticsDriversIncidentsService/GetCount/${companyID}');
		final response = await http.get(uri,
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},);

		if (response.statusCode != 200) print('(LogisticsDriversIncidentsService)GetCount error. Status code: ${response.statusCode}');
		return int.parse(response.body);
	}

	static Future<String> save(ELogisticsDriverIncident eIncident) async {
		var uri = Uri.http(Defines.RestBaseURL,  '/api/v1/SLogisticsDriversIncidentsService/Save');
		final response = await http.put(uri,
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},
				body: json.encode(eIncident.toJson()));

		if (response.statusCode != 200) print('(LogisticsDriversIncidentsService)Save error. Status code: ${response.statusCode}');
		return json.decode(response.body);
	}

	static Future<bool> remove(String id) async {
		var uri = Uri.http(Defines.RestBaseURL,  '/api/v1/SLogisticsDriversIncidentsService/Remove/${id}');
		final response = await http.delete(uri,
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},);

		if (response.statusCode != 200) print('(LogisticsDriversIncidentsService)Remove error. Status code: ${response.statusCode}');
		return BoolHelper.convertStringToBool(response.body);
	}

}
