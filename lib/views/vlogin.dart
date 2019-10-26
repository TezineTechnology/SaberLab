import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saberlab_frontend_web/codes/defines.dart';
import 'package:saberlab_frontend_web/themes/theme_default.dart';
import 'package:saberlab_frontend_web/views/vlogin.code.dart';

class VLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final code = Provider.of<VLoginCode>(context);

    return Scaffold(
      backgroundColor: Colors.grey[800],
        body:Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/back.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: _buildLayout(context, code)
        ),
    );
  }

  Widget _buildLayout(BuildContext context, VLoginCode code) {
    return Center(
        child: Container(
          width: 400,
          alignment: AlignmentDirectional.center,
          child: Card(
              child: Container(
                padding: const EdgeInsets.all(30),
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const ListTile(
                        //leading: Icon(Icons.person),
                        title: Text('LOGIN'),
                        subtitle: Text('Type your credentials below'),
                      ),
                      TextField(
                          onChanged: (txt) => code.setEmail(txt),
                          decoration: InputDecoration(
                            icon: const Icon(Icons.person),
                            errorText: code.invalidEmail ? 'Invalid email' : null,
                            //hintText: 'Login',
                            labelText: 'Email *',
                          )),
                      TextField(
                          obscureText: true,
                          onChanged: (txt) => code.setPassword(txt),
                          decoration: InputDecoration(
                            icon: const Icon(Icons.security),
                            errorText: code.invalidPassword ? 'Invalid password' : null,
                            //hintText: 'Login',
                            labelText: 'Password *',
                          )),
                      SizedBox(height: 10,),
                      SizedBox(
                        width: double.infinity,
                        child: RaisedButton(child: Text('LOGIN', style: TextStyle(color: Colors.white),), onPressed: () => code.btnLoginClicked(context), color: ThemeDefault.colorSaberLab,),
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: Text('version '+Defines.AppVersion, style: TextStyle(color:Colors.grey[900],fontSize: 10), ),
                      )
                    ]
                ),
              )
          ),
        )
    );
  }
}
