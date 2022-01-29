import 'package:flutter/material.dart';
import 'package:imaginative_news_app/screens/details_screens/details_Screens_cubit/details_Screens_cubit.dart';
import 'package:imaginative_news_app/screens/product_page_screen/Widget/story_item.dart';

class StoriesScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: 4,
          itemBuilder: (context,index)=>StoryItem()),

    );
  }
}