import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

import 'Screen/ProductGridViewScreen.dart';
import 'Style/Style.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          appBarTheme: AppBarTheme(
        backgroundColor: colorGreen,
        centerTitle: true,
      )),
      title: 'Flutter CRUD APP',
      home: ProductGridViewScreen(),
    );
  }
}
