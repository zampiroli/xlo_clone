import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:xlo_clone/engine/parse/InitializeParse.dart';
import 'package:xlo_clone/screens/base/base_screen.dart';
import 'package:xlo_clone/stores/page_store.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeParse();
  setupLocators();
  runApp(MyApp());
}

void setupLocators() {
  GetIt.I.registerSingleton(PageStore());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'XLO',
      theme: ThemeData(
          primarySwatch: Colors.purple,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          scaffoldBackgroundColor: Colors.purple,
          appBarTheme: AppBarTheme(elevation: 0),
          cursorColor: Colors.orange),
      debugShowCheckedModeBanner: false,
      home: BaseScreen(),
    );
  }
}
