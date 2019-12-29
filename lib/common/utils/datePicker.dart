import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class DatePicker{
  openDatePicker(context,String selectDate) async{
   return await showDatePicker(
      context: context,
      initialDate: selectDate==null ? DateTime.now() : DateTime.parse(selectDate), //选中的日期
      firstDate: DateTime(1980), //日期选择器上可选择的最早日期
      lastDate: DateTime(2100),
      locale: Locale("zh")
    );
  }
}

class TimePicker{
  openTimePicker(context,hour,minute) async{
    return await showTimePicker(
        context: context,
        initialTime: hour == null || minute==null ? TimeOfDay.now() : TimeOfDay(hour: hour,minute: minute),

        builder: (BuildContext context, Widget child) {
          return Localizations(
              locale: const Locale('zh'),
              child: child,
              delegates: <LocalizationsDelegate>[
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate
              ]
          );
        }
    );
  }
}