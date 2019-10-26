//region imports
//author Bruno Tezine
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../codes/bool_helper.dart';
import 'package:saberlab_frontend_web/codes/defines.dart';
import 'package:saberlab_frontend_web/entities/restinpeace/ecompanybilltoreceive.dart';
//endregion

class CompaniesBillsToReceiveService{

	static Future<List<ECompanyBillToReceive>> getAll(String companyID, {int listCount=-1, int pageNumber=0, String orderBy='id desc'}) async {
		var queryParameters = {
		'listCount': (listCount).toString(),
		'pageNumber': (pageNumber).toString(),
		'orderBy': (orderBy).toString(),
		};

		var uri = Uri.http(Defines.RestBaseURL,  '/api/v1/SCompaniesBillsToReceiveService/GetAll/${companyID}', queryParameters);
		final response = await http.get(uri,
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},);

		if (response.statusCode != 200) print('(CompaniesBillsToReceiveService)GetAll error. Status code: ${response.statusCode}');
		return (json.decode(response.body) as List).map((e) => new ECompanyBillToReceive.fromJson(e)).toList();
	}

	static Future<int> getCount(String companyID) async {
		var uri = Uri.http(Defines.RestBaseURL,  '/api/v1/SCompaniesBillsToReceiveService/GetCount/${companyID}');
		final response = await http.get(uri,
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},);

		if (response.statusCode != 200) print('(CompaniesBillsToReceiveService)GetCount error. Status code: ${response.statusCode}');
		return int.parse(response.body);
	}

	static Future<ECompanyBillToReceive> getByID(String id) async {
		var uri = Uri.http(Defines.RestBaseURL,  '/api/v1/SCompaniesBillsToReceiveService/GetByID/${id}');
		final response = await http.get(uri,
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},);

		if (response.statusCode != 200) print('(CompaniesBillsToReceiveService)GetByID error. Status code: ${response.statusCode}');
		return ECompanyBillToReceive.fromJson(json.decode(response.body));
	}

	static Future<String> save(ECompanyBillToReceive eBillToReceive) async {
		var uri = Uri.http(Defines.RestBaseURL,  '/api/v1/SCompaniesBillsToReceiveService/Save');
		final response = await http.put(uri,
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},
				body: json.encode(eBillToReceive.toJson()));

		if (response.statusCode != 200) print('(CompaniesBillsToReceiveService)Save error. Status code: ${response.statusCode}');
		return json.decode(response.body);
	}

	static Future<bool> remove(String id) async {
		var uri = Uri.http(Defines.RestBaseURL,  '/api/v1/SCompaniesBillsToReceiveService/Remove/${id}');
		final response = await http.delete(uri,
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},);

		if (response.statusCode != 200) print('(CompaniesBillsToReceiveService)Remove error. Status code: ${response.statusCode}');
		return BoolHelper.convertStringToBool(response.body);
	}

}
