import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/cart_provider.dart';
import '../widgets/product_list_item.dart';

class ProductListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Google Perks Store",
          style: TextStyle(color: Colors.black45),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Stack(
            children: [
              IconButton(
                icon: Icon(
                  Icons.person,
                  color: Colors.black45,
                ),
                onPressed: () => Navigator.pushNamed(context, '/profile'),
              ),
            ],
          ),
          Stack(
            children: [
              IconButton(
                icon: Icon(
                  Icons.shopping_cart,
                  color: Colors.black45,
                ),
                onPressed: () => Navigator.pushNamed(context, '/cart'),
              ),
              cart.getCartQuantity() > 0
                  ? Container(
                      alignment: Alignment.topRight,
                      width: 40,
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.red,
                            boxShadow: [
                              BoxShadow(color: Colors.black, blurRadius: 5)
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(5, 1, 5, 1),
                            child: Text(
                              cart.getCartQuantity().toString(),
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    )
                  : Container(),
            ],
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Just For You",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.black87)),
                TextButton(
                    onPressed: () => {},
                    child: Text("View All",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.green))),
              ],
            ),
          ),
          ...cart.products.map((item) {
            return InkWell(
                onTap: () {
                  cart.setActiveProduct(item);
                  Navigator.pushNamed(context, '/product');
                },
                child: ProductListItem(product: item));
          }),
        ],
      ),
    );
  }
}
