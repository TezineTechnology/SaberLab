
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saberlab_frontend_web/themes/theme_default.dart';
import 'package:saberlab_frontend_web/views/delivery/voptions_edit.code.dart';

class VOptionsEdit extends StatefulWidget {
  @override
  _VOptionsEditState createState() => _VOptionsEditState();
}

class _VOptionsEditState extends State<VOptionsEdit> {
  final _formKey = GlobalKey<FormState>();
  bool _loading = true;

  @override
  void initState() {
    super.initState();
  }

  void dispose() {
    print('(VOptionsEdit)dispose');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return
      Consumer<VOptionsEditCode>(
        builder: (context, code, child) {
          return Scaffold(
              backgroundColor: ThemeDefault.colorBackground,
              appBar: AppBar(
                title: Text('Option'),
                actions: <Widget>[
                  FlatButton.icon(
                    label: Text('Save'),
                    icon: const Icon(Icons.save),
                    onPressed: () async =>await code.save(_formKey),
                  ),
                ],
              ),
              body: _buildLayout(context, code));
        },
      );
  }

  Widget _buildLayout(BuildContext context, VOptionsEditCode code) {
    return Column(
        children: <Widget>[
          Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              child: Card(
                  child: Container(
                      padding: EdgeInsets.all(20),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('Option', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: TextField(
                                      onChanged: (txt) => code.setName(txt),
                                      decoration: InputDecoration(
                                        icon: const Icon(Icons.text_fields),
                                        errorText: code.invalidName ? 'Invalid name' : null,
                                        //hintText: 'Login',
                                        labelText: 'Name *',
                                      )),
                                )
                              ],
                            ),
                          ])
                  )
              )
          )
        ]
    );
  }
}

