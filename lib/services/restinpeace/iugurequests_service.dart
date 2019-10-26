//region imports
//author Bruno Tezine
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../codes/bool_helper.dart';
import 'package:saberlab_frontend_web/codes/defines.dart';
import 'package:saberlab_frontend_web/entities/restinpeace/eiugurequest.dart';
import 'package:saberlab_frontend_web/entities/restinpeace/elist.dart';
//endregion

class IuguRequestsService{

	static Future<EIuguRequest> getByID(int id) async {
		var uri = Uri.http(Defines.RestBaseURL,  '/api/v1/SIuguRequestsService/GetByID/${id}');
		final response = await http.get(uri,
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},);

		if (response.statusCode != 200) print('(IuguRequestsService)GetByID error. Status code: ${response.statusCode}');
		return EIuguRequest.fromJson(json.decode(response.body));
	}

	static Future<EList> getAll(String iuguPaymentID, {int listCount=-1, int pageNumber=0, String orderBy='id desc'}) async {
		var queryParameters = {
		'iuguPaymentID': (iuguPaymentID).toString(),
		'listCount': (listCount).toString(),
		'pageNumber': (pageNumber).toString(),
		'orderBy': (orderBy).toString(),
		};

		var uri = Uri.http(Defines.RestBaseURL,  '/api/v1/SIuguRequestsService/GetAll', queryParameters);
		final response = await http.get(uri,
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},);

		if (response.statusCode != 200) print('(IuguRequestsService)GetAll error. Status code: ${response.statusCode}');
		return EList.fromJson(json.decode(response.body));
	}

}
