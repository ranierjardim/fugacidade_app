import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fugacidade/GlobalConfig.dart';
import 'package:intl/intl.dart';

class FugaDateTimePicker extends StatefulWidget {
  final String text;
  final bool hasShadow;
  final double scale;

  const FugaDateTimePicker({Key? key, required this.text, this.hasShadow = true, this.scale = 1}) : super(key: key);

  @override
  _FugaDateTimePickerState createState() => _FugaDateTimePickerState(text, hasShadow, scale);
}

class _FugaDateTimePickerState extends State<FugaDateTimePicker> {
  final String text;
  final bool hasShadow;
  final double scale;

  _FugaDateTimePickerState(this.text, this.hasShadow, this.scale);

  DateTime initial = DateTime(2022);
  DateTime first = DateTime(2022);
  DateTime last = DateTime(2023);
  String selectedDate = DateFormat('dd/MMM').format(DateTime.now()).toLowerCase();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDatePicker(context: context, initialDate: initial, firstDate: first, lastDate: last).then((value) => {
          setState(() {
            if(value != null){
              selectedDate = DateFormat('dd/MMM').format(value).toLowerCase();
            }
          })
        });
      },
      child: Container(
        child: Padding(
          padding: EdgeInsets.fromLTRB(14 * scale, 0, 0, 0),
          child: Row(
            children: [
              Text(this.text, style: TextStyle(fontSize: 14 * scale),),
              Padding(
                padding: EdgeInsets.all(8 * scale),
                child: Container(
                  child: Padding(
                    padding: EdgeInsets.all(8 * scale),
                    child: Row(
                      children: [
                        Text(selectedDate, style: TextStyle(fontSize: 14 * scale),),
                      ],
                    ),
                  ),
                  decoration: ShapeDecoration(
                    shape: StadiumBorder(),
                    color: appPrimaryColor,
                  ),
                ),
              ),
            ],
          ),
        ),
        decoration: ShapeDecoration(
          shape: StadiumBorder(),
          color: Colors.white,
          shadows: hasShadow ? [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5 * scale,
              blurRadius: 7 * scale,
              offset: Offset(0, 0), // changes position of shadow
            ),
          ] : null,
        ),
      ),
    );
  }
}
