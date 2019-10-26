
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saberlab_frontend_web/codes/logger.dart';
import 'package:saberlab_frontend_web/entities/restinpeace/ebaseentity.dart';
import 'package:saberlab_frontend_web/themes/theme_default.dart';
import 'package:saberlab_frontend_web/views/company/vsuppliers.code.dart';

class VSuppliers extends StatefulWidget {
  @override
  _VSuppliersState createState() => _VSuppliersState();
}

class _VSuppliersState extends State<VSuppliers> {
  final _formKey = GlobalKey<FormState>();
  bool _loading = true;

  @override
  void initState() {
    super.initState();
  }

  void dispose() {
    print('(VSuppliers)dispose');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<VSuppliersCode>(
      builder: (context, code, child) {
        return Scaffold(
            backgroundColor: ThemeDefault.colorBackground,
            appBar: AppBar(
              title: Text('Suppliers'),
              actions: <Widget>[
                FlatButton.icon(
                    label: Text('Add'),
                    icon: const Icon(Icons.add),
                    onPressed: () async => await code.btnAddClicked(context)
                ),
                FlatButton.icon(
                    label: Text('Refresh'),
                    icon: const Icon(Icons.refresh),
                    onPressed: () async => await code.btnRefreshClicked(context)
                ),
              ],
            ),
            body: _buildLayout(context, code));
      },
    );
  }

  Widget _buildLayout(BuildContext context, VSuppliersCode code) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20),
      child: Card(
        child: Container(
          padding: EdgeInsets.all(20),
          child: _buildTable(context, code),
        ),
      ),
    );
  }


  Widget _buildTable(BuildContext context, VSuppliersCode code, { int sortColumnIndex=0, bool sortAscending = true }) {
    Logger.logDebug(' reload');
    return FutureBuilder(
        future: code.getSuppliers(),
        builder: (context, projectSnap) {
          if(projectSnap.connectionState!=ConnectionState.done)return Center(
            child: CircularProgressIndicator(),
          );
          else if(projectSnap.hasError){
            return Text('Erro ao baixar clientes ${projectSnap.error}');
          }else
            Logger.logDebug('chegou dados ${projectSnap.data}');
          return SizedBox(
            width: double.infinity,
            child: DataTable(
              sortColumnIndex: sortColumnIndex,
              sortAscending: sortAscending,
              onSelectAll: (bool value) {
                Logger.logDebug('select-all: $value');
              },
              columns: <DataColumn>[
                const DataColumn(
                  label: Text('Name'),
                  tooltip: 'Name',
                ),
                DataColumn(
                  label: const Text('Email'),
                  tooltip: 'Email',
                  onSort: (int columnIndex, bool ascending) {
                    Logger.logDebug('column-sort: $columnIndex $ascending');
                  },
                ),
                const DataColumn(
                  label: Text('Mobile'),
                  tooltip: 'Mobile',
                ),
                DataColumn(label: Text('')),
                DataColumn(label: Text(''))
              ],
              rows: projectSnap.data.map<DataRow>((EBaseEntity eBaseEntity) {
                return DataRow(
                  key: Key(eBaseEntity.id),
                  onSelectChanged: null,
                  cells: <DataCell>[
                    DataCell(
                      Text(eBaseEntity.name),
                    ),
                    DataCell(
                      Text('${eBaseEntity.email}'),
                    ),
                    DataCell(
                      Text(eBaseEntity.mobile),
                    ),
                    DataCell(
                      Icon(Icons.edit),
                      onTap: ()=>code.btnEditClicked(context),
                    ),
                    DataCell(
                      Icon(Icons.delete),
                      onTap: () async =>await code.btnDeleteClicked(context),
                    ),
                  ],
                );
              }).toList(),
            ),
          );
        }

    );

  }
}


