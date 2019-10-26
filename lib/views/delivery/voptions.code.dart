
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:saberlab_frontend_web/codes/defines.dart';
import 'package:saberlab_frontend_web/codes/routes.dart';
import 'package:saberlab_frontend_web/entities/restinpeace/edeliveryproductoption.dart';
import 'package:saberlab_frontend_web/services/restinpeace/deliveryproductsoptions_service.dart';

class VOptionsCode extends ChangeNotifier{

  List<EDeliveryProductOption> optionList=new List<EDeliveryProductOption>();

  getClients() async{
    if(optionList!=null)return optionList;
    optionList= await DeliveryProductsOptionsService.getAll(Defines.currentCompanyID);
    return optionList;
  }

  void btnAddClicked(BuildContext context){
    Navigator.of(context).pushNamed(Routes.deliveryProductOptionsEdit);
  }

  void btnEditClicked(BuildContext context, String baseEntityID){
    Navigator.of(context).pushNamed(Routes.deliveryProductOptionsEdit);
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