import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/product.dart';
import '../provider/cart_provider.dart';

class SingleProductScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<CartProvider>(context);
    Product product = cart.activeProduct;
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => {Navigator.pop(context)},
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black45,
            ),
          ),
          actions: [
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
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text(cart.activeProduct.name,
              style: TextStyle(color: Colors.black45)),
        ),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          children: [
            Image(
              image: AssetImage("assets/images/${product.image}"),
              fit: BoxFit.fitHeight,
              height: 200,
            ),
            Row(
              children: [
                Text(
                  "Rs. ${product.price.toStringAsFixed(2)}",
                  style: TextStyle(color: Colors.black87, fontSize: 30),
                ),
                Spacer(),
                Container(
                    child: Row(
                  children: [
                    IconButton(
                        iconSize: 30,
                        icon: Icon(
                          Icons.add,
                          color: Colors.blue,
                        ),
                        onPressed: () => {cart.addItemToCart(product)}),
                    Text(
                      product.quantity.toString(),
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black87,
                      ),
                    ),
                    IconButton(
                        iconSize: 30,
                        icon: Icon(
                          Icons.remove,
                          color: Colors.red,
                        ),
                        onPressed: () => {cart.removeItemFromCart(product)}),
                  ],
                ))
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              product.description,
              textAlign: TextAlign.justify,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Colors.black54),
            )
          ],
        ));
  }
}
