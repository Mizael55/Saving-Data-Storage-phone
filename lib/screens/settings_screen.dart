import 'package:flutter/material.dart';
import 'package:preferences_app/provider/theme.provider.dart';
import 'package:preferences_app/share_preferences.dart/preferences.dart';
import 'package:preferences_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  static const String routeName = 'settings';

  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {

  // bool isDarkMode = false;
  // int genero = 1;
  // String nombre = 'Mizael';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings Screen'),
      ),
      drawer: const SideMenu(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Ajustes',
                  style: TextStyle(fontSize: 45, fontWeight: FontWeight.w300)),
              const Divider(),
              SwitchListTile.adaptive(
                  value: Preferences.isDarkMode,
                  title: const Text('Darkmode'),
                  onChanged: (v) {
                    setState(() {
                      Preferences.isDarkMode = v;
                      final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
                      v ? themeProvider.setDarkMode() : themeProvider.setLightMode();
                    });
                  }),
              const Divider(),
              RadioListTile<int>(
                  value: 1,
                  title: const Text('Masculino'),
                  groupValue: Preferences.genero,
                  onChanged: (v) {
                    setState(() {
                      Preferences.genero = v ?? 1;
                    });
                  }),
              const Divider(),
              RadioListTile<int>(
                  value: 2,
                  title: const Text('Femenino'),
                  groupValue: Preferences.genero,
                  onChanged: (v) {
                    setState(() {
                      Preferences.genero = v ?? 1;
                    });
                  }),
              const Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  initialValue: Preferences.name,
                  onChanged: (v) {
                    setState(() {
                      Preferences.name = v;
                    });
                  },
                  decoration: const InputDecoration(
                      helperText: 'Nombre de usuario', labelText: 'Nombre'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
