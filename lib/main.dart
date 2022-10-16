
import 'package:cart_task/controller_binding/view_model_binding.dart';
import 'package:cart_task/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      initialBinding: ViewModelBinding(),
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}
