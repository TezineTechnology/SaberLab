//region imports
//author Bruno Tezine
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../codes/bool_helper.dart';
import 'package:saberlab_frontend_web/codes/defines.dart';
import 'package:saberlab_frontend_web/entities/restinpeace/edeliveryproductoption.dart';
//endregion

class DeliveryProductsOptionsService{

	static Future<List<EDeliveryProductOption>> getAll(String companyID, {int listCount=-1, int pageNumber=0, String orderBy='name asc'}) async {
		var queryParameters = {
		'listCount': (listCount).toString(),
		'pageNumber': (pageNumber).toString(),
		'orderBy': (orderBy).toString(),
		};

		var uri = Uri.http(Defines.RestBaseURL,  '/api/v1/SDeliveryProductsOptionsService/GetAll/${companyID}', queryParameters);
		final response = await http.get(uri,
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},);

		if (response.statusCode != 200) print('(DeliveryProductsOptionsService)GetAll error. Status code: ${response.statusCode}');
		return (json.decode(response.body) as List).map((e) => new EDeliveryProductOption.fromJson(e)).toList();
	}

	static Future<List<EDeliveryProductOption>> getAllGroupNames(String companyID) async {
		var uri = Uri.http(Defines.RestBaseURL,  '/api/v1/SDeliveryProductsOptionsService/GetAllGroupNames/${companyID}');
		final response = await http.get(uri,
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},);

		if (response.statusCode != 200) print('(DeliveryProductsOptionsService)GetAllGroupNames error. Status code: ${response.statusCode}');
		return (json.decode(response.body) as List).map((e) => new EDeliveryProductOption.fromJson(e)).toList();
	}

	static Future<List<EDeliveryProductOption>> getChildOptions(String parentGroupID) async {
		var uri = Uri.http(Defines.RestBaseURL,  '/api/v1/SDeliveryProductsOptionsService/GetChildOptions/${parentGroupID}');
		final response = await http.get(uri,
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},);

		if (response.statusCode != 200) print('(DeliveryProductsOptionsService)GetChildOptions error. Status code: ${response.statusCode}');
		return (json.decode(response.body) as List).map((e) => new EDeliveryProductOption.fromJson(e)).toList();
	}

	static Future<bool> groupContainsPrice(String parentGroupID) async {
		var uri = Uri.http(Defines.RestBaseURL,  '/api/v1/SDeliveryProductsOptionsService/GroupContainsPrice/${parentGroupID}');
		final response = await http.get(uri,
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},);

		if (response.statusCode != 200) print('(DeliveryProductsOptionsService)GroupContainsPrice error. Status code: ${response.statusCode}');
		return BoolHelper.convertStringToBool(response.body);
	}

	static Future<int> getCount(String companyID) async {
		var uri = Uri.http(Defines.RestBaseURL,  '/api/v1/SDeliveryProductsOptionsService/GetCount/${companyID}');
		final response = await http.get(uri,
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},);

		if (response.statusCode != 200) print('(DeliveryProductsOptionsService)GetCount error. Status code: ${response.statusCode}');
		return int.parse(response.body);
	}

	static Future<EDeliveryProductOption> getByID(String id) async {
		var uri = Uri.http(Defines.RestBaseURL,  '/api/v1/SDeliveryProductsOptionsService/GetByID/${id}');
		final response = await http.get(uri,
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},);

		if (response.statusCode != 200) print('(DeliveryProductsOptionsService)GetByID error. Status code: ${response.statusCode}');
		return EDeliveryProductOption.fromJson(json.decode(response.body));
	}

	static Future<bool> remove(String id) async {
		var uri = Uri.http(Defines.RestBaseURL,  '/api/v1/SDeliveryProductsOptionsService/Remove/${id}');
		final response = await http.delete(uri,
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},);

		if (response.statusCode != 200) print('(DeliveryProductsOptionsService)Remove error. Status code: ${response.statusCode}');
		return BoolHelper.convertStringToBool(response.body);
	}

	static Future<String> save(EDeliveryProductOption eDeliveryProductOption) async {
		var uri = Uri.http(Defines.RestBaseURL,  '/api/v1/SDeliveryProductsOptionsService/Save');
		final response = await http.put(uri,
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},
				body: json.encode(eDeliveryProductOption.toJson()));

		if (response.statusCode != 200) print('(DeliveryProductsOptionsService)Save error. Status code: ${response.statusCode}');
		return json.decode(response.body);
	}

}
