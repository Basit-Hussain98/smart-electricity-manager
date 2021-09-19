import 'package:flutter/material.dart';
import 'package:smart_electricity_manager/adminpanel/admin_panel.dart';

import 'drawer_header.dart';
import 'custom_item.dart';
import 'item_divider.dart';
import '../../adminpanel/admin_panel.dart';
import '../../login/login.dart';
import '../../add_user/add_user.dart';
import '../../change_password/change_password.dart';
import '../../remove_user/remove_user.dart';

class CustomDrawer extends StatelessWidget {
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
          CustomItem("Home", Icons.home, moveTo: AdminPanel(),),
          ItemDivider(),
          CustomItem("Add User", Icons.add_circle_outline, moveTo: AddUser()),
          ItemDivider(),
          CustomItem("Remove User", Icons.remove_circle_outline, moveTo: RemoveUser(),),
          ItemDivider(),
          CustomItem("Change Password", Icons.change_history_outlined, moveTo: ChangePassword(AdminPanel()),),
          ItemDivider(),
          CustomItem("Logout", Icons.logout, moveTo: Login()),
          ItemDivider(),
        ],
      ),
    );
  }
}
