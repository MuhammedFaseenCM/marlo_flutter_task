import 'package:flutter/material.dart';
import 'package:marlo_flutter_task/controller/provider/home_provider.dart';
import 'package:marlo_flutter_task/controller/provider/search_provider.dart';
import 'package:marlo_flutter_task/view/mainscreen/main_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeProvider()),
        ChangeNotifierProvider(create: (context) => SearchProvider())
      ],
      child: MaterialApp(
        title: 'Marlo Flutter Task',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MainScreen(),
      ),
    );
  }
}
