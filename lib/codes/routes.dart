
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saberlab_frontend_web/views/company/vbills_to_pay.code.dart';
import 'package:saberlab_frontend_web/views/company/vbills_to_pay.dart';
import 'package:saberlab_frontend_web/views/company/vbills_to_pay_edit.code.dart';
import 'package:saberlab_frontend_web/views/company/vbills_to_pay_edit.dart';
import 'package:saberlab_frontend_web/views/company/vbills_to_receive.code.dart';
import 'package:saberlab_frontend_web/views/company/vbills_to_receive.dart';
import 'package:saberlab_frontend_web/views/company/vbills_to_receive_edit.code.dart';
import 'package:saberlab_frontend_web/views/company/vbills_to_receive_edit.dart';
import 'package:saberlab_frontend_web/views/company/vclients.code.dart';
import 'package:saberlab_frontend_web/views/company/vclients.dart';
import 'package:saberlab_frontend_web/views/company/vclients_edit.code.dart';
import 'package:saberlab_frontend_web/views/company/vclients_edit.dart';
import 'package:saberlab_frontend_web/views/company/vconfig.code.dart';
import 'package:saberlab_frontend_web/views/company/vconfig.dart';
import 'package:saberlab_frontend_web/views/company/vdashboard.code.dart';
import 'package:saberlab_frontend_web/views/company/vdashboard.dart';
import 'package:saberlab_frontend_web/views/company/vemployees.code.dart';
import 'package:saberlab_frontend_web/views/company/vemployees.dart';
import 'package:saberlab_frontend_web/views/company/vemployees_edit.code.dart';
import 'package:saberlab_frontend_web/views/company/vemployees_edit.dart';
import 'package:saberlab_frontend_web/views/company/vmodules.code.dart';
import 'package:saberlab_frontend_web/views/company/vmodules.dart';
import 'package:saberlab_frontend_web/views/company/vproposals.code.dart';
import 'package:saberlab_frontend_web/views/company/vproposals.dart';
import 'package:saberlab_frontend_web/views/company/vproposals_edit.code.dart';
import 'package:saberlab_frontend_web/views/company/vproposals_edit.dart';
import 'package:saberlab_frontend_web/views/company/vsuppliers.code.dart';
import 'package:saberlab_frontend_web/views/company/vsuppliers.dart';
import 'package:saberlab_frontend_web/views/company/vsuppliers_edit.code.dart';
import 'package:saberlab_frontend_web/views/company/vsuppliers_edit.dart';
import 'package:saberlab_frontend_web/views/delivery/vaddons.code.dart';
import 'package:saberlab_frontend_web/views/delivery/vaddons.dart';
import 'package:saberlab_frontend_web/views/delivery/vaddons_edit.code.dart';
import 'package:saberlab_frontend_web/views/delivery/vaddons_edit.dart';
import 'package:saberlab_frontend_web/views/delivery/vcategories.code.dart';
import 'package:saberlab_frontend_web/views/delivery/vcategories.dart';
import 'package:saberlab_frontend_web/views/delivery/vcategories_edit.code.dart';
import 'package:saberlab_frontend_web/views/delivery/vcategories_edit.dart';
import 'package:saberlab_frontend_web/views/delivery/voptions.code.dart';
import 'package:saberlab_frontend_web/views/delivery/voptions.dart';
import 'package:saberlab_frontend_web/views/delivery/voptions_edit.code.dart';
import 'package:saberlab_frontend_web/views/delivery/voptions_edit.dart';
import 'package:saberlab_frontend_web/views/delivery/vorders.code.dart';
import 'package:saberlab_frontend_web/views/delivery/vorders.dart';
import 'package:saberlab_frontend_web/views/delivery/vorders_edit.code.dart';
import 'package:saberlab_frontend_web/views/delivery/vorders_edit.dart';
import 'package:saberlab_frontend_web/views/delivery/vproducts.code.dart';
import 'package:saberlab_frontend_web/views/delivery/vproducts.dart';
import 'package:saberlab_frontend_web/views/delivery/vproducts_edit.code.dart';
import 'package:saberlab_frontend_web/views/delivery/vproducts_edit.dart';
import 'package:saberlab_frontend_web/views/vlogin.code.dart';
import 'package:saberlab_frontend_web/views/vlogin.dart';
import 'package:saberlab_frontend_web/views/vtest.code.dart';
import 'package:saberlab_frontend_web/views/vtest.dart';

