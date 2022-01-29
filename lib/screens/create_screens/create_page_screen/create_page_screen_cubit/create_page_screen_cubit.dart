import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'create_page_screen_states.dart';

class CreatePageScreenCubit extends Cubit<CreatePageScreenState> {
  CreatePageScreenCubit() : super(CreatePageInitialState());

  static CreatePageScreenCubit get(context) => BlocProvider.of(context);

  ImagePicker imagePicker = ImagePicker();
  List<File> files = [];

  getImage(ImageSource source) async {
    XFile? pickedImage = await imagePicker.pickImage(source: source);
    if (pickedImage != null) {
      files.add(File(pickedImage.path));
      emit(CreatePagePickImageState());
      print('image{{{{{{{{{{{{{{{{{');
      print(files);
    }
  }

  String storyHeaderLineValue = '';
  List<DropdownMenuItem<String>> storyHeaderLineItems = <String>[
    'This Story is Imaginative and Used to promote Product/Service/Skill/Content',
    'This Story is Imaginative and Used to express dreams and imaginations',
    'This Story is Imaginative and Used to express ideas ',
    'This story is imaginative'
  ].map<DropdownMenuItem<String>>((String value) {
    return DropdownMenuItem<String>(
      value: value,
      child: Text(value),
    );
  }).toList();

  void changeStoryHeaderLineValue(String newValue) {
    storyHeaderLineValue = newValue;
    emit(ChangeStoryHeaderLineValueState());
  }

  String pageTypeValue = 'Product';
  List<DropdownMenuItem<String>> pageTypeItems = <String>[
    'Product',
    'Service',
    'Content',
    'Skill/Talent'
  ].map<DropdownMenuItem<String>>((String value) {
    return DropdownMenuItem<String>(
      value: value,
      child: Text(value),
    );
  }).toList();

  void changeCreatePageTypeValue(String newValue) {
    pageTypeValue = newValue;
    emit(ChangeCreatePageTypeState());
  }

  String audienceValue = 'Public';
  List<DropdownMenuItem<String>> audienceItems = <String>[
    'Public',
    'Two',
    'Free',
    'Four'
  ].map<DropdownMenuItem<String>>((String value) {
    return DropdownMenuItem<String>(
      value: value,
      child: Text(value),
    );
  }).toList();

  void changeAudienceValue(newValue) {
    audienceValue = newValue;
    emit(ChangeAudienceValueState());
  }

  String productTypeValue = 'Physical product';
  List<DropdownMenuItem<String>> productTypeItems = <String>[
    'Physical product',
    'Two',
    'Free',
    'Four'
  ].map<DropdownMenuItem<String>>((String value) {
    return DropdownMenuItem<String>(
      value: value,
      child: Text(value),
    );
  }).toList();

  void changeProductTypeValue(newValue) {
    productTypeValue = newValue;
    emit(ChangeProductTypeValueState());
  }

  String serviceTypeValue = 'Digital marketing';
  List<DropdownMenuItem<String>> serviceTypeItems = <String>[
    'Digital marketing',
    'Two',
    'Free',
    'Four'
  ].map<DropdownMenuItem<String>>((String value) {
    return DropdownMenuItem<String>(
      value: value,
      child: Text(value),
    );
  }).toList();

  void changeServiceTypeValue(newValue) {
    serviceTypeValue = newValue;
    emit(ChangeServiceTypeValueState());
  }

  String skillTalentTypeValue = 'Playing Football';
  List<DropdownMenuItem<String>> skillTalentTypeItems = <String>[
    'Playing Football',
    'Two',
    'Free',
    'Four'
  ].map<DropdownMenuItem<String>>((String value) {
    return DropdownMenuItem<String>(
      value: value,
      child: Text(value),
    );
  }).toList();

  void changeSkillTalentTypeValue(newValue) {
    skillTalentTypeValue = newValue;
    emit(ChangeSkillTalentTypeValueState());
  }

  String brandTypeValue = 'Other';
  List<DropdownMenuItem<String>> brandItems = <String>[
    'Other',
    'Two',
    'Free',
    'Four'
  ].map<DropdownMenuItem<String>>((String value) {
    return DropdownMenuItem<String>(
      value: value,
      child: Text(value),
    );
  }).toList();

  void changeBrandTypeValue(newValue) {
    brandTypeValue = newValue;
    emit(ChangeBrandTypeValueState());
  }

  String stockAvailabilityValue = 'Not applicable N/A';
  List<DropdownMenuItem<String>> stockAvailabilityItems = <String>[
    'Not applicable N/A',
    'in Stock',
    'Currently Unavailable',
    'Sold Out',
    'Coming Soon',
    '1 until only',
    '2 until only',
    '3 until only',
    '4 until only',
    '5 until only',
    '6 until only',
    '7 until only',
    '8 until only',
    '9 until only',
    '10 until only',
    '11 until only',
    '12 until only',
  ].map<DropdownMenuItem<String>>((String value) {
    return DropdownMenuItem<String>(
      value: value,
      child: Text(value),
    );
  }).toList();

