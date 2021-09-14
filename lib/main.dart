import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/cart_screen.dart';
import 'screens/product_list_screen.dart';
import 'screens/single_product_screen.dart';
import 'screens/profile_screen.dart';
import 'provider/cart_provider.dart';
import 'utils/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Provider Example',
        theme: appTheme,
        initialRoute: '/',
        routes: {
          '/': (context) => ProductListScreen(),
          '/cart': (context) => CartScreen(),
          '/profile': (context) => ProfileScreen(),
          '/product': (context) => SingleProductScreen()
        },
      ),
    );
  }
}
