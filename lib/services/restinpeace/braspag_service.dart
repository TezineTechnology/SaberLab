//region imports
//author Bruno Tezine
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../codes/bool_helper.dart';
import 'package:saberlab_frontend_web/codes/defines.dart';
import 'package:saberlab_frontend_web/entities/restinpeace/ebraspagtoken.dart';
//endregion

class BraspagService{

	static Future<EBraspagToken> createToken() async {
		var uri = Uri.http(Defines.RestBaseURL,  '/api/v1/SBraspagService/CreateToken');
		final response = await http.get(uri,
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},);

		if (response.statusCode != 200) print('(BraspagService)CreateToken error. Status code: ${response.statusCode}');
		return EBraspagToken.fromJson(json.decode(response.body));
	}

}
