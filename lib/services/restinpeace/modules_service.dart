//region imports
//author Bruno Tezine
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../codes/bool_helper.dart';
import 'package:saberlab_frontend_web/codes/defines.dart';
import 'package:saberlab_frontend_web/entities/restinpeace/emodule.dart';
//endregion

class ModulesService{

	static Future<List<EModule>> getAllByCompany(String companyID) async {
		var uri = Uri.http(Defines.RestBaseURL,  '/api/v1/SModulesService/GetAllByCompany/${companyID}');
		final response = await http.get(uri,
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},);

		if (response.statusCode != 200) print('(ModulesService)GetAllByCompany error. Status code: ${response.statusCode}');
		return (json.decode(response.body) as List).map((e) => new EModule.fromJson(e)).toList();
	}

}
