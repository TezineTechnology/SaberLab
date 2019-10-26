import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saberlab_frontend_web/codes/logger.dart';
import 'package:saberlab_frontend_web/entities/restinpeace/emodule.dart';
import 'package:saberlab_frontend_web/themes/theme_default.dart';
import 'package:saberlab_frontend_web/views/company/vmodules.code.dart';

class VModules extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<VModulesCode>(
      builder: (context, code, child) {
        return Scaffold(
            backgroundColor: ThemeDefault.colorBackground,
            appBar: AppBar(
              title: Text('Modules'),
              actions: <Widget>[
//                FlatButton.icon(
//                    label: Text('Save'),
//                    icon: const Icon(Icons.add),
//                    onPressed: () async => await code.btnSaveClicked(context)
//                ),
              ],
            ),
            body: _buildLayout(context, code));
      },
    );
  }

  Widget _buildLayout(BuildContext context, VModulesCode code) {
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

  Widget _buildTable(BuildContext context, VModulesCode code, { int sortColumnIndex = 0, bool sortAscending = true }) {
    Logger.logDebug(' reload');
    return FutureBuilder(
        future: code.getModules(),
        builder: (context, projectSnap) {
          if (projectSnap.connectionState != ConnectionState.done)
            return Center(
              child: CircularProgressIndicator(),
            );
          else if (projectSnap.hasError) {
            return Text('Erro ao baixar clientes ${projectSnap.error}');
          } else
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
                  label: const Text('Enabled'),
                  tooltip: 'Enabled',
                  onSort: (int columnIndex, bool ascending) {
                    Logger.logDebug('column-sort: $columnIndex $ascending');
                  },
                ),
              ],
              rows: projectSnap.data.map<DataRow>((EModule eModule) {
                return DataRow(
                  key: Key(eModule.moduleType.toString()),
                  onSelectChanged: null,
                  cells: <DataCell>[
                    DataCell(
                      Text(eModule.moduleName),
                    ),
                    DataCell(
                      Text('${eModule.enabled}'),
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
