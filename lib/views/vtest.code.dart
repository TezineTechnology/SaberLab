
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:saberlab_frontend_web/codes/defines.dart';
import 'package:saberlab_frontend_web/entities/restinpeace/ebaseentity.dart';
import 'package:saberlab_frontend_web/services/restinpeace/companiesclients_service.dart';

class VTestCode extends DataTableSource{
  int currentPageNumber=0;
  bool loading=false;
  int rowsPerPage=Defines.rowsPerPage;
  List<EBaseEntity> _entityList = List<EBaseEntity>();

  ClientsDataSource() {
    print('(ClientsDataSource)constructor');
    //getClients(0,Defines.rowsPerPage);
  }

  getClients({bool upperPageNumber=false})async{
    if(upperPageNumber && (_entityList.length>((currentPageNumber)*rowsPerPage))){
      print('retornando do cache');
      return;
    }
    loading=true;
    var list= await CompaniesClientsService.getAll(Defines.currentCompanyID,listCount: rowsPerPage,pageNumber: currentPageNumber);
    loading=false;
    if(!upperPageNumber)_entityList=list;
    else _entityList.addAll(list);
    print('(ClientsDataSource)getClients: ${_entityList.length}. Page number :${currentPageNumber}. RowsPerPage: ${rowsPerPage}');
    notifyListeners();
  }

  void sort<T>(Comparable<T> getField(EBaseEntity d), bool ascending) {
    _entityList.sort((EBaseEntity a, EBaseEntity b) {
      if (!ascending) {
        final EBaseEntity c = a;
        a = b;
        b = c;
      }
      final Comparable<T> aValue = getField(a);
      final Comparable<T> bValue = getField(b);
      return Comparable.compare(aValue, bValue);
    });
    notifyListeners();
  }

  void onPageChanged(int currentRow){
    int newPageNumber;
    if(currentRow<rowsPerPage)newPageNumber=0;
    else newPageNumber=(currentRow+1)%rowsPerPage;
    print('current row $currentRow');
    print('page $newPageNumber');
    if(newPageNumber>currentPageNumber) {
      currentPageNumber = newPageNumber;
      getClients(upperPageNumber: true);
    }else currentPageNumber=newPageNumber;
  }

  @override
  DataRow getRow(int index) {
    assert(index >= 0);
    if (index >= _entityList.length) return null;
    final EBaseEntity dessert = _entityList[index];
    return DataRow.byIndex(
      index: index,
      selected: false,
      onSelectChanged: null,
      cells: <DataCell>[
        DataCell(Text('${dessert.name}')),
        DataCell(Text('${dessert.email}')),
      ],
    );
  }

  onRowsPerPageChanged(int rowsPerPage){
    print('(VTestCode)onRowsPerPageChanged: $rowsPerPage');
    this.rowsPerPage=rowsPerPage;
    getClients();
  }

  @override
  int get rowCount {
    if(_entityList.length==0)return 0;
    else return _entityList.elementAt(0).totalListCount;
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;
}
