//region imports
//author Bruno Tezine
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../codes/bool_helper.dart';
import 'package:saberlab_frontend_web/codes/defines.dart';
import 'package:saberlab_frontend_web/entities/restinpeace/epush.dart';
import 'package:saberlab_frontend_web/entities/restinpeace/elist.dart';
//endregion

class PushService{

	static Future<EList> getAll({int listCount=-1, int pageNumber=0, String orderBy='id desc'}) async {
		var queryParameters = {
		'listCount': (listCount).toString(),
		'pageNumber': (pageNumber).toString(),
		'orderBy': (orderBy).toString(),
		};

		var uri = Uri.http(Defines.RestBaseURL,  '/api/v1/SPushService/GetAll', queryParameters);
		final response = await http.get(uri,
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},);

		if (response.statusCode != 200) print('(PushService)GetAll error. Status code: ${response.statusCode}');
		return EList.fromJson(json.decode(response.body));
	}

	static Future<bool> sendPush(EPush ePush) async {
		var uri = Uri.http(Defines.RestBaseURL,  '/api/v1/SPushService/SendPush');
		final response = await http.post(uri,
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},
				body: json.encode(ePush.toJson()));

		if (response.statusCode != 200) print('(PushService)SendPush error. Status code: ${response.statusCode}');
		return BoolHelper.convertStringToBool(response.body);
	}

}
