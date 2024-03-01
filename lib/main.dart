import 'package:flutter/material.dart';
import 'package:preferences_app/provider/theme.provider.dart';
import 'package:provider/provider.dart';
import 'screens/screens.dart';
import 'share_preferences.dart/preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Preferences.init();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
        create: (_) => ThemeProvider(isDarkMode: Preferences.isDarkMode)),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Share Preferences',
        initialRoute: HomeScreen.routeName,
        routes: {
          HomeScreen.routeName: (context) => const HomeScreen(),
          SettingsScreen.routeName: (context) => const SettingsScreen(),
        },
        theme: Provider.of<ThemeProvider>(context).currentTheme == ThemeMode.light
            ? ThemeData.light().copyWith(
                appBarTheme: const AppBarTheme(
                  color: Colors.blue,
                ),)
            : ThemeData.dark(),
        );
  }
}