class Routes {
  static const root = "/";
  static const login = "/Login";
  static const companyDashboard = "/CompanyDashboard";
  static const companyModules = "/CompanyModules";
  static const companyBillsToPay='/CompanyBillsToPay';
  static const companyBillsToPayEdit='/CompanyBillsToPayEdit';
  static const companyBillsToReceive='/CompanyBillsToReceive';
  static const companyBillsToReceiveEdit='/CompanyBillsToReceiveEdit';
  static const companyClients='/CompanyClients';
  static const companyClientsEdit='/CompanyClientsEdit';
  static const companySuppliers='/CompanySuppliers';
  static const companySuppliersEdit='/CompanySuppliersEdit';
  static const companyProposals='/CompanyProposals';
  static const companyProposalsEdit='/CompanyProposalsEdit';
  static const companyEmployees='/CompanyEmployees';
  static const companyEmployeesEdit='/CompanyEmployeesEdit';
  static const config='/Config';
  static const deliveryOrders='/DeliveryOrders';
  static const deliveryOrdersEdit='/DeliveryOrdersEdit';
  static const deliveryProducts='/DeliveryProducts';
  static const deliveryProductsEdit='/DeliveryProductsEdit';
  static const deliveryProductAddons='/DeliveryAddons';
  static const deliveryProductAddonsEdit='/DeliveryAddonsEdit';
  static const deliveryProductOptions='/DeliveryProductOptions';
  static const deliveryProductOptionsEdit='/DeliveryProductOptionsEdit';
  static const deliveryCategories='/DeliveryCategories';
  static const deliveryCategoriesEdit='/DeliveryCategoriesEdit';
  static const test='/Test';

  static  getRoute(RouteSettings settings) {
    switch(settings.name){
      case Routes.root:
        return _buildRoute(settings, new VLogin());
      case Routes.companyDashboard:
        return _buildRoute(settings, new VDashboard());
      case Routes.companyClients:
        return _buildRoute(settings, new VClients());
      case Routes.companyClientsEdit:
        return _buildRoute(settings, new VClientsEdit());
      case Routes.config:
        return _buildRoute(settings, new VConfig());
      case Routes.companyBillsToPay:
        return _buildRoute(settings, new VBillsToPay());
      case Routes.companyBillsToPayEdit:
        return _buildRoute(settings, new VBillsToPayEdit());
      case Routes.deliveryProducts:
        return _buildRoute(settings, new VProducts());
      case Routes.test:
        return _buildRoute(settings, new VTest());
      default:
        return null;
    }

//    return <String, WidgetBuilder>{
//      Routes.root: (BuildContext context) => VLogin(),
//      Routes.login: (BuildContext context) => VLogin(),
//      Routes.companyDashboard: (BuildContext context) => VDashboard(),
//      Routes.companyModules: (BuildContext context) => VModules(),
//      Routes.companyClients: (BuildContext context) => VClients(),
//      Routes.companyClientsEdit: (BuildContext context) => VClientsEdit(),
//      Routes.companyBillsToPay: (BuildContext context) => VBillsToPay(),
//      Routes.companyBillsToPayEdit: (BuildContext context) => VBillsToPayEdit(),
//      Routes.companyBillsToReceive: (BuildContext context) => VBillsToReceive(),
//      Routes.companyBillsToReceiveEdit: (BuildContext context) => VBillsToReceiveEdit(),
//      Routes.companySuppliers: (BuildContext context) => VSuppliers(),
//      Routes.companySuppliersEdit: (BuildContext context) => VSuppliersEdit(),
//      Routes.companyProposals: (BuildContext context) => VProposals(),
//      Routes.companyProposalsEdit: (BuildContext context) => VProposalsEdit(),
//      Routes.companyEmployees: (BuildContext context) => VEmployees(),
//      Routes.companyEmployeesEdit: (BuildContext context) => VEmployeesEdit(),
//      Routes.config: (BuildContext context) => VConfig(),
//
//      Routes.deliveryOrders: (BuildContext context) => VOrders(),
//      Routes.deliveryOrdersEdit: (BuildContext context) => VOrdersEdit(),
//      Routes.deliveryProducts: (BuildContext context) => VProducts(),
//      Routes.deliveryProductsEdit: (BuildContext context) => VProductsEdit(),
//      Routes.deliveryProductOptions: (BuildContext context) => VOptions(),
//      Routes.deliveryProductOptionsEdit: (BuildContext context) => VOptionsEdit(),
//      Routes.deliveryProductAddons: (BuildContext context) => VAddons(),
//      Routes.deliveryProductAddonsEdit: (BuildContext context) => VAddonsEdit(),
//      Routes.deliveryCategories: (BuildContext context) => VCategories(),
//      Routes.deliveryCategoriesEdit: (BuildContext context) => VCategoriesEdit(),
//    };
  }

