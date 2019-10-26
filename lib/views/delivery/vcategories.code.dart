
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:saberlab_frontend_web/codes/routes.dart';
import 'package:saberlab_frontend_web/entities/restinpeace/edeliveryproductcategory.dart';

class VCategoriesCode extends ChangeNotifier{

  List<EDeliveryProductCategory> categoryList=new List<EDeliveryProductCategory>();

  getClients() async{
    if(categoryList!=null)return categoryList;
    //categoryList= await CompaniesClientsService.getAll(Defines.currentCompanyID);
    return categoryList;
  }

  void btnAddClicked(BuildContext context){
    Navigator.of(context).pushNamed(Routes.deliveryCategoriesEdit);
  }

  void btnEditClicked(BuildContext context, String baseEntityID){
    Navigator.of(context).pushNamed(Routes.deliveryCategoriesEdit);
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