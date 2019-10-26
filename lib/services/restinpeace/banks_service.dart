//region imports
//author Bruno Tezine
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../codes/bool_helper.dart';
import 'package:saberlab_frontend_web/codes/defines.dart';
import 'package:saberlab_frontend_web/entities/restinpeace/ebank.dart';
//endregion

class BanksService{

	static Future<List<EBank>> getBanks() async {
		var uri = Uri.http(Defines.RestBaseURL,  '/api/v1/SBanksService/GetBanks');
		final response = await http.get(uri,
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},);

		if (response.statusCode != 200) print('(BanksService)GetBanks error. Status code: ${response.statusCode}');
		return (json.decode(response.body) as List).map((e) => new EBank.fromJson(e)).toList();
	}

	static Future<EBank> getByID(int id) async {
		var uri = Uri.http(Defines.RestBaseURL,  '/api/v1/SBanksService/GetByID/${id}');
		final response = await http.get(uri,
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},);

		if (response.statusCode != 200) print('(BanksService)GetByID error. Status code: ${response.statusCode}');
		return EBank.fromJson(json.decode(response.body));
	}

}
