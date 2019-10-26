
import 'package:flutter/cupertino.dart';
import 'package:saberlab_frontend_web/entities/restinpeace/ebaseentity.dart';
import 'package:saberlab_frontend_web/entities/restinpeace/ecompany.dart';
import 'package:saberlab_frontend_web/services/restinpeace/baseentities_service.dart';
import 'package:saberlab_frontend_web/services/restinpeace/companies_service.dart';

class VConfigCode extends ChangeNotifier{

  ECompany eCompany=new ECompany();
  final txtNameController = TextEditingController();
  final txtEmailController = TextEditingController();
  final txtMobileController= TextEditingController();
  final txtPhoneController=TextEditingController();

  Future<ECompany> getByID(String companyID) async{
     eCompany= await CompaniesService.getByID(companyID);
     txtNameController.text=eCompany.name;
     txtEmailController.text=eCompany.email;
     txtMobileController.text=eCompany.mobile;
     txtPhoneController.text=eCompany.phone1;
     notifyListeners();
     return eCompany;
  }

  void save(GlobalKey<FormState> formKey )async{
    print('clicou em save: ${txtNameController.text}');
    bool isFormValid=formKey.currentState.validate();
    print('isValid $isFormValid');
    eCompany.name=txtNameController.text;
    eCompany.email=txtEmailController.text;
    eCompany.mobile=txtEmailController.text;
    eCompany.phone1=txtPhoneController.text;
  }

  @override
  void dispose() {
    print('(VConfigCode)dispose.............................');
    txtNameController.dispose();
    txtEmailController.dispose();
    txtPhoneController.dispose();
    super.dispose();
  }
}