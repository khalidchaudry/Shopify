import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shopify/ui/screens/auth/login_screen.dart';
import 'package:shopify/ui/screens/routes/routes.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme:ThemeData.dark().copyWith(scaffoldBackgroundColor: backgroundColor),
      title: 'Shopify',
      initialRoute: '/login',
      routes: routeName,
      home: const LoginScreen(),
    );
  }
}
