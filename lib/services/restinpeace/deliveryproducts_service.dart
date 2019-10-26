//region imports
//author Bruno Tezine
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../codes/bool_helper.dart';
import 'package:saberlab_frontend_web/codes/defines.dart';
import 'package:saberlab_frontend_web/entities/restinpeace/edeliveryproduct.dart';
//endregion

class DeliveryProductsService{

	static Future<List<EDeliveryProduct>> getAll(String companyID, {int listCount=-1, int pageNumber=0, String orderBy='name asc'}) async {
		var queryParameters = {
		'listCount': (listCount).toString(),
		'pageNumber': (pageNumber).toString(),
		'orderBy': (orderBy).toString(),
		};

		var uri = Uri.http(Defines.RestBaseURL,  '/api/v1/SDeliveryProductsService/GetAll/${companyID}', queryParameters);
		final response = await http.get(uri,
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},);

		if (response.statusCode != 200) print('(DeliveryProductsService)GetAll error. Status code: ${response.statusCode}');
		return (json.decode(response.body) as List).map((e) => new EDeliveryProduct.fromJson(e)).toList();
	}

	static Future<int> getCount(String companyID) async {
		var uri = Uri.http(Defines.RestBaseURL,  '/api/v1/SDeliveryProductsService/GetCount/${companyID}');
		final response = await http.get(uri,
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},);

		if (response.statusCode != 200) print('(DeliveryProductsService)GetCount error. Status code: ${response.statusCode}');
		return int.parse(response.body);
	}

	static Future<List<EDeliveryProduct>> getAllWithDividers(String companyID, {int listCount=-1, int pageNumber=0, String orderBy='name asc'}) async {
		var queryParameters = {
		'listCount': (listCount).toString(),
		'pageNumber': (pageNumber).toString(),
		'orderBy': (orderBy).toString(),
		};

		var uri = Uri.http(Defines.RestBaseURL,  '/api/v1/SDeliveryProductsService/GetAllWithDividers/${companyID}', queryParameters);
		final response = await http.get(uri,
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},);

		if (response.statusCode != 200) print('(DeliveryProductsService)GetAllWithDividers error. Status code: ${response.statusCode}');
		return (json.decode(response.body) as List).map((e) => new EDeliveryProduct.fromJson(e)).toList();
	}

	static Future<EDeliveryProduct> getByID(String id) async {
		var uri = Uri.http(Defines.RestBaseURL,  '/api/v1/SDeliveryProductsService/GetByID/${id}');
		final response = await http.get(uri,
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},);

		if (response.statusCode != 200) print('(DeliveryProductsService)GetByID error. Status code: ${response.statusCode}');
		return EDeliveryProduct.fromJson(json.decode(response.body));
	}

	static Future<bool> remove(String id) async {
		var uri = Uri.http(Defines.RestBaseURL,  '/api/v1/SDeliveryProductsService/Remove/${id}');
		final response = await http.delete(uri,
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},);

		if (response.statusCode != 200) print('(DeliveryProductsService)Remove error. Status code: ${response.statusCode}');
		return BoolHelper.convertStringToBool(response.body);
	}

	static Future<String> save(EDeliveryProduct eDeliveryProduct) async {
		var uri = Uri.http(Defines.RestBaseURL,  '/api/v1/SDeliveryProductsService/Save');
		final response = await http.put(uri,
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},
				body: json.encode(eDeliveryProduct.toJson()));

		if (response.statusCode != 200) print('(DeliveryProductsService)Save error. Status code: ${response.statusCode}');
		return json.decode(response.body);
	}

}
