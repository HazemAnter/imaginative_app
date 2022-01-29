import 'package:flutter/material.dart';
import 'package:imaginative_news_app/screens/product_page_screen/Widget/product_item.dart';

class ProductPageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final List<String> products = [
      'Product',
      'Skill',
      'Content',

    ];
    var size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      body: ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) => ProductItem(
            type: products[index],
          ))
    );
  }

}