import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:image_picker/image_picker.dart';
import 'package:imaginative_news_app/screens/create_screens/create_page_screen/create_page_screen_cubit/create_page_screen_cubit.dart';
import 'package:imaginative_news_app/screens/preview_screen/preview_screen.dart';
import 'package:imaginative_news_app/screens/product_example_screen/product_example_screen.dart';
import 'package:imaginative_news_app/screens/story_example_screen/story_example_screen.dart';
import 'package:imaginative_news_app/shared/style/colors/colors.dart';

var inputTitleStyle = TextStyle(fontSize: 20, fontWeight: FontWeight.w500);
var buttonTextStyle = TextStyle(fontSize: 18, fontWeight: FontWeight.w400);
var dropDownTextFieldStyle =
    TextStyle(fontWeight: FontWeight.w400, fontSize: 16);
var titleStyle = TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
bool isMe = true;

class BuildCustomTextButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final Color color;

  const BuildCustomTextButton(
      {required this.text, required this.onPressed, this.color = primaryColor});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Text(
        text,
        style:
            TextStyle(color: color, fontWeight: FontWeight.w400, fontSize: 16),
      ),
    );
  }
}

class BuildAppBarWithCenterTitle extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;
  final String? action;
  final Function()? leadingOnTap;
  final Function()? actionOnTap;

  const BuildAppBarWithCenterTitle(
      {required this.title, this.action, this.leadingOnTap, this.actionOnTap});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: Theme.of(context).appBarTheme.titleTextStyle,
      ),
      centerTitle: true,
      leading: BuildCustomIconButton(
          icon: Icons.arrow_back_ios,
          onTap: () {
            leadingOnTap != null
                ? leadingOnTap!()
                : Navigator.of(context).pop();
          }),
      actions: [
        if (action != null)
          TextButton(
              onPressed: () {
                if(action == 'Next' && action != null){
                  createBottomSheet(context);}
                  else {
                  actionOnTap!();
                }},
              child: Text(
                action!,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              )),
      ],
    );
  }

  Future<dynamic> createBottomSheet(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (context) => Container(
              color: primaryColor,
              padding: EdgeInsets.all(5),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CreateBottomSheetItem(
                      text: 'PREVIEW',
                      onTap: () {
                        navigateTo(context, PreviewScreen());
                      }),
                  SizedBox(
                    height: 2,
                  ),
                  CreateBottomSheetItem(text: "PUBLISH", onTap: () {}),
                ],
              ),
            ));
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class CreateBottomSheetItem extends StatelessWidget {
  final String text;
  final Function() onTap;

  const CreateBottomSheetItem({
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        height: 45,
        color: primaryColor,
        child: Center(
          child: Text(text,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontSize: 16,
              )),
        ),
      ),
      onTap: onTap,
    );
  }
}

class BuildLogoIcon extends StatelessWidget {
  final String imageUrl;
  final double radius;
  final Function() onTap;

  const BuildLogoIcon(
      {required this.imageUrl, this.radius = 20, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: CircleAvatar(
        radius: radius,
        backgroundImage: NetworkImage(imageUrl),
      ),
    );
  }
}

class ImageAndNameAndDropDownButton extends StatelessWidget {
  final String image;
  final String name;
  final CreatePageScreenCubit cubit;
  final bool isProduct;

  const ImageAndNameAndDropDownButton(
      {this.isProduct = true,
      required this.image,
      required this.name,
      required this.cubit});

  @override
  Widget build(BuildContext context) {
    var size = getSize(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundImage: NetworkImage(
              image,
            ),
          ),
          SizedBox(
            width: 9,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                Container(
                  height: size.height * 0.03,
                  child: Row(
                    children: [
                      Icon(
                        Icons.vpn_lock,
                        size: 15,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      BuildDropDownButton(
                        item: cubit.audienceItems,
                        onChanged: cubit.changeAudienceValue,
                        value: cubit.audienceValue,
                      ),
                      BuildRedCircle(),
                    ],
                  ),
                ),
              ],
            ),
          ),
          BuildCustomTextButton(
              text: 'See Example',
              onPressed: () {
                navigateTo(context,
                    isProduct ? ProductExampleScreen() : StoryExampleScreen());
              })
        ],
      ),
    );
  }
}

class ImagePhotoAndNameAndDate extends StatelessWidget {
  final String image;
  final String name;

  const ImagePhotoAndNameAndDate({required this.image, required this.name});

