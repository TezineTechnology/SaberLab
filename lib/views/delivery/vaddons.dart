
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saberlab_frontend_web/codes/logger.dart';
import 'package:saberlab_frontend_web/entities/restinpeace/edeliveryproductaddon.dart';
import 'package:saberlab_frontend_web/themes/theme_default.dart';
import 'package:saberlab_frontend_web/views/delivery/vaddons.code.dart';

class VAddons extends StatefulWidget {
  @override
  _VAddonsState createState() => _VAddonsState();
}

class _VAddonsState extends State<VAddons> {
  final _formKey = GlobalKey<FormState>();
  bool _loading = true;

  @override
  void initState() {
    super.initState();
  }

  void dispose() {
    print('(VAddons)dispose');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<VAddonsCode>(
      builder: (context, code, child) {
        return Scaffold(
            backgroundColor: ThemeDefault.colorBackground,
            appBar: AppBar(
              title: Text('Addons'),
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

  Widget _buildLayout(BuildContext context, VAddonsCode code) {
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

  Widget _buildTable(BuildContext context, VAddonsCode code, { int sortColumnIndex = 0, bool sortAscending = true }) {
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
              rows: projectSnap.data.map<DataRow>((EDeliveryProductAddon eAddon) {
                return DataRow(
                  key: Key(eAddon.id),
                  onSelectChanged: null,
                  cells: <DataCell>[
                    DataCell(
                      Text(eAddon.name),
                    ),
                    DataCell(
                      Text('${eAddon.internalName}'),
                    ),
                    DataCell(
                      Text(eAddon.name),
                    ),
                    DataCell(
                      Text(eAddon.price.toString()),
                    ),
                    DataCell(
                      Icon(Icons.edit),
                      onTap: () => code.btnEditClicked(context, eAddon.id),
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

