import 'package:flutter/material.dart';
import 'package:preferences_app/share_preferences.dart/preferences.dart';

import '../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {

  static const String routeName = 'home';
   
  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      drawer: const SideMenu(),
      body:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          Text('isDarkMode: ${Preferences.isDarkMode}'),
          const Divider(),
          Text('Genero: ${Preferences.genero}'),
          const Divider(),
          Text('Nombre de usuario: ${Preferences.name}'),
          const Divider(),
        ],),
    );
  }
}