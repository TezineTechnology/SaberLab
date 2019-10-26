
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:saberlab_frontend_web/codes/defines.dart';
import 'package:saberlab_frontend_web/codes/routes.dart';
import 'package:saberlab_frontend_web/entities/restinpeace/edeliveryorder.dart';
import 'package:saberlab_frontend_web/services/restinpeace/deliveryorders_service.dart';

class VOrdersCode extends ChangeNotifier{


  List<EDeliveryOrder> orderList=new List<EDeliveryOrder>();

  getOrders() async{
    if(orderList!=null)return orderList;
    //Logger.logDebug('retornando clientes');
    orderList= await DeliveryOrdersService.getAll(Defines.currentCompanyID);
    //Logger.logDebug('retornando clientes para o vclients $clientsList');
    return orderList;
  }

  void btnAddClicked(BuildContext context){
    Navigator.of(context).pushNamed(Routes.deliveryOrders);
  }

  void btnEditClicked(BuildContext context, String baseEntityID){
    Navigator.of(context).pushNamed(Routes.companyClientsEdit);
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