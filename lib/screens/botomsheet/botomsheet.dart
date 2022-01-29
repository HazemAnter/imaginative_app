import 'package:flutter/material.dart';
import 'package:imaginative_news_app/layout/cubit/cubit.dart';
import 'package:imaginative_news_app/layout/layout.dart';
import 'package:imaginative_news_app/screens/create_screens/create_page_screen/create_page_screen.dart';
import 'package:imaginative_news_app/screens/create_screens/create_story_screen/create_story_screen.dart';
import 'package:imaginative_news_app/shared/components/components.dart';
import 'package:imaginative_news_app/shared/style/colors/colors.dart';

class LayOutBottomSheet extends StatelessWidget {
final AppCubit? cubit;

  const LayOutBottomSheet({this.cubit}) ;
  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap:() {
        cubit!.isBottomSheetToggle();
      },
      child: Container(
        color: Colors.black54,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  clipBehavior: Clip.antiAlias,
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
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(200),
                      topLeft: Radius.circular(200),
                    ),
                    color: primaryColor,
                  ),
                  height: 200,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap:  () {
                            navigateTo(context, CreateStoryScreen());
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              LayoutBottomSheetIcon('Story', Icons.wifi,),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            navigateTo(context, CreatePageScreen());
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,

                            children: [
                              LayoutBottomSheetIcon('Product', Icons.shop, ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
