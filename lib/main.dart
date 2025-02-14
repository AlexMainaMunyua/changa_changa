import 'package:changa_changa/new-mobile-2/AuthSelector.dart';
import 'package:changa_changa/utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");
  WidgetsFlutterBinding.ensureInitialized();

  // Check if the device is rooted
  // bool? isRooted = await Root.isRooted();
  // if (isRooted!) {
  //   // Show a message or take other actions before exiting
  //   if (kDebugMode) {
  //     print("The device is rooted. App cannot be launched.");
  //   }
  //   return;
  // }
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'ChangaChanga',
        debugShowCheckedModeBanner: false,
      //  scrollBehavior: MyCustomScrollBehavior(),
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const AuthSelector()); //const PhoneLogin());
  }
}
