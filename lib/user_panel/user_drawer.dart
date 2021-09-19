import 'package:flutter/material.dart';
import 'package:smart_electricity_manager/adminpanel/admin_panel.dart';

import '../widgets/drawer/drawer_header.dart';
import '../widgets/drawer/custom_item.dart';
import '../widgets/drawer/item_divider.dart';
import '../user_panel/user_panel.dart';
import '../login/login.dart';
import '../change_password/change_password.dart';

class UserDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHead(),
          Divider(
            height: 1,
            thickness: 1,
          ),
          CustomItem("Home", Icons.home, moveTo: UserPanel(),),
          ItemDivider(),
          CustomItem("Change Password", Icons.change_history_outlined,  moveTo: ChangePassword(AdminPanel())),
          ItemDivider(),
          CustomItem("Logout", Icons.logout, moveTo: Login()),
          ItemDivider(),
        ],
      ),
    );
  }
}
