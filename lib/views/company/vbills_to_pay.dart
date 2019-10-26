import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saberlab_frontend_web/codes/logger.dart';
import 'package:saberlab_frontend_web/entities/restinpeace/ecompanybilltopay.dart';
import 'package:saberlab_frontend_web/themes/theme_default.dart';
import 'package:saberlab_frontend_web/views/company/vbills_to_pay.code.dart';

class VBillsToPay extends StatefulWidget {
  @override
  _VBillsToPayState createState() => _VBillsToPayState();
}

class _VBillsToPayState extends State<VBillsToPay> {
  final _formKey = GlobalKey<FormState>();
  bool _loading = true;

  @override
  void initState() {
    super.initState();
  }

  void dispose() {
    print('(VBillsToPay)dispose');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<VBillsToPayCode>(
      builder: (context, code, child) {
        return Scaffold(
            backgroundColor: ThemeDefault.colorBackground,
            appBar: AppBar(
              title: Text('Bills to pay'),
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

  Widget _buildLayout(BuildContext context, VBillsToPayCode code) {
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

  Widget _buildTable(BuildContext context, VBillsToPayCode code, { int sortColumnIndex = 0, bool sortAscending = true }) {
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
                    label: const Text('To'),
                    tooltip: 'To',
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
                rows: projectSnap.data.map<DataRow>((ECompanyBillToPay eBillToPay) {
                  return DataRow(
                    key: Key(eBillToPay.id),
                    onSelectChanged: null,
                    cells: <DataCell>[
                      DataCell(
                        Text(eBillToPay.description),
                      ),
                      DataCell(
                        Text('${eBillToPay.toEntityID}'),
                      ),
                      DataCell(
                        Text(eBillToPay.totalPaid.toString()),
                      ),
                      DataCell(
                        Icon(Icons.edit),
                        onTap: () => code.btnEditClicked(context,eBillToPay.id),
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

