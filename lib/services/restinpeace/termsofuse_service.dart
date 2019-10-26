//region imports
//author Bruno Tezine
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../codes/bool_helper.dart';
import 'package:saberlab_frontend_web/codes/defines.dart';
import 'package:saberlab_frontend_web/entities/restinpeace/etermsofuse.dart';
import 'package:saberlab_frontend_web/entities/restinpeace/elist.dart';
//endregion

class TermsOfUseService{

	static Future<ETermsOfUse> getTermsOfUse(int appType) async {
		var uri = Uri.http(Defines.RestBaseURL,  '/api/v1/STermsOfUseService/GetTermsOfUse/${appType}');
		final response = await http.get(uri,
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},);

		if (response.statusCode != 200) print('(TermsOfUseService)GetTermsOfUse error. Status code: ${response.statusCode}');
		return ETermsOfUse.fromJson(json.decode(response.body));
	}

	static Future<EList> getAll({int listCount=-1, int pageNumber=0, String orderBy='id desc'}) async {
		var queryParameters = {
		'listCount': (listCount).toString(),
		'pageNumber': (pageNumber).toString(),
		'orderBy': (orderBy).toString(),
		};

		var uri = Uri.http(Defines.RestBaseURL,  '/api/v1/STermsOfUseService/GetAll', queryParameters);
		final response = await http.get(uri,
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},);

		if (response.statusCode != 200) print('(TermsOfUseService)GetAll error. Status code: ${response.statusCode}');
		return EList.fromJson(json.decode(response.body));
	}

	static Future<ETermsOfUse> getByID(int id) async {
		var uri = Uri.http(Defines.RestBaseURL,  '/api/v1/STermsOfUseService/GetByID/${id}');
		final response = await http.get(uri,
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},);

		if (response.statusCode != 200) print('(TermsOfUseService)GetByID error. Status code: ${response.statusCode}');
		return ETermsOfUse.fromJson(json.decode(response.body));
	}

	static Future<int> save(ETermsOfUse eTerm) async {
		var uri = Uri.http(Defines.RestBaseURL,  '/api/v1/STermsOfUseService/Save');
		final response = await http.put(uri,
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},
				body: json.encode(eTerm.toJson()));

		if (response.statusCode != 200) print('(TermsOfUseService)Save error. Status code: ${response.statusCode}');
		return int.parse(response.body);
	}

}
