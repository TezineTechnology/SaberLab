
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:saberlab_frontend_web/codes/defines.dart';
import 'package:saberlab_frontend_web/codes/logger.dart';
import 'package:saberlab_frontend_web/codes/routes.dart';
import 'package:saberlab_frontend_web/entities/eview_arguments.dart';
import 'package:saberlab_frontend_web/entities/restinpeace/ebaseentity.dart';
import 'package:saberlab_frontend_web/services/restinpeace/companiesclients_service.dart';

class VClientsCode extends ChangeNotifier{

  List<EBaseEntity> clientsList=new List<EBaseEntity>();

  Future<List<EBaseEntity>> getClients() async{
    print('(VClients)getClients...');
    clientsList= await CompaniesClientsService.getAll(Defines.currentCompanyID);
    notifyListeners();
    return clientsList;
  }

  void btnAddClicked(BuildContext context){
    Navigator.of(context).pushNamed(Routes.companyClientsEdit, );
  }

  void btnEditClicked(BuildContext context, String baseEntityID){
    var args=new EViewArguments();
    args.setArgValue('id', baseEntityID);
    Navigator.of(context).pushNamed(Routes.companyClientsEdit,arguments: args);
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

  @override
  void dispose() {
    // TODO: implement dispose
    print('clients dispose.............................');
    super.dispose();
  }
}

class DessertDataSource extends DataTableSource{
  @override
  DataRow getRow(int index) {
    // TODO: implement getRow
    return null;
  }

  @override
  // TODO: implement isRowCountApproximate
  bool get isRowCountApproximate => null;

  @override
  // TODO: implement rowCount
  int get rowCount => null;

  @override
  // TODO: implement selectedRowCount
  int get selectedRowCount => null;

}