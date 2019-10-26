//region imports
//author Bruno Tezine
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../codes/bool_helper.dart';
import 'package:saberlab_frontend_web/codes/defines.dart';
import 'package:saberlab_frontend_web/entities/restinpeace/elist.dart';
import 'package:saberlab_frontend_web/entities/restinpeace/eservererror.dart';
//endregion

class ErrorsService{

	static Future<EList> getAll({int listCount=-1, int pageNumber=0}) async {
		var queryParameters = {
		'listCount': (listCount).toString(),
		'pageNumber': (pageNumber).toString(),
		};

		var uri = Uri.http(Defines.RestBaseURL,  '/api/v1/SErrorsService/GetAll', queryParameters);
		final response = await http.get(uri,
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},);

		if (response.statusCode != 200) print('(ErrorsService)GetAll error. Status code: ${response.statusCode}');
		return EList.fromJson(json.decode(response.body));
	}

	static Future<EServerError> getByID(int id) async {
		var uri = Uri.http(Defines.RestBaseURL,  '/api/v1/SErrorsService/GetByID/${id}');
		final response = await http.get(uri,
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},);

		if (response.statusCode != 200) print('(ErrorsService)GetByID error. Status code: ${response.statusCode}');
		return EServerError.fromJson(json.decode(response.body));
	}

	static Future<bool> clear() async {
		var uri = Uri.http(Defines.RestBaseURL,  '/api/v1/SErrorsService/Clear');
		final response = await http.get(uri,
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},);

		if (response.statusCode != 200) print('(ErrorsService)Clear error. Status code: ${response.statusCode}');
		return BoolHelper.convertStringToBool(response.body);
	}

}
