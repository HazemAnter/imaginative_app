import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'create_skill-talent_states.dart';

class CreateSkillTalentCubit extends Cubit<CreateSkillTalentState> {
  CreateSkillTalentCubit() : super(CreateSkillTalentInitialState());

  static CreateSkillTalentCubit get(context) => BlocProvider.of(context);

  ImagePicker imagePicker = ImagePicker();
  File? file;
  getImage(ImageSource source) async {
    XFile? pickedImage = await imagePicker.pickImage(source: source);
    if (pickedImage != null) {
      file = File(pickedImage.path);
      emit(CreateSkillTalentPickImageState());
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
  }).toList();void changeskillTalentTypeValue(newValue) {
    skillTalentTypeValue = newValue;
    emit(ChangeSkillTalentTypeValueState());
  }

  String skillTalentBrandTypeValue = 'Other';
  List<DropdownMenuItem<String>> skillTalentBrandItems  = <String>[
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
  void changeskillTalentBrandTypeValue(newValue) {
    skillTalentBrandTypeValue = newValue;
    emit(ChangeSkillTalentBrandTypeValueState());
  }
  String skillTalentStockAvailabilityValue = 'Not applicable N/A';
  List<DropdownMenuItem<String>> skillTalentStockAvailabilityItems = <String>[
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
  void changeskillTalentStockAvailabilityValue(newValue) {
    skillTalentStockAvailabilityValue = newValue;
    emit(ChangeSkillTalentStockAvailabilityValueState());
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

  String skillTalentPriceTypeValue = 'Fixed amount';
  List<DropdownMenuItem<String>> skillTalentPriceTypeItems = <String>[
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
  void changeSkillTalentPriceTypeValue(newValue) {
    skillTalentPriceTypeValue = newValue;
    emit(ChangeSkillTalentPriceTypeValueState());
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