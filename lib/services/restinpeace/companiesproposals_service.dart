//region imports
//author Bruno Tezine
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../codes/bool_helper.dart';
import 'package:saberlab_frontend_web/codes/defines.dart';
import 'package:saberlab_frontend_web/entities/restinpeace/ecompanyproposal.dart';
//endregion

class CompaniesProposalsService{

	static Future<List<ECompanyProposal>> getAll(String companyID, {int listCount=-1, int pageNumber=0, String orderBy='id desc'}) async {
		var queryParameters = {
		'listCount': (listCount).toString(),
		'pageNumber': (pageNumber).toString(),
		'orderBy': (orderBy).toString(),
		};

		var uri = Uri.http(Defines.RestBaseURL,  '/api/v1/SCompaniesProposalsService/GetAll/${companyID}', queryParameters);
		final response = await http.get(uri,
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},);

		if (response.statusCode != 200) print('(CompaniesProposalsService)GetAll error. Status code: ${response.statusCode}');
		return (json.decode(response.body) as List).map((e) => new ECompanyProposal.fromJson(e)).toList();
	}

	static Future<int> getCount(String companyID) async {
		var uri = Uri.http(Defines.RestBaseURL,  '/api/v1/SCompaniesProposalsService/GetCount/${companyID}');
		final response = await http.get(uri,
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},);

		if (response.statusCode != 200) print('(CompaniesProposalsService)GetCount error. Status code: ${response.statusCode}');
		return int.parse(response.body);
	}

	static Future<ECompanyProposal> getByID(String id) async {
		var uri = Uri.http(Defines.RestBaseURL,  '/api/v1/SCompaniesProposalsService/GetByID/${id}');
		final response = await http.get(uri,
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},);

		if (response.statusCode != 200) print('(CompaniesProposalsService)GetByID error. Status code: ${response.statusCode}');
		return ECompanyProposal.fromJson(json.decode(response.body));
	}

	static Future<String> save(ECompanyProposal eCompanyProposal) async {
		var uri = Uri.http(Defines.RestBaseURL,  '/api/v1/SCompaniesProposalsService/Save');
		final response = await http.put(uri,
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},
				body: json.encode(eCompanyProposal.toJson()));

		if (response.statusCode != 200) print('(CompaniesProposalsService)Save error. Status code: ${response.statusCode}');
		return json.decode(response.body);
	}

	static Future<bool> remove(String id) async {
		var uri = Uri.http(Defines.RestBaseURL,  '/api/v1/SCompaniesProposalsService/Remove/${id}');
		final response = await http.delete(uri,
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},);

		if (response.statusCode != 200) print('(CompaniesProposalsService)Remove error. Status code: ${response.statusCode}');
		return BoolHelper.convertStringToBool(response.body);
	}

}
