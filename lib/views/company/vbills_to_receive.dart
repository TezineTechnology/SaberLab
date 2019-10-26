
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saberlab_frontend_web/codes/logger.dart';
import 'package:saberlab_frontend_web/entities/restinpeace/ecompanybilltoreceive.dart';
import 'package:saberlab_frontend_web/themes/theme_default.dart';
import 'package:saberlab_frontend_web/views/company/vbills_to_receive.code.dart';

class VBillsToReceive extends StatefulWidget {
  @override
  _VBillsToReceiveState createState() => _VBillsToReceiveState();
}

class _VBillsToReceiveState extends State<VBillsToReceive> {
  final _formKey = GlobalKey<FormState>();
  bool _loading = true;

  @override
  void initState() {
    super.initState();
  }

  void dispose() {
    print('(VBillsToReceive)dispose');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<VBillsToReceiveCode>(
      builder: (context, code, child) {
        return Scaffold(
            backgroundColor: ThemeDefault.colorBackground,
            appBar: AppBar(
              title: Text('Bills to receive'),
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
            body:  _buildLayout(context, code));
      },
    );
  }

  Widget _buildLayout(BuildContext context, VBillsToReceiveCode code) {
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

  Widget _buildTable(BuildContext context, VBillsToReceiveCode code, { int sortColumnIndex = 0, bool sortAscending = true }) {
    Logger.logDebug(' reload');
    return FutureBuilder(
        future: code.getAll(),
        builder: (context, projectSnap) {
          if (projectSnap.connectionState != ConnectionState.done)
            return Center(
              child: CircularProgressIndicator(),
            );
          else if (projectSnap.hasError) {
            return Text('Erro ao baixar ${projectSnap.error}');
          } else
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
                    label: Text('Description'),
                    tooltip: 'Description',
                  ),
                  DataColumn(
                    label: const Text('From'),
                    tooltip: 'From',
                    onSort: (int columnIndex, bool ascending) {
                      Logger.logDebug('column-sort: $columnIndex $ascending');
                    },
                  ),
                  const DataColumn(
                    label: Text('Total'),
                    tooltip: 'Total',
                  ),
                  DataColumn(label: Text('')),
                  DataColumn(label: Text(''))
                ],
                rows: projectSnap.data.map<DataRow>((ECompanyBillToReceive eBillToReceive) {
                  return DataRow(
                    key: Key(eBillToReceive.id),
                    onSelectChanged: null,
                    cells: <DataCell>[
                      DataCell(
                        Text(eBillToReceive.description),
                      ),
                      DataCell(
                        Text('${eBillToReceive.fromEntityID}'),
                      ),
                      DataCell(
                        Text(eBillToReceive.amount.toString()),
                      ),
                      DataCell(
                        Icon(Icons.edit),
                        onTap: () => code.btnEditClicked(context),
                      ),
                      DataCell(
                        Icon(Icons.delete),
                        onTap: () async => await code.btnDeleteClicked(context),
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
