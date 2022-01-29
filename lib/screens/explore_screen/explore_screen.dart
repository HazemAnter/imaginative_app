import 'package:flutter/material.dart';
import 'package:imaginative_news_app/screens/products_screeen/products_screen.dart';
import 'package:imaginative_news_app/screens/profile_screen/profile_screen.dart';
import 'package:imaginative_news_app/screens/stories_screen/stories_screen.dart';
import 'package:imaginative_news_app/shared/components/components.dart';

class ExploreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


    List<Widget> tabBarList = [
      Text('Stories', style: Theme.of(context).tabBarTheme.labelStyle),
      Text(
        'Products',
        style: Theme.of(context).tabBarTheme.labelStyle,
      ),
      Text(
        'profiles',
        style: Theme.of(context).tabBarTheme.labelStyle,
      ),
    ];

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: CustomTabBar(tabBarList),
          title: Text(
            'Explore',
            style: Theme.of(context).appBarTheme.titleTextStyle,
          ),
          actionsIconTheme: IconThemeData(
            color: Colors.white,
            size: 5,
          ),
          actions: appBarActions,
        ),
        body: TabBarView(
          children: [
            StoriesScreen(),
            ProductsScreen(),
            ProfileScreen(),
          ],
        ),
      ),
    );
  }

  TabBar buildTabBar(List<Widget> tabBarList) {
    return TabBar(
      tabs: tabBarList,
    );
  }
}

class CustomTabBar extends StatelessWidget implements PreferredSizeWidget {
  final List<Widget> tabBarList;

  const CustomTabBar(this.tabBarList);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 12),
      decoration: BoxDecoration(border: Border(top: BorderSide(color: Colors.white,width: 2))),
      child: TabBar(
        tabs: tabBarList,
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
