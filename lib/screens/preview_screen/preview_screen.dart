import 'package:flutter/material.dart';
import 'package:imaginative_news_app/layout/layout.dart';
import 'package:imaginative_news_app/screens/product_page_screen/Widget/product_item.dart';
import 'package:imaginative_news_app/shared/components/components.dart';

class PreviewScreen extends StatelessWidget {
  const PreviewScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BuildAppBarWithCenterTitle(
        title: 'Preview',
        action: 'Publish',
        actionOnTap: () {
          print('preview');
          navigateTo(context, LayoutScreen());
        },
      ),
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          return ProductItem(type: 'Skill');
        },
      ),
    );
  }
}
