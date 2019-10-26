//region imports
//author Bruno Tezine
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../codes/bool_helper.dart';
import 'package:saberlab_frontend_web/codes/defines.dart';
import 'package:saberlab_frontend_web/entities/restinpeace/ebaseentity.dart';
//endregion

class CompaniesEmployeesService{

	static Future<List<EBaseEntity>> getAll(String companyID, {int listCount=-1, int pageNumber=0, String orderBy='name asc'}) async {
		var queryParameters = {
		'listCount': (listCount).toString(),
		'pageNumber': (pageNumber).toString(),
		'orderBy': (orderBy).toString(),
		};

		var uri = Uri.http(Defines.RestBaseURL,  '/api/v1/SCompaniesEmployeesService/GetAll/${companyID}', queryParameters);
		final response = await http.get(uri,
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},);

		if (response.statusCode != 200) print('(CompaniesEmployeesService)GetAll error. Status code: ${response.statusCode}');
		return (json.decode(response.body) as List).map((e) => new EBaseEntity.fromJson(e)).toList();
	}

	static Future<int> getCount(String companyID) async {
		var uri = Uri.http(Defines.RestBaseURL,  '/api/v1/SCompaniesEmployeesService/GetCount/${companyID}');
		final response = await http.get(uri,
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},);

		if (response.statusCode != 200) print('(CompaniesEmployeesService)GetCount error. Status code: ${response.statusCode}');
		return int.parse(response.body);
	}

	static Future<EBaseEntity> getByID(String id) async {
		var uri = Uri.http(Defines.RestBaseURL,  '/api/v1/SCompaniesEmployeesService/GetByID/${id}');
		final response = await http.get(uri,
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},);

		if (response.statusCode != 200) print('(CompaniesEmployeesService)GetByID error. Status code: ${response.statusCode}');
		return EBaseEntity.fromJson(json.decode(response.body));
	}

	static Future<String> save(EBaseEntity eBaseEntity) async {
		var uri = Uri.http(Defines.RestBaseURL,  '/api/v1/SCompaniesEmployeesService/Save');
		final response = await http.put(uri,
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},
				body: json.encode(eBaseEntity.toJson()));

		if (response.statusCode != 200) print('(CompaniesEmployeesService)Save error. Status code: ${response.statusCode}');
		return json.decode(response.body);
	}

	static Future<bool> remove(String id) async {
		var uri = Uri.http(Defines.RestBaseURL,  '/api/v1/SCompaniesEmployeesService/Remove/${id}');
		final response = await http.delete(uri,
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},);

		if (response.statusCode != 200) print('(CompaniesEmployeesService)Remove error. Status code: ${response.statusCode}');
		return BoolHelper.convertStringToBool(response.body);
	}

}
