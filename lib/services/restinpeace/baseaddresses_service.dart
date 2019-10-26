//region imports
//author Bruno Tezine
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../codes/bool_helper.dart';
import 'package:saberlab_frontend_web/codes/defines.dart';
import 'package:saberlab_frontend_web/entities/restinpeace/ebaseaddress.dart';
//endregion

class BaseAddressesService{

	static Future<EBaseAddress> getByID(String id) async {
		var uri = Uri.http(Defines.RestBaseURL,  '/api/v1/SBaseAddressesService/GetByID/${id}');
		final response = await http.get(uri,
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},);

		if (response.statusCode != 200) print('(BaseAddressesService)GetByID error. Status code: ${response.statusCode}');
		return EBaseAddress.fromJson(json.decode(response.body));
	}

	static Future<List<EBaseAddress>> getEntityAddresses(String entityID) async {
		var uri = Uri.http(Defines.RestBaseURL,  '/api/v1/SBaseAddressesService/GetEntityAddresses/${entityID}');
		final response = await http.get(uri,
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},);

		if (response.statusCode != 200) print('(BaseAddressesService)GetEntityAddresses error. Status code: ${response.statusCode}');
		return (json.decode(response.body) as List).map((e) => new EBaseAddress.fromJson(e)).toList();
	}

}
