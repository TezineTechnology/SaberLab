import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saberlab_frontend_web/codes/logger.dart';
import 'package:saberlab_frontend_web/entities/restinpeace/edashboard.dart';
import 'package:saberlab_frontend_web/themes/theme_default.dart';
import 'package:saberlab_frontend_web/views/company/vdashboard.code.dart';
import 'package:saberlab_frontend_web/views/vleftmenu.dart';

class VDashboard extends StatefulWidget {
  @override
  _VDashboardState createState() => _VDashboardState();
}

class _VDashboardState extends State<VDashboard> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final code = Provider.of<VDashboardCode>(context, listen: false);
    return Scaffold(
        backgroundColor: Colors.blueGrey[100],
        appBar: AppBar(
          title: Text('SaberLab'),
        ),
        drawer: VLeftMenu.getDrawer(context),
        body: FutureProvider<EDashboard>(
            builder: (context) async {
              return await code.getDashboard();
            },
            catchError: (context, error) {
              print(error);
              return null;
            },
            child: Form(
              key: _formKey,
              child: _buildLayout(context),
            )
        )
    );
  }

  Widget _buildLayout(BuildContext context) {
    Logger.logDebug('(VDashboard)buildLayout');
    return Column(
      children: <Widget>[
        Consumer<VDashboardCode>(
            builder: (context, code, child) {
              return Visibility(
                visible: code.loading,
                child: SizedBox(
                  width: double.infinity,
                  child: LinearProgressIndicator(),
                ),
              );
            }),
        _buildGridView(context)
      ],
    );
  }

  Widget _buildGridView(BuildContext context) {
    return
      Consumer<VDashboardCode>(
          builder: (context, code, child) {
            return Expanded(
                child: GridView.count(
                    primary: false,
                    shrinkWrap: true,
                    padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                    crossAxisCount: 3,
                    mainAxisSpacing: 6,
                    childAspectRatio: 3.5,
                    crossAxisSpacing: 6,
                    children: <Widget>[
                      Card(
                        child: Container(
                            child: _getCard('Clients', Icons.people, code.eDashboard.clients)
                        ),
                      ),
                      Card(
                          child: Container(
                              child: _getCard('Bills to pay', Icons.money_off, code.eDashboard.billsToPay)
                          )
                      ),
                      Card(
                        child: Container(
                            child: _getCard('Bills to receive', Icons.attach_money, code.eDashboard.billsToReceive)
                        ),
                      ),
                      Card(
                        child: Container(
                            child: _getCard('Suppliers', Icons.business, code.eDashboard.suppliers)
                        ),
                      ),
                      Card(
                        child: Container(
                            child: _getCard('Employees', Icons.people_outline, code.eDashboard.employees)
                        ),
                      ),
                      Card(
                        child: Container(
                            child: _getCard('Proposals', Icons.view_headline, code.eDashboard.proposals)
                        ),
                      ),
                      Card(
                        child: Container(
                            child: _getCard('Orders', Icons.shopping_cart, code.eDashboard.orders)
                        ),
                      ),
                      Card(
                        child: Container(
                            child: _getCard('Products', Icons.store, code.eDashboard.products)
                        ),
                      ),
                      Card(
                          child: _getCard('Categories', Icons.gradient, code.eDashboard.categories)
                      )
                    ]
                )
            );
          }
      );
  }

  Widget _getCard(String title, IconData iconData, int count) {
    return Container(
        padding: EdgeInsets.only(left: 20, top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(title, style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),),
            ListTile(
              leading: Icon(iconData),
              title: Text(count.toString()),
            ),
            // Text(count.toString())
          ],
        )
    );
  }

}

