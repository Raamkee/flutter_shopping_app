import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/cart.dart';
import 'screens/product_list.dart';
import 'screens/single_product.dart';
import 'screens/user.dart';
import 'store/store.dart';
import 'utils/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Store(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Provider Example',
        theme: appTheme,
        initialRoute: '/',
        routes: {
          '/': (context) => ProductListScreen(),
          '/cart': (context) => CartScreen(),
          '/profile': (context) => UserScreen(),
          '/product': (context) => SingleProductScreen()
        },
      ),
    );
  }
}
