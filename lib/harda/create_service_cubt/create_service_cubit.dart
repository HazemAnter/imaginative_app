import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'create_service_states.dart';

class CreateServiceCubit extends Cubit<CreateServiceState> {
  CreateServiceCubit() : super(CreateServiceInitialState());

  static CreateServiceCubit get(context) => BlocProvider.of(context);

  ImagePicker imagePicker = ImagePicker();
  File? file;
  getImage(ImageSource source) async {
    XFile? pickedImage = await imagePicker.pickImage(source: source);
    if (pickedImage != null) {
      file = File(pickedImage.path);
      emit(CreateServicePickImageState());
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
  }).toList();void changeServiceTypeValue(newValue) {
    serviceTypeValue = newValue;
    emit(ChangeServiceTypeValueState());
  }

  String serviceBrandTypeValue = 'Other';
  List<DropdownMenuItem<String>> serviceBrandItems  = <String>[
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
  void changeServiceBrandTypeValue(newValue) {
    serviceBrandTypeValue = newValue;
    emit(ChangeServiceBrandTypeValueState());
  }
  String serviceStockAvailabilityValue = 'Not applicable N/A';
  List<DropdownMenuItem<String>> serviceStockAvailabilityItems = <String>[
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
  void changeServiceStockAvailabilityValue(newValue) {
    serviceStockAvailabilityValue = newValue;
    emit(ChangeServiceStockAvailabilityValueState());
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

  String servicePriceTypeValue = 'Fixed amount';
  List<DropdownMenuItem<String>> servicePriceTypeItems = <String>[
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
  void changeServicePriceTypeValue(newValue) {
    servicePriceTypeValue = newValue;
    emit(ChangeServicePriceTypeValueState());
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