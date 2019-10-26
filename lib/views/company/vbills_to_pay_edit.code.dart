

import 'package:flutter/material.dart';
import 'package:saberlab_frontend_web/entities/restinpeace/ecompanybilltopay.dart';
import 'package:saberlab_frontend_web/services/restinpeace/companiesbillstopay_service.dart';

class VBillsToPayEditCode extends ChangeNotifier{

  ECompanyBillToPay eBillToPay=new ECompanyBillToPay();
  bool invalidDescription=false;

  void setDescription(String txt){
    eBillToPay.description=txt;
  }

  Future<ECompanyBillToPay> getByID(String id) async{
    eBillToPay=await CompaniesBillsToPayService.getByID(id);
    notifyListeners();
    return eBillToPay;
  }

  void save(GlobalKey<FormState> formKey )async{

  }
}