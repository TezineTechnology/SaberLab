//region imports
//author Bruno Tezine
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../codes/bool_helper.dart';
import 'package:saberlab_frontend_web/codes/defines.dart';
import 'package:saberlab_frontend_web/entities/restinpeace/ebug.dart';
//endregion

class BugTrackingService{

	static Future<EBug> getByID(int id) async {
		var uri = Uri.http(Defines.RestBaseURL,  '/api/v1/SBugTrackingService/GetByID/${id}');
		final response = await http.get(uri,
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},);

		if (response.statusCode != 200) print('(BugTrackingService)GetByID error. Status code: ${response.statusCode}');
		return EBug.fromJson(json.decode(response.body));
	}

	static Future<List<EBug>> getAll({int listCount=-1, int pageNumber=0}) async {
		var queryParameters = {
		'listCount': (listCount).toString(),
		'pageNumber': (pageNumber).toString(),
		};

		var uri = Uri.http(Defines.RestBaseURL,  '/api/v1/SBugTrackingService/GetAll', queryParameters);
		final response = await http.get(uri,
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},);

		if (response.statusCode != 200) print('(BugTrackingService)GetAll error. Status code: ${response.statusCode}');
		return (json.decode(response.body) as List).map((e) => new EBug.fromJson(e)).toList();
	}

	static Future<int> save(EBug eBug) async {
		var uri = Uri.http(Defines.RestBaseURL,  '/api/v1/SBugTrackingService/Save');
		final response = await http.put(uri,
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},
				body: json.encode(eBug.toJson()));

		if (response.statusCode != 200) print('(BugTrackingService)Save error. Status code: ${response.statusCode}');
		return int.parse(response.body);
	}

}
