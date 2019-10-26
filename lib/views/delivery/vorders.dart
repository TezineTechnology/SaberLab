import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saberlab_frontend_web/codes/logger.dart';
import 'package:saberlab_frontend_web/entities/restinpeace/edeliveryorder.dart';
import 'package:saberlab_frontend_web/themes/theme_default.dart';
import 'package:saberlab_frontend_web/views/delivery/vorders.code.dart';

class VOrders extends StatefulWidget {
  @override
  _VOrdersState createState() => _VOrdersState();
}

class _VOrdersState extends State<VOrders> {
  final _formKey = GlobalKey<FormState>();
  bool _loading = true;

  @override
  void initState() {
    super.initState();
  }

  void dispose() {
    print('(VOrders)dispose');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<VOrdersCode>(
      builder: (context, code, child) {
        return Scaffold(
            backgroundColor: ThemeDefault.colorBackground,
            appBar: AppBar(
              title: Text('Orders'),
              actions: <Widget>[
                //                FlatButton.icon(
                //                    label: Text('Add'),
                //                    icon: const Icon(Icons.add),
                //                    onPressed: () async => await code.btnAddClicked(context)
                //                ),
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

  Widget _buildLayout(BuildContext context, VOrdersCode code) {
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

  Widget _buildTable(BuildContext context, VOrdersCode code, { int sortColumnIndex = 0, bool sortAscending = true }) {
    Logger.logDebug(' reload');
    return FutureBuilder(
        future: code.getOrders(),
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
                  label: Text('Client'),
                  tooltip: 'Client',
                ),
                DataColumn(
                  label: const Text('Date'),
                  tooltip: 'Date',
                  onSort: (int columnIndex, bool ascending) {
                    Logger.logDebug('column-sort: $columnIndex $ascending');
                  },
                ),
                const DataColumn(
                  label: Text('Total'),
                  tooltip: 'Total',
                ),
                const DataColumn(
                  label: Text('Status'),
                  tooltip: 'Status',
                ),
                DataColumn(label: Text('')),
                DataColumn(label: Text(''))
              ],
              rows: projectSnap.data.map<DataRow>((EDeliveryOrder eBaseEntity) {
                return DataRow(
                  key: Key('1'),
                  onSelectChanged: null,
                  cells: <DataCell>[
                    DataCell(
                      Text('client' ),
                    ),
                    DataCell(
                      Text('date' ),
                    ),
                    DataCell(
                      Text('total' ),
                    ),
                    DataCell(
                      Text('status' ),
                    ),
                    DataCell(
                      Icon(Icons.edit),
                      onTap: () => code.btnEditClicked(context, '1'),
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

