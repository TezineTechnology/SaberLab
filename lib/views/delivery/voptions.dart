import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saberlab_frontend_web/codes/logger.dart';
import 'package:saberlab_frontend_web/entities/restinpeace/edeliveryproductoption.dart';
import 'package:saberlab_frontend_web/themes/theme_default.dart';
import 'package:saberlab_frontend_web/views/delivery/voptions.code.dart';

class VOptions extends StatefulWidget {
  @override
  _VOptionsState createState() => _VOptionsState();
}

class _VOptionsState extends State<VOptions> {
  final _formKey = GlobalKey<FormState>();
  bool _loading = true;

  @override
  void initState() {
    super.initState();
  }

  void dispose() {
    print('(VOptions)dispose');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<VOptionsCode>(
      builder: (context, code, child) {
        return Scaffold(
            backgroundColor: ThemeDefault.colorBackground,
            appBar: AppBar(
              title: Text('Options'),
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

  Widget _buildLayout(BuildContext context, VOptionsCode code) {
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

  Widget _buildTable(BuildContext context, VOptionsCode code, { int sortColumnIndex = 0, bool sortAscending = true }) {
    Logger.logDebug(' reload');
    return FutureBuilder(
        future: code.getClients(),
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
                  label: Text('Internal name'),
                  tooltip: 'Internal name',
                ),
                DataColumn(
                  label: const Text('Name'),
                  tooltip: 'Name',
                  onSort: (int columnIndex, bool ascending) {
                    Logger.logDebug('column-sort: $columnIndex $ascending');
                  },
                ),
                const DataColumn(
                  label: Text('Value'),
                  tooltip: 'Value',
                ),
                DataColumn(label: Text('')),
                DataColumn(label: Text(''))
              ],
              rows: projectSnap.data.map<DataRow>((EDeliveryProductOption eOption) {
                return DataRow(
                  key: Key(eOption.id),
                  onSelectChanged: null,
                  cells: <DataCell>[
                    DataCell(
                      Text(eOption.internalName),
                    ),
                    DataCell(
                      Text('${eOption.name}'),
                    ),
                    DataCell(
                      Text(eOption.price.toString()),
                    ),
                    DataCell(
                      Icon(Icons.edit),
                      onTap: () => code.btnEditClicked(context, eOption.id),
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

