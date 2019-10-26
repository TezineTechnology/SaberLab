
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saberlab_frontend_web/themes/theme_default.dart';
import 'package:saberlab_frontend_web/views/delivery/vorders_edit.code.dart';

class VOrdersEdit extends StatefulWidget {
  @override
  _VOrdersEditState createState() => _VOrdersEditState();
}

class _VOrdersEditState extends State<VOrdersEdit> {
  final _formKey = GlobalKey<FormState>();
  bool _loading = true;

  @override
  void initState() {
    super.initState();
  }

  void dispose() {
    print('(VOrdersEdit)dispose');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return
      Consumer<VOrdersEditCode>(
        builder: (context, code, child) {
          return Scaffold(
              backgroundColor: ThemeDefault.colorBackground,
              appBar: AppBar(
                title: Text('Order'),
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

  Widget _buildLayout(BuildContext context, VOrdersEditCode code) {
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
                            Text('Order', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: TextField(
                                      onChanged: null,
                                      decoration: InputDecoration(
                                        icon: const Icon(Icons.text_fields),
                                        //hintText: 'Login',
                                        labelText: 'ID',
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

