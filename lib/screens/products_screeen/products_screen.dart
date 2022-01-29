import 'package:flutter/material.dart';
import 'package:imaginative_news_app/screens/product_page_screen/Widget/product_item.dart';
import 'package:imaginative_news_app/shared/components/components.dart';

class ProductsScreen extends StatelessWidget {


  Widget build(BuildContext context) {
    final List<String> products = [
      'Product',
      'Skill',
      'Content',
      'Skill',
      'Product',
      'Content',
    ];
    var size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14.0,vertical: 8),
                child: Row(
                  children: [Column(
                    children: [
                      Text('Increase your Product purchasers using',style: inputTitleStyle,),
                      SizedBox(height:8 ,),
                      Row(
                        children: [
                          BuildLogoIcon(imageUrl: '', onTap: (){})
                        ],
                      )

                    ],
                  )],
                ),
              ),

              InformationText(
                  'Increase your product page followers by inviting others like friends, family...etc and thus possibility of increasing your product purchasers'),


              ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),

                  scrollDirection: Axis.vertical,
                  itemCount: products.length,
                  itemBuilder: (context, index) =>
                      ProductItem(
                        type: products[index],
                      )),
            ],
          ),
        )
    );
  }
}