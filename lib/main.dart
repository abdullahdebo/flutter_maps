// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_maps/app_router.dart';
import 'package:flutter_maps/constants/strings.dart';

late String initialRoute;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: 'AIzaSyCljTuX2U9uSyE0y418u-Fk8O37wC--Y9s',
      appId: 'flutter-maps-275ca',
      messagingSenderId: '129805791304',
      projectId: 'flutter-maps-275ca',
    ),
  );

  FirebaseAuth.instance.authStateChanges().listen((User) {
    if (User == Null) {
      initialRoute = loginScreen;
    } else {
      initialRoute = mapScreen;
    }
  });

  runApp(
    MyApp(
      appRouter: AppRouter(),
    ),
  );
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  const MyApp({
    Key? key,
    required this.appRouter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.generateRoute,
      initialRoute: initialRoute,
    );
  }
}
