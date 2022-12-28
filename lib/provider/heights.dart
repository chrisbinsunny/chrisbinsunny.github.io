import 'dart:developer';

import 'package:flutter/material.dart';

class Heights extends ChangeNotifier{

  double about=0, project=0, social=0;

  get getAboutHeight{
    return about;
  }

  set setAboutHeight(double about1){
    about=about1;
    log(about.toString());
    notifyListeners();

  }

  get getProjectHeight{
    return project;
  }

  set setProjectHeight(double project1){
    project=project1;
    notifyListeners();
  }

  get getSocialHeight{
    return about;
  }

  set setSocialHeight(double social1){
    social=social1;
    notifyListeners();

  }
}