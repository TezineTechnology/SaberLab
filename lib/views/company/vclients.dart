import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saberlab_frontend_web/codes/logger.dart';
import 'package:saberlab_frontend_web/entities/restinpeace/ebaseentity.dart';
import 'package:saberlab_frontend_web/themes/theme_default.dart';
import 'package:saberlab_frontend_web/views/company/vclients.code.dart';

class VClients extends StatefulWidget {
  @override
  _VClientsState createState() => _VClientsState();
}

class _VClientsState extends State<VClients> {
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  void dispose() {
    print('(VClients)dispose');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<VClientsCode>(
      builder: (context, code, child) {
        return Scaffold(
            backgroundColor: ThemeDefault.colorBackground,
            appBar: AppBar(
              title: Text('Clients'),
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

  Widget _buildLayout(BuildContext context, VClientsCode code) {
    final newCode = Provider.of<VClientsCode>(context, listen: false);
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20),
      child: Card(
        child: Container(
            padding: EdgeInsets.all(20),
            child: FutureProvider<List<EBaseEntity>>(
                builder: (context) async {
                  return newCode.getClients();
                },
                catchError: null,
                child: Form(
                  key: _formKey,
                  child: _buildTable(context, code),
                )
            )
        ),
      ),
    );
  }

  Widget _buildTable(BuildContext context, VClientsCode code, { int sortColumnIndex = 0, bool sortAscending = true }) {
    Logger.logDebug('(VClients)buildTable');
    return SizedBox(
      width: double.infinity,
      child: DataTable(
//        header: const Text('Nutrition'),
//        rowsPerPage: 10,
//        onRowsPerPageChanged: (int value) { },
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
          const DataColumn(
            label: Text('Last access'),
            tooltip: 'Last access',
          ),
          DataColumn(label: Text('')),
          DataColumn(label: Text(''))
        ],
        rows: code.clientsList.map<DataRow>((EBaseEntity eBaseEntity) {
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
                Text(eBaseEntity.lastAccessUTC.toLocal().toString()),
              ),
              DataCell(
                Icon(Icons.edit),
                onTap: () => code.btnEditClicked(context, eBaseEntity.id),
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
}
