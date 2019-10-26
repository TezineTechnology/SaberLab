
import 'package:flutter/material.dart';
import 'package:saberlab_frontend_web/codes/routes.dart';
import 'package:saberlab_frontend_web/codes/validation_helper.dart';
import 'package:saberlab_frontend_web/entities/euser.dart';

class VLoginCode extends ChangeNotifier{
  EUser _eUser=new EUser();
  bool invalidEmail=false;
  bool invalidPassword=false;
  bool termsAccepted=false;

  void setEmail(String email){
    _eUser.email=email;
    if(!ValidationHelper.isEmailValid(email))invalidEmail=true;
    else invalidEmail=false;
  }

  void setPassword(String password){
    _eUser.password=password;
  }

  void btnLoginClicked(BuildContext context){
    Navigator.of(context).pushNamed(Routes.companyDashboard);
  }
}