import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saberlab_frontend_web/entities/eview_arguments.dart';
import 'package:saberlab_frontend_web/entities/restinpeace/ecompanybilltopay.dart';
import 'package:saberlab_frontend_web/themes/theme_default.dart';
import 'package:saberlab_frontend_web/views/company/vbills_to_pay_edit.code.dart';

class VBillsToPayEdit extends StatefulWidget {
  @override
  _VBillsToPayEditState createState() => _VBillsToPayEditState();
}

class _VBillsToPayEditState extends State<VBillsToPayEdit> {
  final _formKey = GlobalKey<FormState>();
  bool _loading = true;

  @override
  void initState() {
    super.initState();
  }

  void dispose() {
    print('(VBillsToPayEdit)dispose');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final code = Provider.of<VBillsToPayEditCode>(context, listen: false);
    final EViewArguments args = ModalRoute
        .of(context)
        .settings
        .arguments;
    return Scaffold(
        backgroundColor: ThemeDefault.colorBackground,
        appBar: AppBar(
          title: Text('Bill to pay'),
          actions: <Widget>[
            FlatButton.icon(
              label: Text('Save'),
              icon: const Icon(Icons.save),
              onPressed: () async => await code.save(_formKey),
            ),
          ],
        ),
        body: FutureProvider<ECompanyBillToPay>(
            builder: (context) async {
              var result = await code.getByID(args.getArgValue('id'));
              setState(() {
                _loading = false;
              });
              return result;
            },
            catchError: null,
            child: Form(
                key: _formKey,
                child: _buildLayout(context, code)
            )
        )
    );
  }

  Widget _buildLayout(BuildContext context, VBillsToPayEditCode code) {
    print('(VBillsToPayEdit)_buildLayout..............');
    if (_loading)
      return Center(
        child: CircularProgressIndicator(),
      );
    else
      return SingleChildScrollView(
        child: Column(
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
                                Text('Bill to pay', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),),
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
        ),
      );
  }
}

