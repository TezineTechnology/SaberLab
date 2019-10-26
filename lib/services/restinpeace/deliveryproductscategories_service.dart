//region imports
//author Bruno Tezine
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../codes/bool_helper.dart';
import 'package:saberlab_frontend_web/codes/defines.dart';
import 'package:saberlab_frontend_web/entities/restinpeace/edeliveryproductcategory.dart';
//endregion

class DeliveryProductsCategoriesService{

	static Future<List<EDeliveryProductCategory>> getAll(String companyID, {int listCount=-1, int pageNumber=0, String orderBy='position asc'}) async {
		var queryParameters = {
		'listCount': (listCount).toString(),
		'pageNumber': (pageNumber).toString(),
		'orderBy': (orderBy).toString(),
		};

		var uri = Uri.http(Defines.RestBaseURL,  '/api/v1/SDeliveryProductsCategoriesService/GetAll/${companyID}', queryParameters);
		final response = await http.get(uri,
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},);

		if (response.statusCode != 200) print('(DeliveryProductsCategoriesService)GetAll error. Status code: ${response.statusCode}');
		return (json.decode(response.body) as List).map((e) => new EDeliveryProductCategory.fromJson(e)).toList();
	}

	static Future<int> getCount(String companyID) async {
		var uri = Uri.http(Defines.RestBaseURL,  '/api/v1/SDeliveryProductsCategoriesService/GetCount/${companyID}');
		final response = await http.get(uri,
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},);

		if (response.statusCode != 200) print('(DeliveryProductsCategoriesService)GetCount error. Status code: ${response.statusCode}');
		return int.parse(response.body);
	}

	static Future<EDeliveryProductCategory> getByID(String id) async {
		var uri = Uri.http(Defines.RestBaseURL,  '/api/v1/SDeliveryProductsCategoriesService/GetByID/${id}');
		final response = await http.get(uri,
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},);

		if (response.statusCode != 200) print('(DeliveryProductsCategoriesService)GetByID error. Status code: ${response.statusCode}');
		return EDeliveryProductCategory.fromJson(json.decode(response.body));
	}

	static Future<bool> remove(String id) async {
		var uri = Uri.http(Defines.RestBaseURL,  '/api/v1/SDeliveryProductsCategoriesService/Remove/${id}');
		final response = await http.delete(uri,
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},);

		if (response.statusCode != 200) print('(DeliveryProductsCategoriesService)Remove error. Status code: ${response.statusCode}');
		return BoolHelper.convertStringToBool(response.body);
	}

	static Future<String> save(EDeliveryProductCategory eCategory) async {
		var uri = Uri.http(Defines.RestBaseURL,  '/api/v1/SDeliveryProductsCategoriesService/Save');
		final response = await http.put(uri,
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},
				body: json.encode(eCategory.toJson()));

		if (response.statusCode != 200) print('(DeliveryProductsCategoriesService)Save error. Status code: ${response.statusCode}');
		return json.decode(response.body);
	}

}
