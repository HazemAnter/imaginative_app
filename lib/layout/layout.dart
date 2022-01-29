import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imaginative_news_app/layout/cubit/cubit.dart';
import 'package:imaginative_news_app/layout/cubit/states.dart';
import 'package:imaginative_news_app/screens/botomsheet/botomsheet.dart';
import 'package:imaginative_news_app/shared/style/colors/colors.dart';

class LayoutScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, Object? state) {
        var cubit = AppCubit.get(context);
        var size = MediaQuery.of(context).size;
        return Scaffold(
          bottomNavigationBar: BuildConvexAppBar(cubit),
          body: Stack(
                  children: [
                    cubit.bottomScreens[cubit.currentIndex],
                    if(cubit.isBottomSheet)LayOutBottomSheet(cubit: cubit,),
                  ],
                )

        );
      },
    );
  }
}

class LayoutBottomSheetIcon extends StatelessWidget {
  final String label;
  final IconData icon;

  const LayoutBottomSheetIcon(
    this.label,
    this.icon,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: Colors.white,
        ),
        Text(
          label,
          style: TextStyle(
              color: Colors.white, fontSize: 17, fontWeight: FontWeight.w400),
        )
      ],
    );
  }
}

class BuildConvexAppBar extends StatelessWidget {
  final AppCubit cubit;

  const BuildConvexAppBar(this.cubit);

  @override
  Widget build(BuildContext context) {
    List<TabItem> bottomNavItem = [
      TabItem(icon: Icons.home, title: ' '),
      TabItem(icon: Icons.search, title: ' '),
      TabItem(
        icon: Icon(
          cubit.isBottomSheet ? Icons.cancel_outlined : Icons.post_add,
          color: Colors.blue,
          size: 45,
        ),
        title: ' ',
      ),
      TabItem(icon: Icons.notifications_none, title: ' '),
      TabItem(icon: Icons.save, title: ' '),
    ];
    return ConvexAppBar(
      style: TabStyle.fixed,
      items: bottomNavItem,
      activeColor: primaryColor,
      color: Colors.grey[400],
      backgroundColor: Colors.white,
      initialActiveIndex: cubit.currentIndex,
      onTap: (index) {
        if (index == 2) {
          cubit.isBottomSheetToggle();
          return;
        }
        cubit.changeBottom(index);
      },
    );
  }
}

/*class LayoutBottomSheetItems extends StatelessWidget {
  const LayoutBottomSheetItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = getSize(context);
    return Padding(
      padding: const EdgeInsets.only(right: 16,left: 16,top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          LayoutBottomSheetIcon('Story', Icons.wifi, () {
              navigateTo(context, CreateStoryScreen());
            }),
          LayoutBottomSheetIcon('Product', Icons.shop, () {
           navigateTo(context, CreatePageScreen());
          }),
        ],
      ),
    );
  }
}*/

/*
Future<dynamic> layoutBottomSheet(BuildContext context) {
  return showModalBottomSheet(
      backgroundColor: Colors.black.withOpacity(0),
      barrierColor: Colors.black.withOpacity(0),
      elevation: 60,
      useRootNavigator: false,
      builder: (context) => Container(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 51),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(200),
                  topLeft: Radius.circular(200),
                ),
                color: Colors.grey,
              ),
              height: 210,
            ),
            Container(
              margin: EdgeInsets.only(bottom: 51),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(200),
                  topLeft: Radius.circular(200),
                ),
                color: Colors.blue,
              ),
              height: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LayoutBottomSheetItems(),
                ],
              ),
            ),
          ],
        ),
      ),
      context: context);
}
*/
