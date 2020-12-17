import 'package:flutter/material.dart';
import 'package:nav_test/app_state/app_state.dart';
import 'package:nav_test/nav_drawer/menu_item.dart';
import 'package:nav_test/pages/settings_page.dart';
import 'package:nav_test/pages/sidebar_home.dart';
import 'package:nav_test/pages/sidebar_logout.dart';
import 'package:nav_test/pages/sidebar_my_account.dart';
import 'package:nav_test/pages/sidebar_shop.dart';
import 'package:provider/provider.dart';

class AppDrawerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary
        ),
        child: ListView(
          children: [
            _drawerHeader(),
            NavBarItemList(icon: Icons.home, title: 'Home', onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => SidebarHomePage()
              ));
            },),
            NavBarItemList(icon: Icons.person_outline, title: 'My Account', onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => SidebarMyAccountPage()
              ));
            }),
            NavBarItemList(icon: Icons.shopping_cart, title: 'My Shop', onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => SidebarShopPage()
              ));
            }),
            Divider(thickness: 0.6, color: Colors.grey, indent: 10, endIndent: 10,),
            NavBarItemList(icon: Icons.settings, title: 'Settings', onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => SettingPage()
              ));
            }),
            NavBarItemList(icon: Icons.exit_to_app, title:'Logout',  onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => SidebarLogoutPage()
              ));
            }),

          ],
        ),
      ),
    );
  }

  Widget _drawerHeader() {
    return UserAccountsDrawerHeader(
      accountName: Text('Sithu Lwin',
        style: TextStyle(color: Colors.white, fontSize: 20.0,),),
      accountEmail: Text('lwin10415@gmail.com',
        style: TextStyle(color: Colors.white),),
      decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage('assets/images/Inlay_3.jpg',),
        fit: BoxFit.cover
      ),
      ),
    );
  }
}
