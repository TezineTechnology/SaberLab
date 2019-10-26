//region imports
//author Bruno Tezine
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../codes/bool_helper.dart';
import 'package:saberlab_frontend_web/codes/defines.dart';
import 'package:saberlab_frontend_web/entities/restinpeace/eserverconfig.dart';
//endregion

class ServerConfigService{

	static Future<EServerConfig> getByID(int id) async {
		var uri = Uri.http(Defines.RestBaseURL,  '/api/v1/SServerConfigService/GetByID/${id}');
		final response = await http.get(uri,
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},);

		if (response.statusCode != 200) print('(ServerConfigService)GetByID error. Status code: ${response.statusCode}');
		return EServerConfig.fromJson(json.decode(response.body));
	}

	static Future<int> save(EServerConfig eServerConfig) async {
		var uri = Uri.http(Defines.RestBaseURL,  '/api/v1/SServerConfigService/Save');
		final response = await http.put(uri,
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},
				body: json.encode(eServerConfig.toJson()));

		if (response.statusCode != 200) print('(ServerConfigService)Save error. Status code: ${response.statusCode}');
		return int.parse(response.body);
	}

}
