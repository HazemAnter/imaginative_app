import 'package:flutter/material.dart';
import 'package:imaginative_news_app/screens/details_screens/product_details_screen/product_details_screen.dart';
import 'package:imaginative_news_app/shared/components/components.dart';
import 'package:imaginative_news_app/shared/style/colors/colors.dart';

class ProductItem extends StatelessWidget {
  final String type;

  const ProductItem({required this.type});

  @override
  Widget build(BuildContext context) {
    var size = getSize(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 4,
        shadowColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        color: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ProductPostHeader(),
            ProductPostImage( type),
            ProductPostMiddle(),
            BuildDefaultButton(
                child: Text('MORE DETAILS'),
                onPressed: () {
                  navigateTo(context, ProductDetailsScreen(type: type,));
                },
                width: double.infinity,
                height: size.height * 0.07,
                radius: 7),
            ProductPostBottom(),
          ],
        ),
      ),
    );
  }


}

class ProductInformation extends StatelessWidget {
/*  final String? brandName;
  final String? typeName;
  final String? priceType;
  final String? price;
  final String? brandName;*/
  const ProductInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Mohamed Mugs',
          style: TextStyle(fontSize: 16),
        ),
        Text(
          'Gray Mugs',
          style: TextStyle(
            fontSize: 15.0,
            color: Colors.grey,
          ),
        ),
        Row(
          children: [
            Text('4.5'),
            BuildRatingBar(
                initialRating: 4.5,
                itemSize: 12,
                ignoreGestures: true,
                itemPadding: 1),
            SizedBox(width: 5,),
            Text('(2)'),
          ],
        ),
        Row(
          children: [
            Text('100 EGP',
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.grey,
                  decoration: TextDecoration.lineThrough,
                )),
            SizedBox(
              width: 3,
            ),
            Text('70 EGP',
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.black,
                )),
          ],
        ),
        Text(
          'in stock',
          style: TextStyle(color: Colors.green),
        ),
      ],
    );
  }
}


class ProductPostBottom extends StatelessWidget {
  const ProductPostBottom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = getSize(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RichText(
              text: TextSpan(children: [
                TextSpan(
                  text: '1',
                  style: TextStyle(color: primaryColor),
                ),
                TextSpan(
                  text: ' store',
                  style: TextStyle(color: Colors.black),
                )
              ])),
          Row(
            children: [
              Text('2'),
              Container(
                  height: 20,
                  child: BuildIconButtonWithCircleAvatar(
                      icon: Icons.remove_red_eye_outlined, onTap: () {}))
            ],
          ),
        ],
      ),
    );
  }
}


class ProductPostMiddle extends StatelessWidget {
  const ProductPostMiddle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = getSize(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ProductInformation(),
          if(!isMe)BuildFollowButton(onPressed: () {}, radius: 7),
        ],
      ),
    );
  }
}


class ProductPostImage extends StatelessWidget {

  final String type;

  const ProductPostImage(this.type);

  @override
  Widget build(BuildContext context) {
    var size = getSize(context);
    var color = primaryColor;
    if (type == 'Product') {
      color = primaryColor;
    }
    if (type == 'Skill') {
      color = Colors.green;
    }
    if (type == 'Content') {
      color = Colors.red;
    }

    return Container(
      width:double.infinity,
      child: Stack(
        children: [
          Container(
            width:double.infinity,
            height: size.height * 0.25,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    'https://image.freepik.com/free-psd/arrangement-minimal-coffee-mugs_23-2149027126.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
              top: -15,
              right: -20,
              child: Container(
                height: size.height * 0.12,
                width: size.width * 0.28,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40), color: color),
                child: Padding(
                  padding: const EdgeInsets.only(right: 7, top: 20),
                  child: Center(
                      child: Text(
                        type,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 18),
                      )),
                ),
              )),
        ],
      ),
    );
  }
}


class ProductPostHeader extends StatelessWidget {


  final List<Widget> productBottomSheetItemsOtherView  = [ BuildBottomSheetItem(
      'Save', Icons.bookmark_border_sharp, () {}),
    Divider(height: 1,),
    BuildBottomSheetItem(
        'Report', Icons.warning, () {}),
    Divider(height: 1,),
    BuildBottomSheetItem('Mute notification on this product',
        Icons.warning, () {}),];
   final List<Widget> productBottomSheetItemsMyView  = [ BuildBottomSheetItem(
       'Update', Icons.update, () {}),
     Divider(height: 1,),
     BuildBottomSheetItem(
         'Republish', Icons.refresh, () {}),
     Divider(height: 1,),
     BuildBottomSheetItem('Delete',
         Icons.delete, () {}),];

  @override
  Widget build(BuildContext context) {
    var size = getSize(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: ImagePhotoAndNameAndDate(
                  image: 'https://image.freepik.com/free-photo/senior-thougthful-man-holds-chin-looks-pensively-aside-makes-plannings-wears-spectacles-casual-grey-jumper-isolated-vivid-yellow-wall_273609-44143.jpg', name: 'Karim Mohamed',)),
            Row(
              children: [
                BuildIconButtonWithCircleAvatar(
                    icon: Icons.bookmark_border_sharp,
                    onTap: () {},
                    circleAvatarColor: Colors.white,
                    iconColor: primaryColor),
                BuildIconButtonWithCircleAvatar(
                    icon: Icons.ios_share,
                    onTap: () {},
                    circleAvatarColor: primaryColor,
                    iconColor: Colors.white),
                BuildCustomIconButton(
                    icon: Icons.more_horiz,
                    onTap: () {
                      myBottomSheet(context,isMe?productBottomSheetItemsMyView:productBottomSheetItemsOtherView);
                    },
                    color: Colors.black),
              ],
            )
          ],
        ),
      ),
    );
  }
}


Future<dynamic> myBottomSheet(context,List<Widget> items) {
  return showModalBottomSheet(
      context: context,
      builder: (context) {
        var size = getSize(context);
        return Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.grey,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                decoration: BoxDecoration(color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(8)),
                child: Column(
                  children:
                   items
                  ,
                ),
              ),
              SizedBox(height: 5),
              BuildDefaultButton(
                  child: Text(
                    'Cancel',
                    style: TextStyle(color: primaryColor),
                  ),
                  height: size.height * 0.06,
                  width: double.infinity,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  color: Colors.white),
            ],
          ),
        );
      });
}

class BuildBottomSheetItem extends StatelessWidget {

  final String text;
  final   IconData icon;
  final Function() onTap;

  const BuildBottomSheetItem(this.text, this.icon, this.onTap);

  @override
  Widget build(BuildContext context) {
    return InkWell(

      child: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: Container(
          height: 45,
          child: Row(
            children: [
              Icon(
                icon,
                color: primaryColor,
              ),
              Text(text)
            ],
          ),
        ),
      ),
      onTap: onTap,
    );
  }
}
