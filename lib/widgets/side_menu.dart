import 'package:flutter/material.dart';
import '../screens/screens.dart';

class SideMenu extends StatelessWidget {
   
  const SideMenu({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children:   <Widget>[
           _DrawerHeader(),
           ListTile(
            leading: const Icon(Icons.pages_outlined),
            title: const Text('Home'),
            onTap: (){
              Navigator.pushReplacementNamed(context, HomeScreen.routeName);
            }
          ),
          const ListTile(
            leading: Icon(Icons.people_outlined),
            title: Text('People'),
            onTap: null,
          ),
          ListTile(
            leading: const Icon(Icons.party_mode_outlined),
            title: const Text('Settings'),
            onTap: (){
              Navigator.pushReplacementNamed(context, SettingsScreen.routeName);
            }
          ),
        ],
      ),
    );
  }
}

class _DrawerHeader extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/menu-img.jpg'),
          fit: BoxFit.cover
        )
      ),
      child: Container()
    );
  }
}