
import 'package:flutter/cupertino.dart';
import 'package:saberlab_frontend_web/codes/defines.dart';
import 'package:saberlab_frontend_web/codes/routes.dart';
import 'package:saberlab_frontend_web/entities/restinpeace/ebaseentity.dart';
import 'package:saberlab_frontend_web/services/restinpeace/companiessuppliers_service.dart';

class VSuppliersCode extends ChangeNotifier{

  List<EBaseEntity> suppliersList=null;

  getSuppliers() async{
    if(suppliersList!=null)return suppliersList;
    //Logger.logDebug('retornando clientes');
    suppliersList= await CompaniesSuppliersService.getAll(Defines.currentCompanyID);
    //Logger.logDebug('retornando clientes para o vclients $clientsList');
    return suppliersList;
  }


  void btnAddClicked(BuildContext context){
    Navigator.of(context).pushNamed(Routes.companySuppliersEdit);
  }

  void btnRefreshClicked(BuildContext context) async{

  }

  void btnEditClicked(BuildContext context){
    Navigator.of(context).pushNamed(Routes.companySuppliersEdit);
  }

  void btnDeleteClicked(BuildContext context){

  }
}