  void changeStockAvailabilityValue(newValue) {
    stockAvailabilityValue = newValue;
    emit(ChangeStockAvailabilityValueState());
  }

  String usesTypeValue = 'Other';
  List<DropdownMenuItem<String>> usesTypeItems = <String>[
    'Other',
    'N/A Not Applicable',
  ].map<DropdownMenuItem<String>>((String value) {
    return DropdownMenuItem<String>(
      value: value,
      child: Text(value),
    );
  }).toList();

  void changeUsesTypeValue(newValue) {
    usesTypeValue = newValue;
    emit(ChangeUsesTypeValueState());
  }

  String hiringValue = 'Freelances';
  List<DropdownMenuItem<String>> hiringItems = <String>[
    'Freelances',
    'Two',
    'Free',
    'Four'
  ].map<DropdownMenuItem<String>>((String value) {
    return DropdownMenuItem<String>(
      value: value,
      child: Text(value),
    );
  }).toList();

  void changeHiringValue(newValue) {
    hiringValue = newValue;
    emit(ChangeHiringValueState());
  }

  String priceTypeValue = 'Fixed amount';
  List<DropdownMenuItem<String>> priceTypeItems = <String>[
    'Fixed amount',
    'Starting from',
    'Starting from fixed amount / week',
    'Starting from fixed amount / month',
    'Starting from fixed amount / 3 month',
    'Starting from fixed amount / 6 month',
    'Starting from fixed amount / year',
    'free',
    'fixed amount / week',
    'fixed amount / month',
    'fixed amount / 3 month',
    'fixed amount / 6 month',
    'fixed amount / year',
    'Starting from fixed amount / square meter',
    'fixed amount / square meter',
    'Starting from Rate / hour',
    'Rate / hour',
    'Estimates-based price',
    'Negotiable',
    'As per employer price',
    'As per purchaser price',
  ].map<DropdownMenuItem<String>>((String value) {
    return DropdownMenuItem<String>(
      value: value,
      child: Text(value),
    );
  }).toList();

  void changePriceTypeValue(newValue) {
    priceTypeValue = newValue;
    emit(ChangePriceTypeValueState());
  }

  String afghanValue = 'AFN';
  List<DropdownMenuItem<String>> afghanItems = <String>[
    'AFN',
    'Two',
    'Free',
    'Four'
  ].map<DropdownMenuItem<String>>((String value) {
    return DropdownMenuItem<String>(
      value: value,
      child: Text(value),
    );
  }).toList();

  void changeAfghanValue(newValue) {
    afghanValue = newValue;
    emit(ChangeAfghanValueState());
  }

  String contentTypeValue = 'Youtube videos';
  List<DropdownMenuItem<String>> contentTypeItems = <String>[
    'Youtube videos',
    'Two',
    'Free',
    'Four'
  ].map<DropdownMenuItem<String>>((String value) {
    return DropdownMenuItem<String>(
      value: value,
      child: Text(value),
    );
  }).toList();

  void changeContentTypeValue(newValue) {
    contentTypeValue = newValue;
    emit(ChangeContentTypeValueState());
  }

  String disclaimerValue =
      'This Story is imaginative And used to promote Product/Service/Skill/Content';
  List<DropdownMenuItem<String>> disclaimerItems = <String>[
    'This Story is imaginative And used to promote Product/Service/Skill/Content',
    'Two',
    'Free',
    'Four'
  ].map<DropdownMenuItem<String>>((String value) {
    return DropdownMenuItem<String>(
      value: value,
      child: Text(value),
    );
  }).toList();

  void changeDisclaimerValue(newValue) {
    disclaimerValue = newValue;
    emit(ChangeDisclaimerValueState());
  }

  String imaginativeYearValue = '2021';
  List<DropdownMenuItem<String>> imaginativeYearItems = <String>[
    '2021',
    'Two',
    'Free',
    'Four'
  ].map<DropdownMenuItem<String>>((String value) {
    return DropdownMenuItem<String>(
      value: value,
      child: Text(value),
    );
  }).toList();

  void changeImaginativeYearValue(newValue) {
    imaginativeYearValue = newValue;
    emit(ChangeImaginativeYearValueState());
  }

  String storyFeaturedProductValue = '2021';
  List<DropdownMenuItem<String>> storyFeaturedProductItems = <String>[
    '2021',
    'Two',
    'Free',
    'Four'
  ].map<DropdownMenuItem<String>>((String value) {
    return DropdownMenuItem<String>(
      value: value,
      child: Text(value),
    );
  }).toList();

  void changeStoryFeaturedProductValue(newValue) {
    imaginativeYearValue = newValue;
    emit(ChangeStoryFeaturedProductValueState());
  }
}
