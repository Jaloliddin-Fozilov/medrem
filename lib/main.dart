import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'provider/categories_provider.dart';
import 'provider/dieases_provider.dart';
import 'provider/notifications_provider.dart';
import 'screens/home_page.dart';
import 'services/theme.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();

    return MultiProvider(
      providers: [
        ChangeNotifierProvider<NotificationsProvider>(
            create: (ctx) => NotificationsProvider()),
        ChangeNotifierProvider<CategoriesProvider>(
            create: (ctx) => CategoriesProvider()),
        ChangeNotifierProvider<DiseasesProvider>(
            create: (ctx) => DiseasesProvider()),
      ],
      child: MaterialApp(
        builder: (context, child) => MediaQuery(
            data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
            child: child!),
        debugShowCheckedModeBanner: false,
        title: 'Medication reminder',
        theme: myTheme,
        home: const HomePage(),
      ),
    );
  }
}
