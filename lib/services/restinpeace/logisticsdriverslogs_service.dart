//region imports
//author Bruno Tezine
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../codes/bool_helper.dart';
import 'package:saberlab_frontend_web/codes/defines.dart';
import 'package:saberlab_frontend_web/entities/restinpeace/elogisticsdriverlog.dart';
import 'package:saberlab_frontend_web/entities/restinpeace/elist.dart';
//endregion

class LogisticsDriversLogsService{

	static Future<EList> getAll({int listCount=-1, int pageNumber=0, String orderBy='id desc'}) async {
		var queryParameters = {
		'listCount': (listCount).toString(),
		'pageNumber': (pageNumber).toString(),
		'orderBy': (orderBy).toString(),
		};

		var uri = Uri.http(Defines.RestBaseURL,  '/api/v1/SLogisticsDriversLogsService/GetAll', queryParameters);
		final response = await http.get(uri,
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},);

		if (response.statusCode != 200) print('(LogisticsDriversLogsService)GetAll error. Status code: ${response.statusCode}');
		return EList.fromJson(json.decode(response.body));
	}

	static Future<int> save(ELogisticsDriverLog eLogDriver) async {
		var uri = Uri.http(Defines.RestBaseURL,  '/api/v1/SLogisticsDriversLogsService/Save');
		final response = await http.put(uri,
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},
				body: json.encode(eLogDriver.toJson()));

		if (response.statusCode != 200) print('(LogisticsDriversLogsService)Save error. Status code: ${response.statusCode}');
		return int.parse(response.body);
	}

	static Future<bool> clear() async {
		var uri = Uri.http(Defines.RestBaseURL,  '/api/v1/SLogisticsDriversLogsService/Clear');
		final response = await http.get(uri,
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},);

		if (response.statusCode != 200) print('(LogisticsDriversLogsService)Clear error. Status code: ${response.statusCode}');
		return BoolHelper.convertStringToBool(response.body);
	}

}
