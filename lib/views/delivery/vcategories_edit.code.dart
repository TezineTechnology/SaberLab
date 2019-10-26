
import 'package:flutter/cupertino.dart';
import 'package:saberlab_frontend_web/entities/restinpeace/edeliveryproductcategory.dart';

class VCategoriesEditCode extends ChangeNotifier{
  EDeliveryProductCategory eCategory=new EDeliveryProductCategory();
  bool invalidName=false;

  void setName(String txt){
    eCategory.name=txt;
  }

  void save(GlobalKey<FormState> formKey )async{
  }
}