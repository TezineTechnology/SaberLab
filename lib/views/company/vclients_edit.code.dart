import 'package:flutter/cupertino.dart';
import 'package:saberlab_frontend_web/entities/restinpeace/ebaseaddress.dart';
import 'package:saberlab_frontend_web/entities/restinpeace/ebaseentity.dart';
import 'package:saberlab_frontend_web/services/restinpeace/baseaddresses_service.dart';
import 'package:saberlab_frontend_web/services/restinpeace/baseentities_service.dart';
import 'package:saberlab_frontend_web/services/restinpeace/companies_service.dart';
import 'package:saberlab_frontend_web/services/restinpeace/companiesclients_service.dart';
import 'package:async/async.dart';

class VClientsEditCode extends ChangeNotifier {

  final AsyncMemoizer _memoizer = AsyncMemoizer();
  bool loading=false;
  final txtNameController = TextEditingController();
  final txtEmailController = TextEditingController();
  final txtMobileController = TextEditingController();
  final txtPhoneController = TextEditingController();
  final txtPostalCodeController = TextEditingController();
  final txtStreetController = TextEditingController();
  final txtNumberController = TextEditingController();
  final txtComplementController = TextEditingController();
  final txtNeighborhoodController = TextEditingController();
  final txtReferenceController = TextEditingController();
  final txtCityController = TextEditingController();
  String clientID = null;
  EBaseEntity eClient = new EBaseEntity();
  EBaseAddress eBaseAddress = new EBaseAddress();

  VClientsEditCode() {
    print('(VClientsEditCode)constructor');
  }

  void clearControllers(){
    txtNameController.clear();
    txtEmailController.clear();
    txtMobileController.clear();
    txtPhoneController.clear();
    txtPostalCodeController.clear();
  }

  Future<EBaseEntity> getByID(String id) async {
    if (id == null) return null;
  //  if (eClient.id != null) return null;
    print('(VClientsEditCode)getByID.......................');
    loading=true;
    eClient = await BaseEntitiesService.getByID(id);
    loading=false;
    txtNameController.text = eClient.name;
    txtEmailController.text = eClient.email;
    txtMobileController.text = eClient.mobile;
    txtPhoneController.text = eClient.contactPhone;
    notifyListeners();
    return eClient;
  }

  getByIDMemorizer(String id)  {
    return _memoizer.runOnce(() async {
      print('(VClientsEditCode)getByID.......................');
      loading = true;
      eClient = await BaseEntitiesService.getByID(id);
      loading = false;
      txtNameController.text = eClient.name;
      txtEmailController.text = eClient.email;
      txtMobileController.text = eClient.mobile;
      txtPhoneController.text = eClient.contactPhone;
      notifyListeners();
      return eClient;
    });
  }

  void save(GlobalKey<FormState> formKey) async {
    print('clicou em save: ${txtNameController.text}');
    bool isFormValid=formKey.currentState.validate();
    print('isValid $isFormValid');
    eClient.name=txtNameController.text;
    loading=true;
    notifyListeners();
    await new Future.delayed(Duration(seconds: 1), () => 'Welcome to your async screen');
    loading=false;
    notifyListeners();
  }

  @override
  void dispose() {
    print('clients edit dispose.............................');
    txtNameController.dispose();
    txtEmailController.dispose();
    txtPhoneController.dispose();
    txtPostalCodeController.dispose();
    txtStreetController.dispose();
    txtNumberController.dispose();
    txtComplementController.dispose();
    txtNeighborhoodController.dispose();
    txtReferenceController.dispose();
    super.dispose();
  }
}

