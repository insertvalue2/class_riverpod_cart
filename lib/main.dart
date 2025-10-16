import 'package:class_todo_app/screens/product_list_screen.dart';
import 'package:class_todo_app/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'data/sample_products.dart';

void main() {
  // ProviderScope는 Riverpod 를 사용하기 위해 앱의 최상위로 감싸주는 위젯이다.
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '장바구니 앱',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: ProductListScreen(),
    );
  }
}
