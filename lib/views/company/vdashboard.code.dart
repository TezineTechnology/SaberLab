
import 'package:flutter/cupertino.dart';
import 'package:saberlab_frontend_web/codes/defines.dart';
import 'package:saberlab_frontend_web/entities/restinpeace/edashboard.dart';
import 'package:saberlab_frontend_web/services/restinpeace/companies_service.dart';

class VDashboardCode extends ChangeNotifier{

  bool loading=false;
  EDashboard eDashboard=new EDashboard();//new EDashboard();

  Future<EDashboard> getDashboard()async{
    loading=true;
    eDashboard=await CompaniesService.getDashboard(Defines.currentCompanyID);
    loading=false;
    notifyListeners();
    return eDashboard;
  }
}