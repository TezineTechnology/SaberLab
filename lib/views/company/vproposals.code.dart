
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:saberlab_frontend_web/codes/defines.dart';
import 'package:saberlab_frontend_web/codes/routes.dart';
import 'package:saberlab_frontend_web/entities/restinpeace/ecompanyproposal.dart';
import 'package:saberlab_frontend_web/services/restinpeace/companiesproposals_service.dart';

class VProposalsCode extends ChangeNotifier{

  List<ECompanyProposal> proposalList=new List<ECompanyProposal>();

  getAll() async{
    if(proposalList!=null)return proposalList;
    //proposalList= await CompaniesProposalsService.getAll(Defines.currentCompanyID);
    return proposalList;
  }

  void btnEditClicked(BuildContext context){
    Navigator.of(context).pushNamed(Routes.companyProposalsEdit);
  }

  void btnAddClicked(BuildContext context){
    Navigator.of(context).pushNamed(Routes.companyProposalsEdit);
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