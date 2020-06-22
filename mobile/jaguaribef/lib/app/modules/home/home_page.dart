import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:jaguaribef/app/modules/home/components/product_tile.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Observer(builder: (_) {
        if (controller.products.error != null) {
          return Center(
            child: RaisedButton(
              onPressed: () {
                controller.fetchProducts();
              },
              child: Text('Repetir'),
            ),
          );
        }

        if (controller.products.value == null) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        var products = controller.products.value;
        return ListView.builder(
          itemCount: products.length,
          itemBuilder: (_, index) {
            return ProductTile(
              product: products[index],
            );
          },
        );
      }),
    );
  }
}
