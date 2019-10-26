import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saberlab_frontend_web/codes/logger.dart';
import 'package:saberlab_frontend_web/entities/restinpeace/edeliveryproduct.dart';
import 'package:saberlab_frontend_web/themes/theme_default.dart';
import 'package:saberlab_frontend_web/views/delivery/vproducts.code.dart';

class VProducts extends StatefulWidget {
  @override
  _VProductsState createState() => _VProductsState();
}

class _VProductsState extends State<VProducts> {
  final _formKey = GlobalKey<FormState>();
  bool _loading = true;

  @override
  void initState() {
    super.initState();
  }

  void dispose() {
    print('(VProducts)dispose');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<VProductsCode>(
      builder: (context, code, child) {
        return Scaffold(
            backgroundColor: ThemeDefault.colorBackground,
            appBar: AppBar(
              title: Text('Products'),
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

  Widget _buildLayout(BuildContext context, VProductsCode code) {
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

  Widget _buildTable(BuildContext context, VProductsCode code, { int sortColumnIndex = 0, bool sortAscending = true }) {
    Logger.logDebug(' reload');
    return FutureBuilder(
        future: code.getProducts(),
        builder: (context, projectSnap) {
          if (projectSnap.connectionState != ConnectionState.done)
            return Center(
              child: CircularProgressIndicator(),
            );
          else if (projectSnap.hasError) {
            return Text('Erro ao baixar produtos ${projectSnap.error}');
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
//                DataColumn(
//                  label: const Text('Category'),
//                  tooltip: 'Category',
//                  onSort: (int columnIndex, bool ascending) {
//                    Logger.logDebug('column-sort: $columnIndex $ascending');
//                  },
//                ),
//                const DataColumn(
//                  label: Text('Option group 1'),
//                  tooltip: 'Option group 1',
//                ),
//                const DataColumn(
//                  label: Text('Option group 2'),
//                  tooltip: 'Option group 2',
//                ),
//                const DataColumn(
//                  label: Text('Addon group 1'),
//                  tooltip: 'Addon group 1',
//                ),
//                const DataColumn(
//                  label: Text('Unit price'),
//                  tooltip: 'Unit price',
//                ),
//                DataColumn(label: Text('')),
//                DataColumn(label: Text(''))
              ],
              rows: projectSnap.data.map<DataRow>((EDeliveryProduct eProduct) {
                return DataRow(
                  key: Key(eProduct.id),
                  onSelectChanged: null,
                  cells: <DataCell>[
                    DataCell(
                      Text(eProduct.name),
                    ),
//                    DataCell(
//                      Text('${eProduct.categoryName}'),
//                    ),
//                    DataCell(
//                      Text(eProduct.option1ParentGroupName),
//                    ),
//                    DataCell(
//                      Text(eProduct.option2ParentGroupName),
//                    ),
//                    DataCell(
//                      Text(eProduct.addon1ParentGroupName),
//                    ),
//                    DataCell(
//                      Text(eProduct.unitPrice.toString()),
//                    ),
//                    DataCell(
//                      Icon(Icons.edit),
//                      onTap: () => code.btnEditClicked(context, eProduct.id),
//                    ),
//                    DataCell(
//                      Icon(Icons.delete),
//                      onTap: () async => await code.btnDeleteClicked(context),
//                    ),
                  ],
                );
              }).toList(),
            ),
          );
        }

    );
  }
}

