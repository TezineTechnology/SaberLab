//region imports
//author Bruno Tezine
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../codes/bool_helper.dart';
import 'package:saberlab_frontend_web/codes/defines.dart';
import 'package:saberlab_frontend_web/entities/restinpeace/efile.dart';
//endregion

class FilesService{

	static Future<EFile> getCompanyLogoByURL(String url) async {
		var uri = Uri.http(Defines.RestBaseURL,  '/api/v1/SFilesService/GetCompanyLogoByURL');
		final response = await http.put(uri,
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},
				body: json.encode(url));

		if (response.statusCode != 200) print('(FilesService)GetCompanyLogoByURL error. Status code: ${response.statusCode}');
		return EFile.fromJson(json.decode(response.body));
	}

}
