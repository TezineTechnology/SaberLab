
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saberlab_frontend_web/codes/logger.dart';
import 'package:saberlab_frontend_web/entities/restinpeace/ecompanyproposal.dart';
import 'package:saberlab_frontend_web/themes/theme_default.dart';
import 'package:saberlab_frontend_web/views/company/vproposals.code.dart';

class VProposals extends StatefulWidget {
  @override
  _VProposalsState createState() => _VProposalsState();
}

class _VProposalsState extends State<VProposals> {
  final _formKey = GlobalKey<FormState>();
  bool _loading = true;

  @override
  void initState() {
    super.initState();
  }

  void dispose() {
    print('(VProposals)dispose');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<VProposalsCode>(
      builder: (context, code, child) {
        return Scaffold(
            backgroundColor: ThemeDefault.colorBackground,
            appBar: AppBar(
              title: Text('Proposals'),
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

  Widget _buildLayout(BuildContext context, VProposalsCode code) {
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

  Widget _buildTable(BuildContext context, VProposalsCode code, { int sortColumnIndex = 0, bool sortAscending = true }) {
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
                    label: Text('Client'),
                    tooltip: 'Client',
                  ),
                  DataColumn(
                    label: const Text('Title'),
                    tooltip: 'Title',
                    onSort: (int columnIndex, bool ascending) {
                      Logger.logDebug('column-sort: $columnIndex $ascending');
                    },
                  ),
                  const DataColumn(
                    label: Text('Issue date'),
                    tooltip: 'Issue date',
                  ),
                  const DataColumn(
                    label: Text('Total'),
                    tooltip: 'Total',
                  ),
                  DataColumn(label: Text('')),
                  DataColumn(label: Text(''))
                ],
                rows: projectSnap.data.map<DataRow>((ECompanyProposal eProposal) {
                  return DataRow(
                    key: Key(eProposal.id),
                    onSelectChanged: null,
                    cells: <DataCell>[
                      DataCell(
                        Text(eProposal.toEntityID),
                      ),
                      DataCell(
                        Text('${eProposal.title}'),
                      ),
                      DataCell(
                        Text(eProposal.issueDate.toString()),
                      ),
                      DataCell(
                        Text(eProposal.total.toString()),
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
