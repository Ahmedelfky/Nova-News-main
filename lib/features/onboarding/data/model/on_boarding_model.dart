import 'package:flutter/material.dart';

class OnBoardingModel {
  final String title;
  final String description;
  final Widget image;
  final Widget? minTitle;
  final Widget? extraInfo;
  final Widget? extraInfo2;
  final Widget? btTerms;
  final CrossAxisAlignment layoutAlignment;
  final TextAlign textAlign;
  final TextStyle? titleStyle;

  OnBoardingModel({
    required this.title,
    required this.description,
    required this.image,
    this.minTitle,
    this.extraInfo,
    this.extraInfo2,
    this.btTerms,
    this.layoutAlignment = CrossAxisAlignment.center,
    this.textAlign = TextAlign.center,
    this.titleStyle,
  });
}
