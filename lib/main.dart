import 'package:business_application/blocs/auth_bloc.dart';
import 'package:business_application/routes.dart';
import 'package:business_application/screens/splash/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => AuthBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Business Application',
        theme: theme(),
        // home: SplashScreen(),
        initialRoute: SplashScreen.routeName,
        routes: routes,
      ),
    );
  }
}

