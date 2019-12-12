import 'package:flutter/material.dart';

class DatePicker{
  openDatePicker(context,String selectDate) async{
   return await showDatePicker(
      context: context,
      initialDate: DateTime.now(),//DateTime.parse(selectDate), //选中的日期
      firstDate: DateTime(1980), //日期选择器上可选择的最早日期
      lastDate: DateTime(2100),
      locale: Locale("zh")
    );
  }
}