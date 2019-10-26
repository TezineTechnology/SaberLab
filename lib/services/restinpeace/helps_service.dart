//region imports
//author Bruno Tezine
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../codes/bool_helper.dart';
import 'package:saberlab_frontend_web/codes/defines.dart';
import 'package:saberlab_frontend_web/entities/restinpeace/ehelp.dart';
import 'package:saberlab_frontend_web/entities/restinpeace/elist.dart';
//endregion

class HelpsService{

	static Future<EList> getAll({int listCount=-1, int pageNumber=0, String orderBy='id desc'}) async {
		var queryParameters = {
		'listCount': (listCount).toString(),
		'pageNumber': (pageNumber).toString(),
		'orderBy': (orderBy).toString(),
		};

		var uri = Uri.http(Defines.RestBaseURL,  '/api/v1/SHelpsService/GetAll', queryParameters);
		final response = await http.get(uri,
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},);

		if (response.statusCode != 200) print('(HelpsService)GetAll error. Status code: ${response.statusCode}');
		return EList.fromJson(json.decode(response.body));
	}

	static Future<EHelp> getByID(int id) async {
		var uri = Uri.http(Defines.RestBaseURL,  '/api/v1/SHelpsService/GetByID/${id}');
		final response = await http.get(uri,
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},);

		if (response.statusCode != 200) print('(HelpsService)GetByID error. Status code: ${response.statusCode}');
		return EHelp.fromJson(json.decode(response.body));
	}

	static Future<String> getHelpContent(int languageCode, int helpType) async {
		var uri = Uri.http(Defines.RestBaseURL,  '/api/v1/SHelpsService/GetHelpContent/${languageCode}/${helpType}');
		final response = await http.get(uri,
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},);

		if (response.statusCode != 200) print('(HelpsService)GetHelpContent error. Status code: ${response.statusCode}');
		return json.decode(response.body);
	}

	static Future<int> save(EHelp eHelp) async {
		var uri = Uri.http(Defines.RestBaseURL,  '/api/v1/SHelpsService/Save');
		final response = await http.put(uri,
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},
				body: json.encode(eHelp.toJson()));

		if (response.statusCode != 200) print('(HelpsService)Save error. Status code: ${response.statusCode}');
		return int.parse(response.body);
	}

	static Future<bool> updateHelp(String helpContent, int languageCode, int helpType) async {
		var uri = Uri.http(Defines.RestBaseURL,  '/api/v1/SHelpsService/UpdateHelp/${languageCode}/${helpType}');
		final response = await http.put(uri,
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},
				body: json.encode(helpContent));

		if (response.statusCode != 200) print('(HelpsService)UpdateHelp error. Status code: ${response.statusCode}');
		return BoolHelper.convertStringToBool(response.body);
	}

}
