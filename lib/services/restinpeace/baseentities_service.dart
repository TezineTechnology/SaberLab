//region imports
//author Bruno Tezine
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../codes/bool_helper.dart';
import 'package:saberlab_frontend_web/codes/defines.dart';
import 'package:saberlab_frontend_web/entities/restinpeace/ebaseentity.dart';
import 'package:saberlab_frontend_web/entities/restinpeace/euserauth.dart';
//endregion

class BaseEntitiesService{

	static Future<List<EBaseEntity>> getAll(String companyID, {int listCount=-1, int pageNumber=0, String orderBy='name asc'}) async {
		var queryParameters = {
		'listCount': (listCount).toString(),
		'pageNumber': (pageNumber).toString(),
		'orderBy': (orderBy).toString(),
		};

		var uri = Uri.http(Defines.RestBaseURL,  '/api/v1/SBaseEntitiesService/GetAll/${companyID}', queryParameters);
		final response = await http.get(uri,
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},);

		if (response.statusCode != 200) print('(BaseEntitiesService)GetAll error. Status code: ${response.statusCode}');
		return (json.decode(response.body) as List).map((e) => new EBaseEntity.fromJson(e)).toList();
	}

	static Future<EBaseEntity> getByID(String id) async {
		var uri = Uri.http(Defines.RestBaseURL,  '/api/v1/SBaseEntitiesService/GetByID/${id}');
		final response = await http.get(uri,
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},);

		if (response.statusCode != 200) print('(BaseEntitiesService)GetByID error. Status code: ${response.statusCode}');
		return EBaseEntity.fromJson(json.decode(response.body));
	}

	static Future<List<EBaseEntity>> searchByName(String companyID, String name) async {
		var uri = Uri.http(Defines.RestBaseURL,  '/api/v1/SBaseEntitiesService/SearchByName/${companyID}/${name}');
		final response = await http.get(uri,
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},);

		if (response.statusCode != 200) print('(BaseEntitiesService)SearchByName error. Status code: ${response.statusCode}');
		return (json.decode(response.body) as List).map((e) => new EBaseEntity.fromJson(e)).toList();
	}

	static Future<EUserAuth> authenticate(String email, String password) async {
		var uri = Uri.http(Defines.RestBaseURL,  '/api/v1/SBaseEntitiesService/Authenticate/${email}/${password}');
		final response = await http.get(uri,
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},);

		if (response.statusCode != 200) print('(BaseEntitiesService)Authenticate error. Status code: ${response.statusCode}');
		return EUserAuth.fromJson(json.decode(response.body));
	}

	static Future<bool> saveProfile(EBaseEntity eBaseEntity) async {
		var uri = Uri.http(Defines.RestBaseURL,  '/api/v1/SBaseEntitiesService/SaveProfile');
		final response = await http.put(uri,
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},
				body: json.encode(eBaseEntity.toJson()));

		if (response.statusCode != 200) print('(BaseEntitiesService)SaveProfile error. Status code: ${response.statusCode}');
		return BoolHelper.convertStringToBool(response.body);
	}

	static Future<String> save(EBaseEntity eBaseEntity) async {
		var uri = Uri.http(Defines.RestBaseURL,  '/api/v1/SBaseEntitiesService/Save');
		final response = await http.put(uri,
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},
				body: json.encode(eBaseEntity.toJson()));

		if (response.statusCode != 200) print('(BaseEntitiesService)Save error. Status code: ${response.statusCode}');
		return json.decode(response.body);
	}

	static Future<bool> remove(String id) async {
		var uri = Uri.http(Defines.RestBaseURL,  '/api/v1/SBaseEntitiesService/Remove/${id}');
		final response = await http.delete(uri,
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},);

		if (response.statusCode != 200) print('(BaseEntitiesService)Remove error. Status code: ${response.statusCode}');
		return BoolHelper.convertStringToBool(response.body);
	}

	static Future<EUserAuth> createUserFromMobile(EBaseEntity eNewUser) async {
		var uri = Uri.http(Defines.RestBaseURL,  '/api/v1/SBaseEntitiesService/CreateUserFromMobile');
		final response = await http.post(uri,
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},
				body: json.encode(eNewUser.toJson()));

		if (response.statusCode != 200) print('(BaseEntitiesService)CreateUserFromMobile error. Status code: ${response.statusCode}');
		return EUserAuth.fromJson(json.decode(response.body));
	}

}
