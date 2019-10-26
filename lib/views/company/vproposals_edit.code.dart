
import 'package:flutter/cupertino.dart';
import 'package:saberlab_frontend_web/entities/restinpeace/ecompanyproposal.dart';

class VProposalsEditCode extends ChangeNotifier{

  ECompanyProposal eProposal=new ECompanyProposal();
  bool invalidTitle=false;

  void setTitle(String txt){
    eProposal.title=txt;
  }

  void save(GlobalKey<FormState> formKey )async{

  }
}