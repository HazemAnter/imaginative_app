import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import 'create_product_states.dart';

class CreateProductCubit extends Cubit<CreateProductState> {
  CreateProductCubit() : super(CreateProductInitialState());

  static CreateProductCubit get(context) => BlocProvider.of(context);

  ImagePicker imagePicker = ImagePicker();
  File? file;
  getImage(ImageSource source) async {
    XFile? pickedImage = await imagePicker.pickImage(source: source);
    if (pickedImage != null) {
      file = File(pickedImage.path);
      emit(CreateProductPickImageState());
    }
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
  }).toList();void changeProductTypeValue(newValue) {
    productTypeValue = newValue;
    emit(ChangeProductTypeValueState());
  }

  String productBrandTypeValue = 'Other';
  List<DropdownMenuItem<String>> productBrandItems = <String>[
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
  void changeProductBrandTypeValue(newValue) {
    productBrandTypeValue = newValue;
    emit(ChangeProductBrandTypeValueState());
  }
  String productStockAvailabilityValue = 'Not applicable N/A';
  List<DropdownMenuItem<String>> productStockAvailabilityItems = <String>[
    'Not applicable N/A',
    'Two',
    'Free',
    'Four'
  ].map<DropdownMenuItem<String>>((String value) {
    return DropdownMenuItem<String>(
      value: value,
      child: Text(value),
    );
  }).toList();
  void changeProductStockAvailabilityValue(newValue) {
    productStockAvailabilityValue = newValue;
    emit(ChangeProductStockAvailabilityValueState());
  }

  String usesTypeValue = 'Other';
  List<DropdownMenuItem<String>> usesTypeItems = <String>[
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
  void changeUsesTypeValue(newValue) {
    usesTypeValue = newValue;
    emit(ChangeUsesTypeValueState());
  }

  String productPriceTypeValue = 'Fixed amount';
  List<DropdownMenuItem<String>> productPriceTypeItems = <String>[
    'Fixed amount',
    'Two',
    'Free',
    'Four'
  ].map<DropdownMenuItem<String>>((String value) {
    return DropdownMenuItem<String>(
      value: value,
      child: Text(value),
    );
  }).toList();
  void changePriceTypeValue(newValue) {
    productPriceTypeValue = newValue;
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







}
