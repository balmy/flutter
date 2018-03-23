import 'package:flutter/material.dart';
import 'shop_list_item.dart';

class ShoppingList extends StatefulWidget {
  ShoppingList({Key key, this.products}) : super(key: key);
  final List<Product> products;
  @override
  _ShoppingListState createState() => new _ShoppingListState();
}




class _ShoppingListState extends State<ShoppingList> {
  Set<Product> _shoppingCart = new Set<Product>();
  void _handleCartChanged(Product product, bool inCart) {
    setState(() {
          if (inCart)
            _shoppingCart.add(product);
          else
            _shoppingCart.remove(product);
        }
    );
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('购物清单'),
      ),
      body: new ListView(
        children: widget.products.map(
                (Product product) {
              return new ShopListItem(
                product: product,
                inCart: _shoppingCart.contains(product),
                onCartChanged: _handleCartChanged,
              );
            }
        ).toList(),
      ),
    );
  }
}

final List<Product> _kProducts = <Product>[
  new Product(name: '鸡蛋'),
  new Product(name: '面粉'),
  new Product(name: '巧克力脆片'),
];
void main() {
  runApp(
    new MaterialApp(
      title: 'Flutter教程',
      home: new ShoppingList(products: _kProducts),
    ),
  );
}
