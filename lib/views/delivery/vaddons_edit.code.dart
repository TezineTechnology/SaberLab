
import 'package:flutter/cupertino.dart';
import 'package:saberlab_frontend_web/entities/restinpeace/edeliveryproductaddon.dart';

class VAddonsEditCode extends ChangeNotifier{

  EDeliveryProductAddon eAddon=new EDeliveryProductAddon();
  bool invalidName=false;

  void setName(String txt){
    eAddon.name=txt;
  }

  void save(GlobalKey<FormState> formKey )async{
  }
}