  @override
  Widget build(BuildContext context) {
    var size = getSize(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(image),
        ),
        SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Text(
                    '3d . ',
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
                  ),
                  Icon(
                    Icons.vpn_lock,
                    size: 15,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class BuildDefaultButton extends StatelessWidget {
  final Widget child;
  final Function() onPressed;
  final double? width;
  final double? height;
  final double radius;
  final Color? color;

  const BuildDefaultButton({
    required this.child,
    required this.onPressed,
    this.width,
    this.height,
    this.radius = 30,
    this.color = primaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: MaterialButton(
        child: child,
        onPressed: onPressed,
        padding: EdgeInsets.zero,
        color: color,
        textColor: Colors.white,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
      ),
    );
  }
}

class BuildFollowButton extends StatelessWidget {
  final Function() onPressed;
  final double? width;
  final double? height;
  final double radius;
  final Color? color;

  const BuildFollowButton({
    required this.onPressed,
    this.width,
    this.height,
    this.radius = 30,
    this.color = primaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: MaterialButton(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.signal_wifi_4_bar),
            SizedBox(
              width: 8,
            ),
            Text('Follow'),
          ],
        ),
        onPressed: onPressed,
        padding: EdgeInsets.zero,
        color: color,
        textColor: Colors.white,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
      ),
    );
  }
}

class BuildIconButtonWithCircleAvatar extends StatelessWidget {
  final IconData icon;
  final Function() onTap;
  final Color iconColor;

  final Color? circleAvatarColor;

  const BuildIconButtonWithCircleAvatar(
      {required this.icon,
      required this.onTap,
      this.iconColor = Colors.white,
      this.circleAvatarColor = primaryColor});

  @override
  Widget build(BuildContext context) {
    var size = getSize(context);
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 3.0),
        child: CircleAvatar(
          backgroundColor: circleAvatarColor,
          child: Icon(
            icon,
            color: iconColor,
          ),
        ),
      ),
    );
  }
}

class BuildCustomIconButton extends StatelessWidget {
  final IconData icon;
  final Function() onTap;
  final Color color;

  const BuildCustomIconButton(
      {required this.icon, required this.onTap, this.color = Colors.white});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: InkWell(
        onTap: onTap,
        child: Icon(
          icon,
          color: color,
          size: 20,
        ),
      ),
    );
  }
}

class BuildAppBar extends StatelessWidget {
  final String title;

  const BuildAppBar(this.title);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: Theme.of(context).appBarTheme.titleTextStyle,
      ),
      leadingWidth: 20,
      leading: Icon(Icons.print),
      actionsIconTheme: IconThemeData(
        color: Colors.white,
        size: 5,
      ),
      actions: [
        BuildCustomIconButton(icon: Icons.search, onTap: () {}),
        BuildCustomIconButton(icon: Icons.message, onTap: () {}),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: CircleAvatar(
            radius: 15,
            backgroundImage: NetworkImage(
                'https://image.freepik.com/free-psd/young-man-celebrating-success_1187-6833.jpg'),
          ),
        ),
      ],
    );
  }
}

class BuildRedCircle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: CircleAvatar(
        radius: 3,
        backgroundColor: Colors.red,
      ),
    );
  }
}

class BuildTextAndRedCircle extends StatelessWidget {
  final String text;

  const BuildTextAndRedCircle(this.text);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          text,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
        BuildRedCircle(),
      ],
    );
  }
}

class BuildWidgetAndDropFormFields extends StatelessWidget {
  final Widget leading;
  final List<DropdownMenuItem<String>> item;
  final String value;
  final Function onChanged;
  final Widget? prefix;

  const BuildWidgetAndDropFormFields(
      {required this.leading,
      required this.item,
      required this.value,
      required this.onChanged,
      this.prefix});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        leading,
        SizedBox(
          width: 15,
        ),
        Expanded(
          child: DropdownButtonFormField(
            isExpanded: true,
            value: value,
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.w400, color: Colors.black),
            items: item,
            onChanged: (String? newValue) {
              onChanged(newValue);
            },
            decoration: InputDecoration(
              prefix: prefix,
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ],
    );
  }
}

class BuildIconAndHintTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String? hint;
  final IconData? icon;
  final bool isBorder;

  final int? maxLength;

  const BuildIconAndHintTextFormField(
      {required this.controller,
      this.hint,
      this.icon,
      this.maxLength,
      this.isBorder = true});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (icon != null)
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: (Icon(icon)),
          ),
        Expanded(
            child: TextFormField(
          controller: controller,
          maxLength: maxLength,
          decoration: InputDecoration(
            hintText: hint,
            border: isBorder ? OutlineInputBorder() : null,
            hintMaxLines: 20,
          ),
        )),
      ],
    );
  }
}

class BuildDropDownButton extends StatelessWidget {
  final List<DropdownMenuItem<String>> item;
  final String? value;
  final Function onChanged;
  final bool isExpanded;
  final String? hint;

  const BuildDropDownButton(
      {required this.item,
      this.value,
      required this.onChanged,
      this.isExpanded = false,
      this.hint});

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      items: item,
      hint: hint != null ? Text(hint!) : null,
      value: value,
      isExpanded: isExpanded,
      style: TextStyle(color: Colors.grey[700], fontSize: 16),
      underline: Container(),
      onChanged: (String? newValue) {
        onChanged(newValue);
      },
    );
  }
}

class InformationText extends StatelessWidget {
  final String text;
  final Color? iconColor;

