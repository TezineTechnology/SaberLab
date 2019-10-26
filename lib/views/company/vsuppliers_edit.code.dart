
import 'package:flutter/cupertino.dart';
import 'package:saberlab_frontend_web/entities/restinpeace/ebaseentity.dart';


class VSuppliersEditCode extends ChangeNotifier{

  EBaseEntity eSupplier=new EBaseEntity();
  bool invalidName=false;

  void setName(String txt){
    eSupplier.name=txt;
  }

  void save(GlobalKey<FormState> formKey )async{

  }
}