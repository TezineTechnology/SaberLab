//region imports
//author Bruno Tezine
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../codes/bool_helper.dart';
import 'package:saberlab_frontend_web/codes/defines.dart';
import 'package:saberlab_frontend_web/entities/restinpeace/ebugcomment.dart';
//endregion

class BugCommentsService{

	static Future<EBugComment> getByID(int id) async {
		var uri = Uri.http(Defines.RestBaseURL,  '/api/v1/SBugCommentsService/GetByID/${id}');
		final response = await http.get(uri,
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},);

		if (response.statusCode != 200) print('(BugCommentsService)GetByID error. Status code: ${response.statusCode}');
		return EBugComment.fromJson(json.decode(response.body));
	}

	static Future<List<EBugComment>> getAll(int bugID, {int listCount=-1, int pageNumber=0}) async {
		var queryParameters = {
		'listCount': (listCount).toString(),
		'pageNumber': (pageNumber).toString(),
		};

		var uri = Uri.http(Defines.RestBaseURL,  '/api/v1/SBugCommentsService/GetAll/${bugID}', queryParameters);
		final response = await http.get(uri,
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},);

		if (response.statusCode != 200) print('(BugCommentsService)GetAll error. Status code: ${response.statusCode}');
		return (json.decode(response.body) as List).map((e) => new EBugComment.fromJson(e)).toList();
	}

	static Future<int> save(EBugComment eBugComment) async {
		var uri = Uri.http(Defines.RestBaseURL,  '/api/v1/SBugCommentsService/Save');
		final response = await http.put(uri,
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},
				body: json.encode(eBugComment.toJson()));

		if (response.statusCode != 200) print('(BugCommentsService)Save error. Status code: ${response.statusCode}');
		return int.parse(response.body);
	}

}
