
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:saberlab_frontend_web/codes/defines.dart';
import 'package:saberlab_frontend_web/codes/routes.dart';
import 'package:saberlab_frontend_web/entities/restinpeace/ecompanybilltoreceive.dart';
import 'package:saberlab_frontend_web/services/restinpeace/companiesbillstoreceive_service.dart';

class VBillsToReceiveCode extends ChangeNotifier{

  List<ECompanyBillToReceive> billsList=new List<ECompanyBillToReceive>();

  getAll() async{
    if(billsList!=null)return billsList;
    //billsList= await CompaniesBillsToReceiveService.getAll(Defines.currentCompanyID);
    return billsList;
  }

  void btnEditClicked(BuildContext context){
    Navigator.of(context).pushNamed(Routes.companyBillsToReceiveEdit);
  }

  void btnAddClicked(BuildContext context){
    Navigator.of(context).pushNamed(Routes.companyBillsToReceiveEdit);
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