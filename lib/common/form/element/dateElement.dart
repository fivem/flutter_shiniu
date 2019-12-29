import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shiniu/common/utils/datePicker.dart';
class DateElement extends StatefulWidget {
  var data;
  var callback;
  DateElement({this.data,this.callback});
  @override
  _State createState() => _State();
}

class _State extends State<DateElement> {
  TextEditingController controller = TextEditingController();
  var date = null;
  var time = null;
  @override
  Widget build(BuildContext context) {
    date = '${widget.data["initDate"]}';
    time = '${widget.data["initTime"]}';
    controller.text = '${widget.data["initDate"]} ${widget.data["initTime"]}';
    return Container(
      child: InkWell(
          child:TextFormField(
            enabled: false,
            controller: controller,
            decoration:InputDecoration(
              labelText:  "${widget.data['label']}",
              suffixIcon: IconButton(
                  icon: Icon(
                    Icons.date_range,
                    color: Colors.blue,
                  ),
                  onPressed: () {}),
            ),
          ),
          onTap: (){
            //just show , can not edit
            if(widget.data['permission']=='w'){
              DatePicker().openDatePicker(context,date).then((result){
                //choose date
                if(result==null && widget.data['required']==false){
                  date = null;
                }else if(result!=null){
                  date = formatDate(result,[yyyy, "-", mm, "-", dd]);
                }
                controller.text = date??'';
                if(widget.data['format'] == 'yyyy-mm-dd'){
                  widget.callback(date);
                }
                if(result!=null && widget.data['format']=='yyyy-mm-dd HH:MM:SS'){
                  TimePicker().openTimePicker(context, int.parse(time.split(":")[0]),int.parse(time.split(":")[1])).then((result){
                    if(result == null){
                      result = TimeOfDay(hour:0,minute:0);
                    }
                    time = formatDate(DateTime(1970,1,1,result.hour,result.minute,0),[HH, ':', nn, ':', ss]);

                    controller.text = controller.text +" "+ time??'';
                    widget.callback(controller.text);
                  });
                }
              });
            }
          }
      )
    );
  }
}
