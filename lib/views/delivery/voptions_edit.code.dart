
import 'package:flutter/cupertino.dart';
import 'package:saberlab_frontend_web/entities/restinpeace/edeliveryproductoption.dart';

class VOptionsEditCode extends ChangeNotifier{

  EDeliveryProductOption eSupplier=new EDeliveryProductOption();
  bool invalidName=false;

  void setName(String txt){
    eSupplier.name=txt;
  }

  void save(GlobalKey<FormState> formKey)async{
  }
}