
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:saberlab_frontend_web/codes/defines.dart';
import 'package:saberlab_frontend_web/codes/routes.dart';
import 'package:saberlab_frontend_web/entities/restinpeace/edeliveryproductaddon.dart';
import 'package:saberlab_frontend_web/services/restinpeace/deliveryproductsaddons_service.dart';

class VAddonsCode extends ChangeNotifier{

  List<EDeliveryProductAddon> addonsList=new List<EDeliveryProductAddon>();

  getClients() async{
    if(addonsList!=null)return addonsList;
    //addonsList= await DeliveryProductsAddonsService.getAll(Defines.currentCompanyID);
    return addonsList;
  }

  void btnAddClicked(BuildContext context){
    Navigator.of(context).pushNamed(Routes.deliveryProductAddonsEdit);
  }

  void btnEditClicked(BuildContext context, String baseEntityID){
    Navigator.of(context).pushNamed(Routes.deliveryProductAddonsEdit);
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