  static MaterialPageRoute _buildRoute(RouteSettings settings, Widget builder){
    return new MaterialPageRoute(
      settings: settings,
      builder: (BuildContext context) => builder,
    );
  }



  static List<SingleChildCloneableWidget> getProviders() {
    return [
      ChangeNotifierProvider<VTestCode>(builder: (context) => VTestCode(),),
      ChangeNotifierProvider<VLoginCode>(builder: (context) => VLoginCode(),),
      ChangeNotifierProvider<VDashboardCode>(builder: (context) => VDashboardCode(),),
      ChangeNotifierProvider<VModulesCode>(builder: (context) => VModulesCode(),),
      ChangeNotifierProvider<VConfigCode>(builder: (context) => VConfigCode(),),

      ChangeNotifierProvider<VClientsCode>(builder: (context) => VClientsCode(),),
      ChangeNotifierProvider<VClientsEditCode>(builder: (context) => VClientsEditCode(),),

      ChangeNotifierProvider<VBillsToPayCode>(builder: (context) => VBillsToPayCode(),),
      ChangeNotifierProvider<VBillsToPayEditCode>(builder: (context) => VBillsToPayEditCode(),),

      ChangeNotifierProvider<VBillsToReceiveCode>(builder: (context) => VBillsToReceiveCode(),),
      ChangeNotifierProvider<VBillsToReceiveEditCode>(builder: (context) => VBillsToReceiveEditCode(),),

      ChangeNotifierProvider<VEmployeesCode>(builder: (context) => VEmployeesCode(),),
      ChangeNotifierProvider<VEmployeesEditCode>(builder: (context) => VEmployeesEditCode(),),

      ChangeNotifierProvider<VProposalsCode>(builder: (context) => VProposalsCode(),),
      ChangeNotifierProvider<VProposalsEditCode>(builder: (context) => VProposalsEditCode(),),

      ChangeNotifierProvider<VSuppliersCode>(builder: (context) => VSuppliersCode(),),
      ChangeNotifierProvider<VSuppliersEditCode>(builder: (context) => VSuppliersEditCode(),),

      ChangeNotifierProvider<VOrdersCode>(builder: (context) => VOrdersCode(),),
      ChangeNotifierProvider<VOrdersEditCode>(builder: (context) => VOrdersEditCode(),),

      ChangeNotifierProvider<VProductsCode>(builder: (context) => VProductsCode(),),
      ChangeNotifierProvider<VProductsEditCode>(builder: (context) => VProductsEditCode(),),

      ChangeNotifierProvider<VCategoriesCode>(builder: (context) => VCategoriesCode(),),
      ChangeNotifierProvider<VCategoriesEditCode>(builder: (context) => VCategoriesEditCode(),),

      ChangeNotifierProvider<VOptionsCode>(builder: (context) => VOptionsCode(),),
      ChangeNotifierProvider<VOptionsEditCode>(builder: (context) => VOptionsEditCode(),),

      ChangeNotifierProvider<VAddonsCode>(builder: (context) => VAddonsCode(),),
      ChangeNotifierProvider<VAddonsEditCode>(builder: (context) => VAddonsEditCode(),),

    ];
  }
}

