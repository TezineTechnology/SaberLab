//region imports
//author Bruno Tezine
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../codes/bool_helper.dart';
import 'package:saberlab_frontend_web/codes/defines.dart';
import 'package:saberlab_frontend_web/entities/restinpeace/eiugucreatedomiciliobancariorequest.dart';
import 'package:saberlab_frontend_web/entities/restinpeace/eiugupaymentmethod.dart';
import 'package:saberlab_frontend_web/entities/restinpeace/elist.dart';
import 'package:saberlab_frontend_web/entities/restinpeace/eiuguclientinfo.dart';
import 'package:saberlab_frontend_web/entities/restinpeace/eresponse.dart';
import 'package:saberlab_frontend_web/entities/restinpeace/eiuguverificardomicilioitem.dart';
import 'package:saberlab_frontend_web/entities/restinpeace/eiugugetaccountinforesponse.dart';
import 'package:saberlab_frontend_web/entities/restinpeace/eiugubuscarfaturaresponse.dart';
import 'package:saberlab_frontend_web/entities/restinpeace/eiugucancelinvoiceresponse.dart';
//endregion

class IuguService{

	static Future<List<EIuguPaymentMethod>> getPaymentMethods(String clientID, {String accountApiToken=''}) async {
		var queryParameters = {
		'accountApiToken': (accountApiToken).toString(),
		};

		var uri = Uri.http(Defines.RestBaseURL,  '/api/v1/SIuguService/GetPaymentMethods/${clientID}', queryParameters);
		final response = await http.get(uri,
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},);

