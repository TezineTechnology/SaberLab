//region imports
//author Bruno Tezine
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../codes/bool_helper.dart';
import 'package:saberlab_frontend_web/codes/defines.dart';
import 'package:saberlab_frontend_web/entities/restinpeace/ebaseentity.dart';
//endregion

class CompaniesSuppliersService{

	static Future<List<EBaseEntity>> getAll(String companyID, {int listCount=-1, int pageNumber=0, String orderBy='name asc'}) async {
		var queryParameters = {
		'listCount': (listCount).toString(),
		'pageNumber': (pageNumber).toString(),
		'orderBy': (orderBy).toString(),
		};

		var uri = Uri.http(Defines.RestBaseURL,  '/api/v1/SCompaniesSuppliersService/GetAll/${companyID}', queryParameters);
		final response = await http.get(uri,
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},);

		if (response.statusCode != 200) print('(CompaniesSuppliersService)GetAll error. Status code: ${response.statusCode}');
		return (json.decode(response.body) as List).map((e) => new EBaseEntity.fromJson(e)).toList();
	}

	static Future<int> getCount(String companyID) async {
		var uri = Uri.http(Defines.RestBaseURL,  '/api/v1/SCompaniesSuppliersService/GetCount/${companyID}');
		final response = await http.get(uri,
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},);

		if (response.statusCode != 200) print('(CompaniesSuppliersService)GetCount error. Status code: ${response.statusCode}');
		return int.parse(response.body);
	}

	static Future<EBaseEntity> getByID(String id) async {
		var uri = Uri.http(Defines.RestBaseURL,  '/api/v1/SCompaniesSuppliersService/GetByID/${id}');
		final response = await http.get(uri,
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},);

		if (response.statusCode != 200) print('(CompaniesSuppliersService)GetByID error. Status code: ${response.statusCode}');
		return EBaseEntity.fromJson(json.decode(response.body));
	}

	static Future<List<EBaseEntity>> search(String txt, {int listCount=-1, int pageNumber=0, String orderBy='name asc'}) async {
		var queryParameters = {
		'txt': (txt).toString(),
		'listCount': (listCount).toString(),
		'pageNumber': (pageNumber).toString(),
		'orderBy': (orderBy).toString(),
		};

		var uri = Uri.http(Defines.RestBaseURL,  '/api/v1/SCompaniesSuppliersService/Search', queryParameters);
		final response = await http.get(uri,
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},);

		if (response.statusCode != 200) print('(CompaniesSuppliersService)Search error. Status code: ${response.statusCode}');
		return (json.decode(response.body) as List).map((e) => new EBaseEntity.fromJson(e)).toList();
	}

	static Future<String> save(EBaseEntity eBaseEntity) async {
		var uri = Uri.http(Defines.RestBaseURL,  '/api/v1/SCompaniesSuppliersService/Save');
		final response = await http.put(uri,
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},
				body: json.encode(eBaseEntity.toJson()));

		if (response.statusCode != 200) print('(CompaniesSuppliersService)Save error. Status code: ${response.statusCode}');
		return json.decode(response.body);
	}

	static Future<bool> remove(String id) async {
		var uri = Uri.http(Defines.RestBaseURL,  '/api/v1/SCompaniesSuppliersService/Remove/${id}');
		final response = await http.delete(uri,
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},);

		if (response.statusCode != 200) print('(CompaniesSuppliersService)Remove error. Status code: ${response.statusCode}');
		return BoolHelper.convertStringToBool(response.body);
	}

}
