
import 'package:flutter/cupertino.dart';
import 'package:saberlab_frontend_web/entities/restinpeace/ecompanybilltoreceive.dart';

class VBillsToReceiveEditCode extends ChangeNotifier{

  ECompanyBillToReceive eBillToReceive=new ECompanyBillToReceive();
  bool invalidDescription=false;

  void setDescription(String txt){
    eBillToReceive.description=txt;
  }

  void save(GlobalKey<FormState> formKey ) async{

  }

}