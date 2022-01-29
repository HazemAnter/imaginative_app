import 'package:flutter/material.dart';
import 'package:imaginative_news_app/screens/explore_screen/explore_screen.dart';
import 'package:imaginative_news_app/screens/product_page_screen/product_page_screen.dart';
import 'package:imaginative_news_app/screens/tutorial_screen/tutorial_screen.dart';

class ProductExampleScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    List<Widget> tabBarList = [
      Text('Product Pages',style: Theme.of(context).tabBarTheme.labelStyle),
      Text('Tutorial',style: Theme.of(context).tabBarTheme.labelStyle,),
    ];

    return DefaultTabController(
      length: 2,

      child: Scaffold(
        appBar:AppBar(
          bottom: CustomTabBar(
            tabBarList,
          ),
          title: Text(
            'Product Page Example',
            style: Theme.of(context).appBarTheme.titleTextStyle,
          ),
          centerTitle: true,
          leading: IconButton(onPressed: (){Navigator.of(context).pop();}, icon: Icon(Icons.arrow_back_ios)),
        ),

        body: TabBarView(children: [
          ProductPageScreen(),
          TutorialScreen(),
        ],

        ),
      ),
    );
  }
}