  const InformationText(this.text, {this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.only(top: 8),
      color: Colors.grey[300],
      child: Row(
        children: [
          Icon(
            Icons.warning,
            color: iconColor,
          ),
          SizedBox(
            width: 8,
          ),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  height: 1.4,
                  color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}

class BuildUploadContainers extends StatelessWidget {
  final CreatePageScreenCubit cubit;

  const BuildUploadContainers({required this.cubit});

  @override
  Widget build(BuildContext context) {
    var size = getSize(context);

    return Container(
      height: size.height * 0.13,
      child: Row(
        children: [
          BuildUploadImageContainerItem(
            index: 0,
            cubit: cubit,
          ),
          BuildUploadImageContainerItem(
            index: 1,
            cubit: cubit,
          ),
          BuildUploadImageContainerItem(
            cubit: cubit,
            index: 2,
          ),
        ],
      ),
    );
  }
}

class BuildUploadImageContainerItem extends StatelessWidget {
  final int index;
  final CreatePageScreenCubit cubit;

  const BuildUploadImageContainerItem(
      {required this.index, required this.cubit});

  @override
  Widget build(BuildContext context) {
    var size = getSize(context);

    return Expanded(
      child: InkWell(
        child: Container(
          height: size.height * 0.13,
          margin: EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.grey[300],
          ),
          child: cubit.files.length >= index + 1
              ? Container(
                  child: Image.file(cubit.files[index]),
                )
              : Center(
                  child: Icon(Icons.add),
                ),
        ),
        onTap: () async {
          await uploadImageBottomSheet(context, cubit.getImage, index);
        },
      ),
    );
  }
}

/*
class ploadImageBottomSheet extends StatelessWidget {
  final Function(ImageSource source) getImage;

  const UploadImageBottomSheet({required this.getImage});

  @override
  Widget build(BuildContext context) {
    var size = getSize(context);

    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(8)),
            child: Column(
              children: [
                UploadImageBottomSheetItem(
                    text: 'Camera',
                    icon: Icons.camera_alt,
                    source: ImageSource.camera,
                    getImage: getImage),
                Divider(height: 1),
                UploadImageBottomSheetItem(
                    text: 'Photo Library',
                    icon: Icons.photo,
                    source: ImageSource.gallery,
                    getImage: getImage),
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
          BuildDefaultButton(
              child: Text(
                'Cancel',
                style: TextStyle(color: primaryColor),
              ),
              width: size.width,
              height: size.height * 0.07,
              onPressed: () {
                Navigator.of(context).pop();
              },
              color: Colors.white),
        ],
      ),
    );
  }
}
*/

Future<dynamic> uploadImageBottomSheet(
    context, Function(ImageSource source) getImage, int index) {
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
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(8)),
                child: Column(
                  children: [
                    UploadImageBottomSheetItem(
                        text: 'Camera',
                        icon: Icons.camera_alt,
                        index: index,
                        source: ImageSource.camera,
                        getImage: getImage),
                    Divider(height: 1),
                    UploadImageBottomSheetItem(
                        text: 'Photo Library',
                        index: index,
                        icon: Icons.photo,
                        source: ImageSource.gallery,
                        getImage: getImage),
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              BuildDefaultButton(
                  child: Text(
                    'Cancel',
                    style: TextStyle(color: primaryColor),
                  ),
                  width: double.infinity,
                  height: size.height * 0.07,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  color: Colors.white),
            ],
          ),
        );
      });
}

class UploadImageBottomSheetItem extends StatelessWidget {
  final String text;
  final IconData icon;
  final ImageSource source;
  final int index;
  final Function(ImageSource sourc) getImage;

  const UploadImageBottomSheetItem(
      {required this.text,
      required this.icon,
      required this.source,
      required this.getImage,
      required this.index});

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
      onTap: () async {
        await getImage(source);
        Navigator.of(context).pop();
      },
    );
  }
}

class BuildRatingBar extends StatelessWidget {
  final double initialRating;

  final double itemSize;
  final bool ignoreGestures;
  final double itemPadding;

  const BuildRatingBar(
      {this.initialRating = 0,
      this.ignoreGestures = false,
      this.itemSize = 40,
      this.itemPadding = 4});

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      initialRating: initialRating,
      minRating: 1,
      ignoreGestures: ignoreGestures,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemSize: itemSize,
      itemCount: 5,
      unratedColor: Colors.grey[300],
      itemPadding: EdgeInsets.symmetric(horizontal: itemPadding),
      itemBuilder: (context, _) => Icon(
        Icons.star,
        color: Colors.amber,
      ),
      onRatingUpdate: (rating) {},
    );
  }
}

void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );

Size getSize(context) {
  return MediaQuery.of(context).size;
}

List<Widget> appBarActions = [
  BuildCustomIconButton(icon: Icons.search, onTap: () {}),
  BuildCustomIconButton(icon: Icons.message, onTap: () {}),
  Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8.0),
    child: CircleAvatar(
      radius: 15,
      backgroundImage: NetworkImage(
          'https://image.freepik.com/free-psd/young-man-celebrating-success_1187-6833.jpg'),
    ),
  ),
];
