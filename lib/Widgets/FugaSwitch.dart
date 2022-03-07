import 'package:flutter/material.dart';
import 'package:fugacidade/GlobalConfig.dart';

class FugaSwitch extends StatefulWidget {

  bool selected;
  double borderSize;
  Color switchColor;
  bool hasShadow;
  double scale;

  FugaSwitch({Key? key, this.borderSize = 14, this.selected = false, this.switchColor = appSecondaryColor, this.hasShadow = true, this.scale = 1}) : super(key: key);



  @override
  _FugaSwitchState createState() => _FugaSwitchState(selected, borderSize, switchColor, hasShadow, scale);
}

class _FugaSwitchState extends State<FugaSwitch> {

  bool selected;
  double borderSize;
  Color switchColor;
  bool hasShadow;
  double scale;
  _FugaSwitchState(this.selected, this.borderSize, this.switchColor, this.hasShadow, this.scale);


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          setState(() {
            selected = !selected;
          });
        },
        child: Container(
          padding: EdgeInsets.all(borderSize * scale),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24 * scale),
            ),
            child: SizedBox(
              width: 60 * scale,
              height: 25 * scale,
              child: Stack(
                children: <Widget>[
                  AnimatedPositioned(
                    width: selected ? 35.0 * scale : 35.0 * scale,
                    height: selected ? 25.0 * scale : 25.0 * scale,
                    top: selected ? 0.0 : 0.0,
                    left: selected ? 25.0 * scale : 0.0,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.fastOutSlowIn,
                    child: Container(
                      decoration: BoxDecoration(
                        color: switchColor,
                        borderRadius: BorderRadius.circular(30 * scale),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          decoration: ShapeDecoration(
            shape: StadiumBorder(),
            color: appPrimaryColor,
            shadows: hasShadow ? [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5 * scale,
                blurRadius: 7 * scale,
                offset: Offset(0, 0), // changes position of shadow
              ),
            ] : null,
          )
        ));
  }
}


/*

BoxDecoration(
            color: appPrimaryColor,
            shape: StadiumBorder(),
            boxShadow: hasShadow ? [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5 * scale,
                blurRadius: 7 * scale,
                offset: Offset(0, 0), // changes position of shadow
              ),
            ] : null,
          ),
 */