//region imports
//author Bruno Tezine
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../codes/bool_helper.dart';
import 'package:saberlab_frontend_web/codes/defines.dart';
import 'package:saberlab_frontend_web/entities/restinpeace/ecompany.dart';
import 'package:saberlab_frontend_web/entities/restinpeace/elist.dart';
import 'package:saberlab_frontend_web/entities/restinpeace/edashboard.dart';
//endregion

class CompaniesService{

	static Future<EList> getAll({int listCount=-1, int pageNumber=0, String orderBy='name asc'}) async {
		var queryParameters = {
		'listCount': (listCount).toString(),
		'pageNumber': (pageNumber).toString(),
		'orderBy': (orderBy).toString(),
		};

		var uri = Uri.http(Defines.RestBaseURL,  '/api/v1/SCompaniesService/GetAll', queryParameters);
		final response = await http.get(uri,
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},);

		if (response.statusCode != 200) print('(CompaniesService)GetAll error. Status code: ${response.statusCode}');
		return EList.fromJson(json.decode(response.body));
	}

	static Future<ECompany> getByID(String id) async {
		var uri = Uri.http(Defines.RestBaseURL,  '/api/v1/SCompaniesService/GetByID/${id}');
		final response = await http.get(uri,
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},);

		if (response.statusCode != 200) print('(CompaniesService)GetByID error. Status code: ${response.statusCode}');
		return ECompany.fromJson(json.decode(response.body));
	}

	static Future<EDashboard> getDashboard(String companyID) async {
		var uri = Uri.http(Defines.RestBaseURL,  '/api/v1/SCompaniesService/GetDashboard/${companyID}');
		final response = await http.get(uri,
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},);

		if (response.statusCode != 200) print('(CompaniesService)GetDashboard error. Status code: ${response.statusCode}');
		return EDashboard.fromJson(json.decode(response.body));
	}

	static Future<bool> remove(String id) async {
		var uri = Uri.http(Defines.RestBaseURL,  '/api/v1/SCompaniesService/Remove/${id}');
		final response = await http.delete(uri,
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},);

		if (response.statusCode != 200) print('(CompaniesService)Remove error. Status code: ${response.statusCode}');
		return BoolHelper.convertStringToBool(response.body);
	}

	static Future<String> save(ECompany eCompany) async {
		var uri = Uri.http(Defines.RestBaseURL,  '/api/v1/SCompaniesService/Save');
		final response = await http.put(uri,
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},
				body: json.encode(eCompany.toJson()));

		if (response.statusCode != 200) print('(CompaniesService)Save error. Status code: ${response.statusCode}');
		return json.decode(response.body);
	}

}
