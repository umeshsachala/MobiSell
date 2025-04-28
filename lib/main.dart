import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobisell/screens/app/app_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.white, // Change to any color
    statusBarIconBrightness: Brightness.dark, // Use Brightness.light for white icons
  ));
  runApp(const AppView());
}


// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:mobisell/screens/login/login_view.dart';
// import 'screens/app/app_view.dart';
//
// void main() {


//   WidgetsFlutterBinding.ensureInitialized();
//   SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
//     statusBarColor: Colors.white,
//     statusBarIconBrightness: Brightness.dark,
//   ));
//   runApp(const AppView());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: LoginView()
//     );
//   }
// }

//Original code (commented out for easy restoration)
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:mobisell/screens/app/app_view.dart';
//
// void main() {
//   WidgetsFlutterBinding.ensureInitialized();
//   SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
//     statusBarColor: Colors.white,
//     statusBarIconBrightness: Brightness.dark,
//   ));
//   runApp(const AppView());
// }

