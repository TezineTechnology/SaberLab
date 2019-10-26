
import 'package:flutter/cupertino.dart';
import 'package:saberlab_frontend_web/codes/defines.dart';
import 'package:saberlab_frontend_web/entities/restinpeace/emodule.dart';
import 'package:saberlab_frontend_web/services/restinpeace/modules_service.dart';

class VModulesCode extends ChangeNotifier{

  List<EModule> moduleList=new List<EModule>();

  getModules() async{
    if(moduleList!=null)return moduleList;
    moduleList= await ModulesService.getAllByCompany(Defines.currentCompanyID);
    return moduleList;
  }

  btnSaveClicked(BuildContext context) async{

  }
}