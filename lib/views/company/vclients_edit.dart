import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saberlab_frontend_web/codes/logger.dart';
import 'package:saberlab_frontend_web/entities/eview_arguments.dart';
import 'package:saberlab_frontend_web/entities/restinpeace/ebaseentity.dart';
import 'package:saberlab_frontend_web/themes/theme_default.dart';

import 'vclients_edit.code.dart';

class VClientsEdit extends StatefulWidget {

  VClientsEdit() {
    print('(VClientsEdit)constructor');
  }

  @override
  _VClientsEditState createState() => _VClientsEditState();
}

class _VClientsEditState extends State<VClientsEdit> {
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  void dispose() {
    print('(VClientsEdit)dispose');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final EViewArguments args = ModalRoute
        .of(context)
        .settings
        .arguments;
    final code = Provider.of<VClientsEditCode>(context, listen: false);
    if (args == null) code.clearControllers();
    return Scaffold(
        backgroundColor: ThemeDefault.colorBackground,
        appBar: AppBar(
          title: Text('Client'),
          actions: <Widget>[
            FlatButton.icon(
                label: Text('Save'),
                icon: const Icon(Icons.save),
                onPressed: () => code.save(_formKey)
            ),
          ],
        ),
        body: args == null ? _buildForm() : _buildFutureProvider(args, code)
    );
  }

  Widget _buildFutureProvider(EViewArguments args, VClientsEditCode code) {
    return FutureProvider<EBaseEntity>(
        builder: (context) async {
          var result = await code.getByID(args.getArgValue('id'));
          return result;
        },
        catchError: (context, error) {
          print(error);
          return null;
        },
        child: _buildForm()
    );
  }

  Widget _buildForm() {
    return Form(
      key: _formKey,
      child: _buildLayout(context),
    );
  }

  Widget _buildLayout(BuildContext context) {
    print('(VClientsEdit)_buildLayout..............');
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Consumer<VClientsEditCode>(
              builder: (context, code, child) {
                return Visibility(
                  visible: code.loading,
                  child: SizedBox(
                    width: double.infinity,
                    child: LinearProgressIndicator(),
                  ),
                );
              }),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            child: Card(
                child: Container(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Client', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),),
                        Row(
                          children: <Widget>[
                            Expanded(
                                child: Consumer<VClientsEditCode>(
                                    builder: (context, code, child) {
                                      return TextFormField(
                                          controller: code.txtNameController,
                                          validator: (value) {
                                            if (value.length < 3) return 'Invalid name';
                                            return null;
                                          },
                                          decoration: InputDecoration(
                                            icon: const Icon(Icons.person),
                                            labelText: 'Name *',
                                          ));
                                    })),
                            Expanded(
                                child: Consumer<VClientsEditCode>(
                                    builder: (context, code, child) {
                                      return TextFormField(
                                          controller: code.txtEmailController,
                                          validator: (value) {
                                            if (value.isEmpty || !value.contains('@')) return 'Invalid email';
                                            return null;
                                          },
                                          decoration: InputDecoration(
                                            icon: const Icon(Icons.email),
                                            labelText: 'E-mail *',
                                          ));
                                    })),

                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                                child: Consumer<VClientsEditCode>(
                                    builder: (context, code, child) {
                                      return TextFormField(
                                          controller: code.txtMobileController,
                                          //onChanged: (txt) => code.setEmail(txt),
                                          decoration: InputDecoration(
                                            icon: const Icon(Icons.mobile_screen_share),
                                            labelText: 'Mobile',
                                          ));
                                    })),
                            Expanded(
                                child: Consumer<VClientsEditCode>(
                                    builder: (context, code, child) {
                                      return TextFormField(
                                          controller: code.txtPhoneController,
                                          decoration: InputDecoration(
                                            icon: const Icon(Icons.phone),
                                            labelText: 'Phone *',
                                          ));
                                    }
                                )
                            )
                          ],
                        )
                      ],
                    )
                )
            ),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            child: Card(
              child: Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Address', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Consumer<VClientsEditCode>(
                                builder: (context, code, child) {
                                  return TextFormField(
                                      controller: code.txtPostalCodeController,
                                      decoration: InputDecoration(
                                        labelText: 'Postal code',
                                      ));
                                }
                            ),
                          ),
                          SizedBox(width: 10,),
                          Expanded(
                              child: Consumer<VClientsEditCode>(
                                  builder: (context, code, child) {
                                    return TextFormField(
                                        controller: code.txtStreetController,
                                        validator: (value) {
                                          if (value.isEmpty) {
                                            return 'Please enter some text';
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          labelText: 'Street',
                                        ));
                                  }
                              )
                          )
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                              child: Consumer<VClientsEditCode>(
                                  builder: (context, code, child) {
                                    return TextFormField(
                                        controller: code.txtNumberController,
                                        decoration: InputDecoration(
                                          labelText: 'Number',
                                        ));
                                  }
                              )
                          ),
                          SizedBox(width: 10,),
                          Expanded(
                              child: Consumer<VClientsEditCode>(
                                  builder: (context, code, child) {
                                    return TextFormField(
                                        controller: code.txtComplementController,
                                        decoration: InputDecoration(
                                          labelText: 'Complement',
                                        ));
                                  }
                              )
                          )
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                              child: Consumer<VClientsEditCode>(
                                  builder: (context, code, child) {
                                    return TextFormField(
                                        controller: code.txtNeighborhoodController,
                                        decoration: InputDecoration(
                                          labelText: 'Neighborhood',
                                        ));
                                  }
                              )
                          ),
                          SizedBox(width: 10,),
                          Expanded(
                              child: Consumer<VClientsEditCode>(
                                  builder: (context, code, child) {
                                    return TextFormField(
                                        controller: code.txtReferenceController,
                                        decoration: InputDecoration(
                                          labelText: 'Reference point',
                                        ));
                                  }
                              )
                          )
                        ],
                      ),
                    ],
                  )
              ),
            ),
          )
        ],
      ),
    );
  }
}


