
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saberlab_frontend_web/themes/theme_default.dart';
import 'package:saberlab_frontend_web/views/delivery/vaddons_edit.code.dart';

class VAddonsEdit extends StatefulWidget {
  @override
  _VAddonsEditState createState() => _VAddonsEditState();
}

class _VAddonsEditState extends State<VAddonsEdit> {
  final _formKey = GlobalKey<FormState>();
  bool _loading = true;

  @override
  void initState() {
    super.initState();
  }

  void dispose() {
    print('(VAddonsEdit)dispose');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return
      Consumer<VAddonsEditCode>(
        builder: (context, code, child) {
          return Scaffold(
              backgroundColor: ThemeDefault.colorBackground,
              appBar: AppBar(
                title: Text('Addon'),
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

  Widget _buildLayout(BuildContext context, VAddonsEditCode code) {
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
                            Text('Addon', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),),
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

