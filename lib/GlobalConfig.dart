import 'dart:developer' as dev;
import 'dart:math';
import 'dart:ui';
import 'package:fugacidade/main.dart';
import 'package:flutter/material.dart';

double CalculateAppScale() {
  double OriginalAppWidth = 428.0;
  dev.log("OriginalAppWidth: " + OriginalAppWidth.toString());
  double OriginalAppHeight = 926.0;
  dev.log("OriginalAppHeight: " + OriginalAppHeight.toString());

  double deviceWidth = MediaQueryData.fromWindow(WidgetsBinding.instance!.window).size.width;
  dev.log("deviceWidth: " + deviceWidth.toString());
  double deviceHeight = MediaQueryData.fromWindow(WidgetsBinding.instance!.window).size.height;
  dev.log("deviceHeight: " + deviceHeight.toString());
  double heightScale = deviceHeight / OriginalAppHeight;
  dev.log("heightScale: " + heightScale.toString());

  double widthScale = deviceWidth / OriginalAppWidth;
  dev.log("widthScale: " + widthScale.toString());
  //double scale = [heightScale, widthScale].reduce(min);
  double scale = (heightScale + widthScale) / 2;
  dev.log("scale: " + scale.toString());

  return scale;
}

final double appScale = CalculateAppScale();

const Color appPrimaryColor = Color.fromRGBO(191, 249, 79, 1);
const Color appSecondaryColor = Color.fromRGBO(49, 63, 81, 1);
const Color appSecondaryColor1 = Color.fromRGBO(41, 48, 60, 1);
const Color appSecondaryColor2 = Color.fromRGBO(89, 103, 131, 1);
const Color appSecondaryColor3 = Color.fromRGBO(147, 158, 181, 1);
const Color appHelperColor1 = Color.fromRGBO(131, 165, 150, 1);
const Color appHelperColor2 = Color.fromRGBO(214, 158, 144, 1);


