import 'package:flutter/material.dart';
import 'file:///C:/Users/emirh/AndroidStudioProjects/flutter_sohbet/lib/app/landing_page.dart';
import 'package:flutter_sohbet/locator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_sohbet/viewmodel/user_model.dart';
import 'package:provider/provider.dart';

void main() async {
  setupLocator();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserModel(),
      child: MaterialApp(
        title: 'Sohbet',
        debugShowCheckedModeBanner: false,
        home: LandingPage(),
      ),
    );
  }
}
