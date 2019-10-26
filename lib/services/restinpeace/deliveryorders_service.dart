//region imports
//author Bruno Tezine
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../codes/bool_helper.dart';
import 'package:saberlab_frontend_web/codes/defines.dart';
import 'package:saberlab_frontend_web/entities/restinpeace/edeliveryconfirmorder.dart';
import 'package:saberlab_frontend_web/entities/restinpeace/edeliveryorder.dart';
//endregion

class DeliveryOrdersService{

	static Future<List<EDeliveryOrder>> getAll(String companyID, {int listCount=-1, int pageNumber=0, String orderBy='id desc'}) async {
		var queryParameters = {
		'listCount': (listCount).toString(),
		'pageNumber': (pageNumber).toString(),
		'orderBy': (orderBy).toString(),
		};

		var uri = Uri.http(Defines.RestBaseURL,  '/api/v1/SDeliveryOrdersService/GetAll/${companyID}', queryParameters);
		final response = await http.get(uri,
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},);

		if (response.statusCode != 200) print('(DeliveryOrdersService)GetAll error. Status code: ${response.statusCode}');
		return (json.decode(response.body) as List).map((e) => new EDeliveryOrder.fromJson(e)).toList();
	}

	static Future<int> getTotal(EDeliveryConfirmOrder eDeliveryConfirmOrder) async {
		var uri = Uri.http(Defines.RestBaseURL,  '/api/v1/SDeliveryOrdersService/GetTotal');
		final response = await http.put(uri,
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},
				body: json.encode(eDeliveryConfirmOrder.toJson()));

		if (response.statusCode != 200) print('(DeliveryOrdersService)GetTotal error. Status code: ${response.statusCode}');
		return int.parse(response.body);
	}

	static Future<int> getCount(String companyID) async {
		var uri = Uri.http(Defines.RestBaseURL,  '/api/v1/SDeliveryOrdersService/GetCount/${companyID}');
		final response = await http.get(uri,
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},);

		if (response.statusCode != 200) print('(DeliveryOrdersService)GetCount error. Status code: ${response.statusCode}');
		return int.parse(response.body);
	}

	static Future<EDeliveryOrder> getByID(String id) async {
		var uri = Uri.http(Defines.RestBaseURL,  '/api/v1/SDeliveryOrdersService/GetByID/${id}');
		final response = await http.get(uri,
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},);

		if (response.statusCode != 200) print('(DeliveryOrdersService)GetByID error. Status code: ${response.statusCode}');
		return EDeliveryOrder.fromJson(json.decode(response.body));
	}

	static Future<String> save(EDeliveryOrder eOrder) async {
		var uri = Uri.http(Defines.RestBaseURL,  '/api/v1/SDeliveryOrdersService/Save');
		final response = await http.put(uri,
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},
				body: json.encode(eOrder.toJson()));

		if (response.statusCode != 200) print('(DeliveryOrdersService)Save error. Status code: ${response.statusCode}');
		return json.decode(response.body);
	}

	static Future<bool> remove(String id) async {
		var uri = Uri.http(Defines.RestBaseURL,  '/api/v1/SDeliveryOrdersService/Remove/${id}');
		final response = await http.delete(uri,
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},);

		if (response.statusCode != 200) print('(DeliveryOrdersService)Remove error. Status code: ${response.statusCode}');
		return BoolHelper.convertStringToBool(response.body);
	}

	static Future<String> confirmOrder(EDeliveryConfirmOrder eDeliveryConfirmOrder) async {
		var uri = Uri.http(Defines.RestBaseURL,  '/api/v1/SDeliveryOrdersService/ConfirmOrder');
		final response = await http.post(uri,
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},
				body: json.encode(eDeliveryConfirmOrder.toJson()));

		if (response.statusCode != 200) print('(DeliveryOrdersService)ConfirmOrder error. Status code: ${response.statusCode}');
		return json.decode(response.body);
	}

}
