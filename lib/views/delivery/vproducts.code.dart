
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:saberlab_frontend_web/codes/defines.dart';
import 'package:saberlab_frontend_web/codes/routes.dart';
import 'package:saberlab_frontend_web/entities/restinpeace/edeliveryproduct.dart';
import 'package:saberlab_frontend_web/services/restinpeace/deliveryproducts_service.dart';

class VProductsCode extends ChangeNotifier{

  List<EDeliveryProduct> productList=new List<EDeliveryProduct>();

  getProducts() async{
    //if(productList!=null)return productList;
    //Logger.logDebug('retornando clientes');
    productList= await DeliveryProductsService.getAll(Defines.currentCompanyID);
    print('chegou produtos ${productList.length}');
    return productList;
  }

  void btnAddClicked(BuildContext context){
    Navigator.of(context).pushNamed(Routes.deliveryProductsEdit);
  }

  void btnEditClicked(BuildContext context, String baseEntityID){
    Navigator.of(context).pushNamed(Routes.deliveryProductsEdit);
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