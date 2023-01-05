import 'package:flutter/material.dart';

int isVisibleNow(List<GlobalKey> keys){
  List<double> pos=[];
  for (int i=0; i<keys.length; i++) {
    if (keys[i].currentContext?.findRenderObject() != null) {
      pos.add((keys[i].currentContext?.findRenderObject() as RenderBox).localToGlobal(const Offset(0,-270)).dy);
    }
  }
  pos.add(1);
  return pos.indexOf(
      pos.firstWhere((element) => element>0)
  );



}