		if (response.statusCode != 200) print('(IuguService)GetPaymentMethods error. Status code: ${response.statusCode}');
		return (json.decode(response.body) as List).map((e) => new EIuguPaymentMethod.fromJson(e)).toList();
	}

	static Future<EIuguPaymentMethod> getPaymentMethod(String clientID, String paymentMethodID, {String accountApiToken=''}) async {
		var queryParameters = {
		'accountApiToken': (accountApiToken).toString(),
		};

		var uri = Uri.http(Defines.RestBaseURL,  '/api/v1/SIuguService/GetPaymentMethod/${clientID}/${paymentMethodID}', queryParameters);
		final response = await http.get(uri,
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},);

		if (response.statusCode != 200) print('(IuguService)GetPaymentMethod error. Status code: ${response.statusCode}');
		return EIuguPaymentMethod.fromJson(json.decode(response.body));
	}

	static Future<EList> getTransfersReceived({int listCount=-1, int pageNumber=0}) async {
		var queryParameters = {
		'listCount': (listCount).toString(),
		'pageNumber': (pageNumber).toString(),
		};

		var uri = Uri.http(Defines.RestBaseURL,  '/api/v1/SIuguService/GetTransfersReceived', queryParameters);
		final response = await http.get(uri,
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},);

		if (response.statusCode != 200) print('(IuguService)GetTransfersReceived error. Status code: ${response.statusCode}');
		return EList.fromJson(json.decode(response.body));
	}

	static Future<EList> getTransfersSent({int listCount=-1, int pageNumber=0}) async {
		var queryParameters = {
		'listCount': (listCount).toString(),
		'pageNumber': (pageNumber).toString(),
		};

		var uri = Uri.http(Defines.RestBaseURL,  '/api/v1/SIuguService/GetTransfersSent', queryParameters);
		final response = await http.get(uri,
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},);

		if (response.statusCode != 200) print('(IuguService)GetTransfersSent error. Status code: ${response.statusCode}');
		return EList.fromJson(json.decode(response.body));
	}

	static Future<EList> getBankTransfers({int listCount=-1, int pageNumber=0}) async {
		var queryParameters = {
		'listCount': (listCount).toString(),
		'pageNumber': (pageNumber).toString(),
		};

		var uri = Uri.http(Defines.RestBaseURL,  '/api/v1/SIuguService/GetBankTransfers', queryParameters);
		final response = await http.get(uri,
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},);

		if (response.statusCode != 200) print('(IuguService)GetBankTransfers error. Status code: ${response.statusCode}');
		return EList.fromJson(json.decode(response.body));
	}

	static Future<EIuguClientInfo> getClient(String clientID, {String accountApiToken=''}) async {
		var queryParameters = {
		'accountApiToken': (accountApiToken).toString(),
		};

		var uri = Uri.http(Defines.RestBaseURL,  '/api/v1/SIuguService/GetClient/${clientID}', queryParameters);
		final response = await http.get(uri,
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},);

		if (response.statusCode != 200) print('(IuguService)GetClient error. Status code: ${response.statusCode}');
		return EIuguClientInfo.fromJson(json.decode(response.body));
	}

	static Future<EList> getClients({int listCount=-1, int pageNumber=0}) async {
		var queryParameters = {
		'listCount': (listCount).toString(),
		'pageNumber': (pageNumber).toString(),
		};

		var uri = Uri.http(Defines.RestBaseURL,  '/api/v1/SIuguService/GetClients', queryParameters);
		final response = await http.get(uri,
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},);

		if (response.statusCode != 200) print('(IuguService)GetClients error. Status code: ${response.statusCode}');
		return EList.fromJson(json.decode(response.body));
	}

	static Future<bool> removeClient(String clientID) async {
		var uri = Uri.http(Defines.RestBaseURL,  '/api/v1/SIuguService/RemoveClient/${clientID}');
		final response = await http.get(uri,
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},);

		if (response.statusCode != 200) print('(IuguService)RemoveClient error. Status code: ${response.statusCode}');
		return BoolHelper.convertStringToBool(response.body);
	}

	static Future<EList> getAccounts({int listCount=-1, int pageNumber=0}) async {
		var queryParameters = {
		'listCount': (listCount).toString(),
		'pageNumber': (pageNumber).toString(),
		};

		var uri = Uri.http(Defines.RestBaseURL,  '/api/v1/SIuguService/GetAccounts', queryParameters);
		final response = await http.get(uri,
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},);

		if (response.statusCode != 200) print('(IuguService)GetAccounts error. Status code: ${response.statusCode}');
		return EList.fromJson(json.decode(response.body));
	}

	static Future<EResponse> adicionarDomicilioBancario(EIuguCreateDomicilioBancarioRequest eRequest, String subAccountUserToken) async {
		var uri = Uri.http(Defines.RestBaseURL,  '/api/v1/SIuguService/AdicionarDomicilioBancario/${subAccountUserToken}');
		final response = await http.post(uri,
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},
				body: json.encode(eRequest.toJson()));

		if (response.statusCode != 200) print('(IuguService)AdicionarDomicilioBancario error. Status code: ${response.statusCode}');
		return EResponse.fromJson(json.decode(response.body));
	}

	static Future<List<EIuguVerificarDomicilioItem>> verificarEnvioDomicilioBancario(String subAccountLiveApiToken) async {
		var uri = Uri.http(Defines.RestBaseURL,  '/api/v1/SIuguService/VerificarEnvioDomicilioBancario/${subAccountLiveApiToken}');
		final response = await http.get(uri,
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},);

		if (response.statusCode != 200) print('(IuguService)VerificarEnvioDomicilioBancario error. Status code: ${response.statusCode}');
		return (json.decode(response.body) as List).map((e) => new EIuguVerificarDomicilioItem.fromJson(e)).toList();
	}

	static Future<EIuguGetAccountInfoResponse> getAccountInfo(String accountID, String subAccountLiveApiToken) async {
		var uri = Uri.http(Defines.RestBaseURL,  '/api/v1/SIuguService/GetAccountInfo/${accountID}/${subAccountLiveApiToken}');
		final response = await http.get(uri,
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},);

		if (response.statusCode != 200) print('(IuguService)GetAccountInfo error. Status code: ${response.statusCode}');
		return EIuguGetAccountInfoResponse.fromJson(json.decode(response.body));
	}

	static Future<EList> getFaturas({int listCount=-1, int pageNumber=0}) async {
		var queryParameters = {
		'listCount': (listCount).toString(),
		'pageNumber': (pageNumber).toString(),
		};

		var uri = Uri.http(Defines.RestBaseURL,  '/api/v1/SIuguService/GetFaturas', queryParameters);
		final response = await http.get(uri,
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},);

		if (response.statusCode != 200) print('(IuguService)GetFaturas error. Status code: ${response.statusCode}');
		return EList.fromJson(json.decode(response.body));
	}

	static Future<EIuguBuscarFaturaResponse> getFatura(String invoiceID, {String accountApiToken=''}) async {
		var queryParameters = {
		'accountApiToken': (accountApiToken).toString(),
		};

		var uri = Uri.http(Defines.RestBaseURL,  '/api/v1/SIuguService/GetFatura/${invoiceID}', queryParameters);
		final response = await http.get(uri,
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},);

		if (response.statusCode != 200) print('(IuguService)GetFatura error. Status code: ${response.statusCode}');
		return EIuguBuscarFaturaResponse.fromJson(json.decode(response.body));
	}

	static Future<EIuguCancelInvoiceResponse> cancelarFatura(String invoiceID, {String accountApiToken=''}) async {
		var queryParameters = {
		'accountApiToken': (accountApiToken).toString(),
		};

		var uri = Uri.http(Defines.RestBaseURL,  '/api/v1/SIuguService/CancelarFatura/${invoiceID}', queryParameters);
		final response = await http.put(uri,
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},);

		if (response.statusCode != 200) print('(IuguService)CancelarFatura error. Status code: ${response.statusCode}');
		return EIuguCancelInvoiceResponse.fromJson(json.decode(response.body));
	}

	static Future<EResponse> reembolsarFatura(String invoiceID, {String accountApiToken=''}) async {
		var queryParameters = {
		'accountApiToken': (accountApiToken).toString(),
		};

		var uri = Uri.http(Defines.RestBaseURL,  '/api/v1/SIuguService/ReembolsarFatura/${invoiceID}', queryParameters);
		final response = await http.put(uri,
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},);

		if (response.statusCode != 200) print('(IuguService)ReembolsarFatura error. Status code: ${response.statusCode}');
		return EResponse.fromJson(json.decode(response.body));
	}

}
