import 'package:flutter/material.dart';

class UpdateLength extends ChangeNotifier{
  int n = 100;
  int speed = 50;
  int chosenalgo = 0;
  String algoname = 'Bubble';
  bool sele = false;

  void updatelen(int a){
    if(a==0 || a>300){
      n = 100;
    }
    else{
      n = a;
    }
    notifyListeners();
  }

  void updatespeed(int val){
    if(val>=1 && val<=100){
      speed = val;
    }
    else{
      speed = 50;
    }
    
    notifyListeners();
  }

  void algochoosed(int val,String name){
    algoname = name;
    chosenalgo = val;
    sele = true;
    notifyListeners();
  }

}