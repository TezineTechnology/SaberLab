
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:saberlab_frontend_web/codes/defines.dart';
import 'package:saberlab_frontend_web/codes/routes.dart';
import 'package:saberlab_frontend_web/entities/restinpeace/ebaseentity.dart';
import 'package:saberlab_frontend_web/services/restinpeace/companiesclients_service.dart';

class VEmployeesCode extends ChangeNotifier{

  List<EBaseEntity> entityList=null;

  getAll() async{
    if(entityList!=null)return entityList;
    entityList= await CompaniesClientsService.getAll(Defines.currentCompanyID);
    return entityList;
  }

  void btnAddClicked(BuildContext context){
    Navigator.of(context).pushNamed(Routes.companyEmployeesEdit);
  }

  void btnEditClicked(BuildContext context){
    Navigator.of(context).pushNamed(Routes.companyEmployeesEdit);
  }

  void btnRefreshClicked(BuildContext context) async{

  }

  Future<void> btnDeleteClicked(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirmation'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Confirm removal?'),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

}