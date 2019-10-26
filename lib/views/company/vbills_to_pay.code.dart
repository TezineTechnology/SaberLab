
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:saberlab_frontend_web/codes/defines.dart';
import 'package:saberlab_frontend_web/codes/routes.dart';
import 'package:saberlab_frontend_web/entities/eview_arguments.dart';
import 'package:saberlab_frontend_web/entities/restinpeace/ecompanybilltopay.dart';
import 'package:saberlab_frontend_web/services/restinpeace/companiesbillstopay_service.dart';

class VBillsToPayCode extends ChangeNotifier{

  List<ECompanyBillToPay> billsList=new List<ECompanyBillToPay>();

  getAll() async{
    if(billsList!=null)return billsList;
    //billsList= await CompaniesBillsToPayService.getAll(Defines.currentCompanyID);
    return billsList;
  }

  void btnEditClicked(BuildContext context, String billID){
    var args=new EViewArguments();
    args.setArgValue('id', billID);
    Navigator.of(context).pushNamed(Routes.companyBillsToPayEdit,arguments: args);
  }

  void btnAddClicked(BuildContext context){
    Navigator.of(context).pushNamed(Routes.companyBillsToPayEdit);
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