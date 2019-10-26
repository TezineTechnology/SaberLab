
import 'package:flutter/cupertino.dart';
import 'package:saberlab_frontend_web/entities/restinpeace/edeliveryproduct.dart';

class VProductsEditCode extends ChangeNotifier{

  EDeliveryProduct eProduct=new EDeliveryProduct();
  bool invalidName=false;

  void setName(String txt){
    eProduct.name=txt;
  }

  void save(GlobalKey<FormState> formKey )async{
  }
}