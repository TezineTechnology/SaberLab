//region imports
//author Bruno Tezine
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../codes/bool_helper.dart';
import 'package:saberlab_frontend_web/codes/defines.dart';
import 'package:saberlab_frontend_web/entities/restinpeace/ebraspagrequest.dart';
import 'package:saberlab_frontend_web/entities/restinpeace/elist.dart';
//endregion

class BraspagRequestsService{

	static Future<EBraspagRequest> getByID(int id) async {
		var uri = Uri.http(Defines.RestBaseURL,  '/api/v1/SBraspagRequestsService/GetByID/${id}');
		final response = await http.get(uri,
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},);

		if (response.statusCode != 200) print('(BraspagRequestsService)GetByID error. Status code: ${response.statusCode}');
		return EBraspagRequest.fromJson(json.decode(response.body));
	}

	static Future<EList> getAll(String braspagPaymentID, {int listCount=-1, int pageNumber=0, String orderBy='id desc'}) async {
		var queryParameters = {
		'braspagPaymentID': (braspagPaymentID).toString(),
		'listCount': (listCount).toString(),
		'pageNumber': (pageNumber).toString(),
		'orderBy': (orderBy).toString(),
		};

		var uri = Uri.http(Defines.RestBaseURL,  '/api/v1/SBraspagRequestsService/GetAll', queryParameters);
		final response = await http.get(uri,
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},);

		if (response.statusCode != 200) print('(BraspagRequestsService)GetAll error. Status code: ${response.statusCode}');
		return EList.fromJson(json.decode(response.body));
	}

}
