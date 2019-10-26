
import 'package:flutter/material.dart';
import 'package:saberlab_frontend_web/codes/routes.dart';
import 'package:saberlab_frontend_web/themes/theme_default.dart';

class VLeftMenu {

  static Widget getDrawer(BuildContext context) {
    List<Widget> listItems = new List();
    listItems.add(
        DrawerHeader(
          child: Center(
              child: Text('SaberLab',
                style: TextStyle(color: Colors.white, fontSize: 23),)
          ),
          decoration: BoxDecoration(
            color: ThemeDefault.colorSaberLab,
          ),
        )
    );
    _addItemToList(context, 'Dashboard', Routes.companyDashboard, Icons.dashboard, listItems);
    _addItemToList(context, 'Modules', Routes.companyModules, Icons.view_module, listItems);

    _addItemToList(context, 'Clients', Routes.companyClients, Icons.people, listItems);
    _addItemToList(context, 'Bills to pay', Routes.companyBillsToPay, Icons.money_off, listItems);
    _addItemToList(context, 'Bills to receive', Routes.companyBillsToReceive, Icons.attach_money, listItems);
    _addItemToList(context, 'Suppliers', Routes.companySuppliers, Icons.business, listItems);
    _addItemToList(context, 'Employees', Routes.companyEmployees, Icons.people_outline, listItems);
    _addItemToList(context, 'Proposals', Routes.companyProposals, Icons.view_headline, listItems);
    _addItemToList(context, 'Config', Routes.config, Icons.settings, listItems);

    _addItemToList(context, 'Orders', Routes.deliveryOrders, Icons.shopping_cart, listItems);
    _addItemToList(context, 'Products', Routes.deliveryProducts, Icons.store, listItems);
    _addItemToList(context, 'Categories', Routes.deliveryCategories, Icons.gradient, listItems);
    _addItemToList(context, 'Options', Routes.deliveryProductOptions, Icons.style, listItems);
    _addItemToList(context, 'Addons', Routes.deliveryProductAddons, Icons.filter_vintage, listItems);

    var drawer = Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: listItems
      ),
    );

    return drawer;
  }


  static void _addItemToList(BuildContext context, String txt, String route, IconData iconData, List<Widget> list) {
    var tile = ListTile(
      leading: Icon(iconData),
      title: Text(txt, style: TextStyle(fontFamily: "Arial"),),
      onTap: () => Navigator.of(context).pushNamed(route),
    );
    list.add(tile);
  }
}