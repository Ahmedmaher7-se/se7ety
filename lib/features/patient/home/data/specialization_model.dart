import 'package:flutter/material.dart';
import 'package:se7ety/features/auth/models/specializations.dart';

const Color skyBlue = Color(0xff71b4fb);
const Color lightBlue = Color(0xff7fbcfb);

const Color orange = Color(0xfffa8c73);
const Color lightOrange = Color(0xfffa9881);

const Color purple = Color(0xff8873f4);
const Color purpleLight = Color(0xff9489f4);

const Color green = Color(0xff4cd1bc);
const Color lightGreen = Color(0xff5ed6c3);

class SpecializationCardModel {
  String name;
  Color cardBackground;
  Color cardLightColor;

  SpecializationCardModel(this.name, this.cardBackground, this.cardLightColor);
}

List<SpecializationCardModel> cards = [
  SpecializationCardModel(specializations[0], skyBlue, lightBlue),
  SpecializationCardModel(specializations[1], green, lightGreen),
  SpecializationCardModel(specializations[2], orange, lightOrange),
  SpecializationCardModel(specializations[3], purple, purpleLight),
  SpecializationCardModel(specializations[4], green, lightGreen),
  SpecializationCardModel(specializations[5], skyBlue, lightBlue),
  SpecializationCardModel(specializations[6], green, lightGreen),
  SpecializationCardModel(specializations[7], orange, lightOrange),
  SpecializationCardModel(specializations[8], purple, purpleLight),
  SpecializationCardModel(specializations[9], green, lightGreen),
];