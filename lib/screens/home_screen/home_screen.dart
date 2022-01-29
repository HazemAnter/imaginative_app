import 'package:flutter/material.dart';
import 'package:imaginative_news_app/screens/botomsheet/botomsheet.dart';
import 'package:imaginative_news_app/screens/product_page_screen/Widget/product_item.dart';
import 'package:imaginative_news_app/shared/components/components.dart';

class HomeScreen extends StatelessWidget {
  final List<String> products = [
    'Product',
    'Skill',
    'Content',

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Imaginative news',style: Theme.of(context).appBarTheme.titleTextStyle,),
        actions: appBarActions,
        leading: Icon(Icons.print),
      ),
      body: SingleChildScrollView(
        child: ListView.builder(
          shrinkWrap: true,
          reverse: false,
            physics: NeverScrollableScrollPhysics(),
            itemCount: products.length,
            itemBuilder: (context, index) => ProductItem(
                  type: products[index],
                )),
      ),
    );
  }
}
