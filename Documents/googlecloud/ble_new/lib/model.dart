import 'package:flutter/material.dart';
class TempData{
  String num;
  String date;
  String temp;
  String time;


  TempData({
    this.num,
    this.date,
    this.temp,
    this.time,
});

  TempData.toVal(String num,String date,String time,String temp) {
    this.num =num;
    this.date=date;
    this.temp=temp;
    this.time=time;
  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['num']=this.num;
    data['date']=this.date;
    data['date']=this.temp;
    data['date']=this.time;
  }

}