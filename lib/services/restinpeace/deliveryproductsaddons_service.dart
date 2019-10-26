//region imports
//author Bruno Tezine
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../codes/bool_helper.dart';
import 'package:saberlab_frontend_web/codes/defines.dart';
import 'package:saberlab_frontend_web/entities/restinpeace/edeliveryproductaddon.dart';
//endregion

class DeliveryProductsAddonsService{

	static Future<List<EDeliveryProductAddon>> getAll(String companyID, {int listCount=-1, int pageNumber=0, String orderBy='name asc'}) async {
		var queryParameters = {
		'listCount': (listCount).toString(),
		'pageNumber': (pageNumber).toString(),
		'orderBy': (orderBy).toString(),
		};

		var uri = Uri.http(Defines.RestBaseURL,  '/api/v1/SDeliveryProductsAddonsService/GetAll/${companyID}', queryParameters);
		final response = await http.get(uri,
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},);

		if (response.statusCode != 200) print('(DeliveryProductsAddonsService)GetAll error. Status code: ${response.statusCode}');
		return (json.decode(response.body) as List).map((e) => new EDeliveryProductAddon.fromJson(e)).toList();
	}

	static Future<List<EDeliveryProductAddon>> getAllGroupNames(String companyID) async {
		var uri = Uri.http(Defines.RestBaseURL,  '/api/v1/SDeliveryProductsAddonsService/GetAllGroupNames/${companyID}');
		final response = await http.get(uri,
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},);

		if (response.statusCode != 200) print('(DeliveryProductsAddonsService)GetAllGroupNames error. Status code: ${response.statusCode}');
		return (json.decode(response.body) as List).map((e) => new EDeliveryProductAddon.fromJson(e)).toList();
	}

	static Future<List<EDeliveryProductAddon>> getChildAddons(String parentGroupID) async {
		var uri = Uri.http(Defines.RestBaseURL,  '/api/v1/SDeliveryProductsAddonsService/GetChildAddons/${parentGroupID}');
		final response = await http.get(uri,
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},);

		if (response.statusCode != 200) print('(DeliveryProductsAddonsService)GetChildAddons error. Status code: ${response.statusCode}');
		return (json.decode(response.body) as List).map((e) => new EDeliveryProductAddon.fromJson(e)).toList();
	}

	static Future<int> getCount(String companyID) async {
		var uri = Uri.http(Defines.RestBaseURL,  '/api/v1/SDeliveryProductsAddonsService/GetCount/${companyID}');
		final response = await http.get(uri,
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},);

		if (response.statusCode != 200) print('(DeliveryProductsAddonsService)GetCount error. Status code: ${response.statusCode}');
		return int.parse(response.body);
	}

	static Future<EDeliveryProductAddon> getByID(String id) async {
		var uri = Uri.http(Defines.RestBaseURL,  '/api/v1/SDeliveryProductsAddonsService/GetByID/${id}');
		final response = await http.get(uri,
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},);

		if (response.statusCode != 200) print('(DeliveryProductsAddonsService)GetByID error. Status code: ${response.statusCode}');
		return EDeliveryProductAddon.fromJson(json.decode(response.body));
	}

	static Future<bool> remove(String id) async {
		var uri = Uri.http(Defines.RestBaseURL,  '/api/v1/SDeliveryProductsAddonsService/Remove/${id}');
		final response = await http.delete(uri,
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},);

		if (response.statusCode != 200) print('(DeliveryProductsAddonsService)Remove error. Status code: ${response.statusCode}');
		return BoolHelper.convertStringToBool(response.body);
	}

	static Future<String> save(EDeliveryProductAddon eAddon) async {
		var uri = Uri.http(Defines.RestBaseURL,  '/api/v1/SDeliveryProductsAddonsService/Save');
		final response = await http.put(uri,
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},
				body: json.encode(eAddon.toJson()));

		if (response.statusCode != 200) print('(DeliveryProductsAddonsService)Save error. Status code: ${response.statusCode}');
		return json.decode(response.body);
	}

}
