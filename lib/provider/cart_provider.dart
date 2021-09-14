import 'package:flutter/material.dart';
import '../models/product_model.dart';
import 'package:lipsum/lipsum.dart' as lipsum;

class CartProvider extends ChangeNotifier {
  List<Product> _products = [];
  List<Product> _cart = [];
  Product _active;

  CartProvider() {
    _products = [
      Product(1, "Blue Tee", 1599.00, 0, "blue.png", lipsum.createParagraph()),
      Product(2, "Red Tee", 2499.00, 0, "red.png", lipsum.createParagraph()),
      Product(
          3, "Green Tee", 1999.00, 0, "green.png", lipsum.createParagraph()),
    ];
    notifyListeners();
  }

  List<Product> get products => _products;
  List<Product> get cart => _cart;
  Product get activeProduct => _active;

  setActiveProduct(Product product) {
    _active = product;
  }

  clearCart() {
    for (Product p in _products) {
      p.quantity = 0;
    }
    _cart.clear();
    notifyListeners();
  }

  addItemToCart(Product product) {
    print("adding ${product.name}");
    Product found =
        _cart.firstWhere((p) => p.id == product.id, orElse: () => null);
    if (found != null) {
      found.quantity += 1;
    } else {
      _cart.add(product);
      product.quantity += 1;
    }
    notifyListeners();
  }

  removeItemFromCart(Product product) {
    Product found =
        _cart.firstWhere((p) => p.id == product.id, orElse: () => null);
    if (found != null && found.quantity == 1) {
      product.quantity = 0;
      _cart.remove(product);
    }
    if (found != null && found.quantity > 1) {
      found.quantity -= 1;
    }
    notifyListeners();
  }

  int getCartQuantity() {
    int total = 0;
    for (Product p in _cart) {
      total += p.quantity;
    }
    return total;
  }

  double getCartTotal() {
    double price = 0;
    for (Product p in _cart) {
      price += (p.price * p.quantity);
    }
    return price;
  }
}
