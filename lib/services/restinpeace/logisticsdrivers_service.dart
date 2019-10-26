//region imports
//author Bruno Tezine
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../codes/bool_helper.dart';
import 'package:saberlab_frontend_web/codes/defines.dart';
import 'package:saberlab_frontend_web/entities/restinpeace/ebaseentity.dart';
import 'package:saberlab_frontend_web/entities/restinpeace/elogisticsdriverauth.dart';
//endregion

class LogisticsDriversService{

	static Future<List<EBaseEntity>> getAll(String companyID, {int listCount=-1, int pageNumber=0, String orderBy='name asc'}) async {
		var queryParameters = {
		'listCount': (listCount).toString(),
		'pageNumber': (pageNumber).toString(),
		'orderBy': (orderBy).toString(),
		};

		var uri = Uri.http(Defines.RestBaseURL,  '/api/v1/SLogisticsDriversService/GetAll/${companyID}', queryParameters);
		final response = await http.get(uri,
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},);

		if (response.statusCode != 200) print('(LogisticsDriversService)GetAll error. Status code: ${response.statusCode}');
		return (json.decode(response.body) as List).map((e) => new EBaseEntity.fromJson(e)).toList();
	}

	static Future<EBaseEntity> getByID(String id) async {
		var uri = Uri.http(Defines.RestBaseURL,  '/api/v1/SLogisticsDriversService/GetByID/${id}');
		final response = await http.get(uri,
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},);

		if (response.statusCode != 200) print('(LogisticsDriversService)GetByID error. Status code: ${response.statusCode}');
		return EBaseEntity.fromJson(json.decode(response.body));
	}

	static Future<int> getCount(String companyID) async {
		var uri = Uri.http(Defines.RestBaseURL,  '/api/v1/SLogisticsDriversService/GetCount/${companyID}');
		final response = await http.get(uri,
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},);

		if (response.statusCode != 200) print('(LogisticsDriversService)GetCount error. Status code: ${response.statusCode}');
		return int.parse(response.body);
	}

	static Future<EBaseEntity> getByEmail(String email) async {
		var uri = Uri.http(Defines.RestBaseURL,  '/api/v1/SLogisticsDriversService/GetByEmail/${email}');
		final response = await http.get(uri,
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},);

		if (response.statusCode != 200) print('(LogisticsDriversService)GetByEmail error. Status code: ${response.statusCode}');
		return EBaseEntity.fromJson(json.decode(response.body));
	}

	static Future<EBaseEntity> getByMobile(String email) async {
		var uri = Uri.http(Defines.RestBaseURL,  '/api/v1/SLogisticsDriversService/GetByMobile/${email}');
		final response = await http.get(uri,
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},);

		if (response.statusCode != 200) print('(LogisticsDriversService)GetByMobile error. Status code: ${response.statusCode}');
		return EBaseEntity.fromJson(json.decode(response.body));
	}

	static Future<String> save(EBaseEntity eDriver) async {
		var uri = Uri.http(Defines.RestBaseURL,  '/api/v1/SLogisticsDriversService/Save');
		final response = await http.put(uri,
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},
				body: json.encode(eDriver.toJson()));

		if (response.statusCode != 200) print('(LogisticsDriversService)Save error. Status code: ${response.statusCode}');
		return json.decode(response.body);
	}

	static Future<int> saveDriverStatus(EBaseEntity eDriver) async {
		var uri = Uri.http(Defines.RestBaseURL,  '/api/v1/SLogisticsDriversService/SaveDriverStatus');
		final response = await http.put(uri,
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},
				body: json.encode(eDriver.toJson()));

		if (response.statusCode != 200) print('(LogisticsDriversService)SaveDriverStatus error. Status code: ${response.statusCode}');
		return int.parse(response.body);
	}

	static Future<int> saveLogMode(EBaseEntity eDriver) async {
		var uri = Uri.http(Defines.RestBaseURL,  '/api/v1/SLogisticsDriversService/SaveLogMode');
		final response = await http.put(uri,
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},
				body: json.encode(eDriver.toJson()));

		if (response.statusCode != 200) print('(LogisticsDriversService)SaveLogMode error. Status code: ${response.statusCode}');
		return int.parse(response.body);
	}

	static Future<bool> saveDriverStatusFromDriverMobile(int driverID, int statusID) async {
		var uri = Uri.http(Defines.RestBaseURL,  '/api/v1/SLogisticsDriversService/SaveDriverStatusFromDriverMobile/${driverID}/${statusID}');
		final response = await http.put(uri,
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},);

		if (response.statusCode != 200) print('(LogisticsDriversService)SaveDriverStatusFromDriverMobile error. Status code: ${response.statusCode}');
		return BoolHelper.convertStringToBool(response.body);
	}

	static Future<int> createDriver(EBaseEntity eDriver) async {
		var uri = Uri.http(Defines.RestBaseURL,  '/api/v1/SLogisticsDriversService/CreateDriver');
		final response = await http.put(uri,
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},
				body: json.encode(eDriver.toJson()));

		if (response.statusCode != 200) print('(LogisticsDriversService)CreateDriver error. Status code: ${response.statusCode}');
		return int.parse(response.body);
	}

	static Future<int> saveVehicleInfo(EBaseEntity eDriver) async {
		var uri = Uri.http(Defines.RestBaseURL,  '/api/v1/SLogisticsDriversService/SaveVehicleInfo');
		final response = await http.put(uri,
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},
				body: json.encode(eDriver.toJson()));

		if (response.statusCode != 200) print('(LogisticsDriversService)SaveVehicleInfo error. Status code: ${response.statusCode}');
		return int.parse(response.body);
	}

	static Future<int> savePaymentConfig(EBaseEntity eDriver) async {
		var uri = Uri.http(Defines.RestBaseURL,  '/api/v1/SLogisticsDriversService/SavePaymentConfig');
		final response = await http.put(uri,
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},
				body: json.encode(eDriver.toJson()));

		if (response.statusCode != 200) print('(LogisticsDriversService)SavePaymentConfig error. Status code: ${response.statusCode}');
		return int.parse(response.body);
	}

	static Future<int> saveNotifications(EBaseEntity eDriver) async {
		var uri = Uri.http(Defines.RestBaseURL,  '/api/v1/SLogisticsDriversService/SaveNotifications');
		final response = await http.put(uri,
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},
				body: json.encode(eDriver.toJson()));

		if (response.statusCode != 200) print('(LogisticsDriversService)SaveNotifications error. Status code: ${response.statusCode}');
		return int.parse(response.body);
	}

	static Future<bool> remove(String id) async {
		var uri = Uri.http(Defines.RestBaseURL,  '/api/v1/SLogisticsDriversService/Remove/${id}');
		final response = await http.delete(uri,
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},);

		if (response.statusCode != 200) print('(LogisticsDriversService)Remove error. Status code: ${response.statusCode}');
		return BoolHelper.convertStringToBool(response.body);
	}

	static Future<ELogisticsDriverAuth> authenticate(String txt, String password, String appVersion, String firebaseToken) async {
		var queryParameters = {
		'firebaseToken': (firebaseToken).toString(),
		};

		var uri = Uri.http(Defines.RestBaseURL,  '/api/v1/SLogisticsDriversService/Authenticate/${txt}/${password}/${appVersion}', queryParameters);
		final response = await http.get(uri,
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},);

		if (response.statusCode != 200) print('(LogisticsDriversService)Authenticate error. Status code: ${response.statusCode}');
		return ELogisticsDriverAuth.fromJson(json.decode(response.body));
	}

	static Future<bool> recoverPassword(String txt) async {
		var uri = Uri.http(Defines.RestBaseURL,  '/api/v1/SLogisticsDriversService/RecoverPassword/${txt}');
		final response = await http.get(uri,
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},);

		if (response.statusCode != 200) print('(LogisticsDriversService)RecoverPassword error. Status code: ${response.statusCode}');
		return BoolHelper.convertStringToBool(response.body);
	}

	static Future<List<EBaseEntity>> search(String txt, {int listCount=-1, int pageNumber=0, String orderBy='name asc'}) async {
		var queryParameters = {
		'txt': (txt).toString(),
		'listCount': (listCount).toString(),
		'pageNumber': (pageNumber).toString(),
		'orderBy': (orderBy).toString(),
		};

		var uri = Uri.http(Defines.RestBaseURL,  '/api/v1/SLogisticsDriversService/Search', queryParameters);
		final response = await http.get(uri,
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},);

		if (response.statusCode != 200) print('(LogisticsDriversService)Search error. Status code: ${response.statusCode}');
		return (json.decode(response.body) as List).map((e) => new EBaseEntity.fromJson(e)).toList();
	}

}
