import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'create_content_states.dart';

class CreateContentCubit extends Cubit<CreateContentStates> {
  CreateContentCubit() : super(CreateContentInitialState());

  static CreateContentCubit get(context) => BlocProvider.of(context);

  ImagePicker imagePicker = ImagePicker();
  File? file;
  getImage(ImageSource source) async {
    XFile? pickedImage = await imagePicker.pickImage(source: source);
    if (pickedImage != null) {
      file = File(pickedImage.path);
      emit(CreateContentPickImageState());
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
  }).toList();void changecontentTypeValue(newValue) {
    contentTypeValue = newValue;
    emit(ChangeContentTypeValueState());
  }

  String contentBrandTypeValue = 'Other';
  List<DropdownMenuItem<String>> contentBrandItems  = <String>[
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
  void changecontentBrandTypeValue(newValue) {
    contentBrandTypeValue = newValue;
    emit(ChangeContentBrandTypeValueState());
  }
  String contentStockAvailabilityValue = 'Not applicable N/A';
  List<DropdownMenuItem<String>> contentStockAvailabilityItems = <String>[
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
  void changecontentStockAvailabilityValue(newValue) {
    contentStockAvailabilityValue = newValue;
    emit(ChangeContentStockAvailabilityValueState());
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

  String contentPriceTypeValue = 'Fixed amount';
  List<DropdownMenuItem<String>> contentPriceTypeItems = <String>[
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
  void changecontentPriceTypeValue(newValue) {
    contentPriceTypeValue = newValue;
    emit(ChangeContentPriceTypeValueState());
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
  }}