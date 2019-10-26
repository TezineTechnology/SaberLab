//region imports
//author Bruno Tezine
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../codes/bool_helper.dart';
import 'package:saberlab_frontend_web/codes/defines.dart';
import 'package:saberlab_frontend_web/entities/restinpeace/epayment.dart';
import 'package:saberlab_frontend_web/entities/restinpeace/elist.dart';
//endregion

class PaymentsService{

	static Future<EPayment> getByID(int id) async {
		var uri = Uri.http(Defines.RestBaseURL,  '/api/v1/SPaymentsService/GetByID/${id}');
		final response = await http.get(uri,
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},);

		if (response.statusCode != 200) print('(PaymentsService)GetByID error. Status code: ${response.statusCode}');
		return EPayment.fromJson(json.decode(response.body));
	}

	static Future<EList> getAll({int listCount=-1, int pageNumber=0, String orderBy='id desc'}) async {
		var queryParameters = {
		'listCount': (listCount).toString(),
		'pageNumber': (pageNumber).toString(),
		'orderBy': (orderBy).toString(),
		};

		var uri = Uri.http(Defines.RestBaseURL,  '/api/v1/SPaymentsService/GetAll', queryParameters);
		final response = await http.get(uri,
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},);

		if (response.statusCode != 200) print('(PaymentsService)GetAll error. Status code: ${response.statusCode}');
		return EList.fromJson(json.decode(response.body));
	}

	static Future<EList> getAllByDriver(int driverID, {int listCount=-1, int pageNumber=0, String orderBy='name asc'}) async {
		var queryParameters = {
		'listCount': (listCount).toString(),
		'pageNumber': (pageNumber).toString(),
		'orderBy': (orderBy).toString(),
		};

		var uri = Uri.http(Defines.RestBaseURL,  '/api/v1/SPaymentsService/GetAllByDriver/${driverID}', queryParameters);
		final response = await http.get(uri,
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},);

		if (response.statusCode != 200) print('(PaymentsService)GetAllByDriver error. Status code: ${response.statusCode}');
		return EList.fromJson(json.decode(response.body));
	}

	static Future<EList> getAllByDriverThisMonth(int driverID) async {
		var uri = Uri.http(Defines.RestBaseURL,  '/api/v1/SPaymentsService/GetAllByDriverThisMonth/${driverID}');
		final response = await http.get(uri,
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},);

		if (response.statusCode != 200) print('(PaymentsService)GetAllByDriverThisMonth error. Status code: ${response.statusCode}');
		return EList.fromJson(json.decode(response.body));
	}

}
