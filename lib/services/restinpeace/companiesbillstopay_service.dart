//region imports
//author Bruno Tezine
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../codes/bool_helper.dart';
import 'package:saberlab_frontend_web/codes/defines.dart';
import 'package:saberlab_frontend_web/entities/restinpeace/ecompanybilltopay.dart';
//endregion

class CompaniesBillsToPayService{

	static Future<List<ECompanyBillToPay>> getAll(String companyID, {int listCount=-1, int pageNumber=0, String orderBy='id desc'}) async {
		var queryParameters = {
		'listCount': (listCount).toString(),
		'pageNumber': (pageNumber).toString(),
		'orderBy': (orderBy).toString(),
		};

		var uri = Uri.http(Defines.RestBaseURL,  '/api/v1/SCompaniesBillsToPayService/GetAll/${companyID}', queryParameters);
		final response = await http.get(uri,
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},);

		if (response.statusCode != 200) print('(CompaniesBillsToPayService)GetAll error. Status code: ${response.statusCode}');
		return (json.decode(response.body) as List).map((e) => new ECompanyBillToPay.fromJson(e)).toList();
	}

	static Future<int> getCount(String companyID) async {
		var uri = Uri.http(Defines.RestBaseURL,  '/api/v1/SCompaniesBillsToPayService/GetCount/${companyID}');
		final response = await http.get(uri,
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},);

		if (response.statusCode != 200) print('(CompaniesBillsToPayService)GetCount error. Status code: ${response.statusCode}');
		return int.parse(response.body);
	}

	static Future<ECompanyBillToPay> getByID(String id) async {
		var uri = Uri.http(Defines.RestBaseURL,  '/api/v1/SCompaniesBillsToPayService/GetByID/${id}');
		final response = await http.get(uri,
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},);

		if (response.statusCode != 200) print('(CompaniesBillsToPayService)GetByID error. Status code: ${response.statusCode}');
		return ECompanyBillToPay.fromJson(json.decode(response.body));
	}

	static Future<String> save(ECompanyBillToPay eBillToPay) async {
		var uri = Uri.http(Defines.RestBaseURL,  '/api/v1/SCompaniesBillsToPayService/Save');
		final response = await http.put(uri,
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},
				body: json.encode(eBillToPay.toJson()));

		if (response.statusCode != 200) print('(CompaniesBillsToPayService)Save error. Status code: ${response.statusCode}');
		return json.decode(response.body);
	}

	static Future<bool> remove(String id) async {
		var uri = Uri.http(Defines.RestBaseURL,  '/api/v1/SCompaniesBillsToPayService/Remove/${id}');
		final response = await http.delete(uri,
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},);

		if (response.statusCode != 200) print('(CompaniesBillsToPayService)Remove error. Status code: ${response.statusCode}');
		return BoolHelper.convertStringToBool(response.body);
	}

}
