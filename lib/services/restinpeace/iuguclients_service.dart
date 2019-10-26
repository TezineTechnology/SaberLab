//region imports
//author Bruno Tezine
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../codes/bool_helper.dart';
import 'package:saberlab_frontend_web/codes/defines.dart';
import 'package:saberlab_frontend_web/entities/restinpeace/elist.dart';
//endregion

class IuguClientsService{

	static Future<EList> getSubClients(String clientID, {int listCount=-1, int pageNumber=0, String orderBy='driverid asc'}) async {
		var queryParameters = {
		'listCount': (listCount).toString(),
		'pageNumber': (pageNumber).toString(),
		'orderBy': (orderBy).toString(),
		};

		var uri = Uri.http(Defines.RestBaseURL,  '/api/v1/SIuguClientsService/GetSubClients/${clientID}', queryParameters);
		final response = await http.get(uri,
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},);

		if (response.statusCode != 200) print('(IuguClientsService)GetSubClients error. Status code: ${response.statusCode}');
		return EList.fromJson(json.decode(response.body));
	}

}
