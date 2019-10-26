//region imports
//author Bruno Tezine
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../codes/bool_helper.dart';
import 'package:saberlab_frontend_web/codes/defines.dart';
import 'package:saberlab_frontend_web/entities/restinpeace/ecompanyworktimes.dart';
//endregion

class CompaniesWorkTimeService{

	static Future<ECompanyWorkTimes> getByCompanyID(String id) async {
		var uri = Uri.http(Defines.RestBaseURL,  '/api/v1/SCompaniesWorkTimeService/GetByCompanyID/${id}');
		final response = await http.get(uri,
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},);

		if (response.statusCode != 200) print('(CompaniesWorkTimeService)GetByCompanyID error. Status code: ${response.statusCode}');
		return ECompanyWorkTimes.fromJson(json.decode(response.body));
	}

	static Future<String> save(ECompanyWorkTimes eWorkTimes) async {
		var uri = Uri.http(Defines.RestBaseURL,  '/api/v1/SCompaniesWorkTimeService/Save');
		final response = await http.put(uri,
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},
				body: json.encode(eWorkTimes.toJson()));

		if (response.statusCode != 200) print('(CompaniesWorkTimeService)Save error. Status code: ${response.statusCode}');
		return json.decode(response.body);
	}

}
