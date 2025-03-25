import 'package:flutter/material.dart';
import 'features/products/presentation/pages/product_list_page.dart';
import 'cart/presentation/cart_page.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cart App',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (context) => ProductListPage(),
        '/cart': (context) => CartPage(),
      },
    );
  }
}
