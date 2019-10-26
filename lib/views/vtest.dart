import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saberlab_frontend_web/codes/defines.dart';
import 'package:saberlab_frontend_web/entities/restinpeace/ebaseentity.dart';
import 'package:saberlab_frontend_web/themes/theme_default.dart';
import 'package:saberlab_frontend_web/views/vtest.code.dart';

class VTest extends StatefulWidget {
  @override
  _VTestState createState() => _VTestState();
}

class _VTestState extends State<VTest> {
  int _sortColumnIndex;
  bool _sortAscending = true;

  @override
  void initState() {//o initstate é executado apenas uma vez no widget
    print('(VTest)initState');
    super.initState();
    new Future.delayed(Duration.zero,() {
      final code = Provider.of<VTestCode>(context, listen: false);
      code.getClients();
    });
  }


  @override
  void didChangeDependencies() {
    print('(VTest)didChangeDependencies');
    super.didChangeDependencies();
  }

  void _sort<T>(VTestCode code, Comparable<T> getField(EBaseEntity d), int columnIndex, bool ascending) {
    code.sort<T>(getField, ascending);
    setState(() {
      _sortColumnIndex = columnIndex;
      _sortAscending = ascending;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeDefault.colorBackground,
      appBar: AppBar(
        title: const Text('Data tables'),
        actions: <Widget>[
          //MaterialDemoDocumentationButton(DataTableDemo.routeName),
        ],
      ),
      body: Scrollbar(
        child: ListView(
          padding: const EdgeInsets.all(20.0),
          children: <Widget>[
            Consumer<VTestCode>(
              builder: (context,code,child){
                return Visibility(
                  visible: true,
                  child: SizedBox(
                    width: double.infinity,
                    child: LinearProgressIndicator(),
                  ),
                );
              }
            ),
            Consumer<VTestCode>(
              builder: (context,code,child){
                return PaginatedDataTable(
                  header: const Text('Clients'),
                  rowsPerPage: code.rowsPerPage,
                  onPageChanged: (pageIndex)=>code.onPageChanged(pageIndex),
                  onRowsPerPageChanged: (int value) =>code.onRowsPerPageChanged(value),
                  sortColumnIndex: _sortColumnIndex,
                  sortAscending: _sortAscending,
                  onSelectAll: null,
                  source: code,
                  columns: <DataColumn>[
                    DataColumn(
                      label: const Text('Name'),
                      onSort: (int columnIndex, bool ascending) => _sort<String>(code,(EBaseEntity d) => d.name, columnIndex, ascending),
                    ),
                    DataColumn(
                      label: const Text('Email'),
                      tooltip: 'The total amount of food energy in the given serving size.',
                      onSort: (int columnIndex, bool ascending) => _sort<String>(code,(EBaseEntity d) => d.email, columnIndex, ascending),
                    ),
                  ],
                );
              }
            )
          ],
        ),
      ),
    );
  }
}
