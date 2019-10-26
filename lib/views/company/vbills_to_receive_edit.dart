
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saberlab_frontend_web/themes/theme_default.dart';
import 'package:saberlab_frontend_web/views/company/vbills_to_receive_edit.code.dart';

class VBillsToReceiveEdit extends StatefulWidget {
  @override
  _VBillsToReceiveEditState createState() => _VBillsToReceiveEditState();
}

class _VBillsToReceiveEditState extends State<VBillsToReceiveEdit> {
  final _formKey = GlobalKey<FormState>();
  bool _loading = true;

  @override
  void initState() {
    super.initState();
  }

  void dispose() {
    print('(VBillsToReceiveEdit)dispose');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return
      Consumer<VBillsToReceiveEditCode>(
        builder: (context, code, child) {
          return Scaffold(
              backgroundColor: ThemeDefault.colorBackground,
              appBar: AppBar(
                title: Text('Bill to receive'),
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

  Widget _buildLayout(BuildContext context, VBillsToReceiveEditCode code) {
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
                            Text('Bill to receive', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: TextField(
                                      onChanged: (txt) => code.setDescription(txt),
                                      decoration: InputDecoration(
                                        icon: const Icon(Icons.text_fields),
                                        errorText: code.invalidDescription ? 'Invalid description' : null,
                                        //hintText: 'Login',
                                        labelText: 'Description *',
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

