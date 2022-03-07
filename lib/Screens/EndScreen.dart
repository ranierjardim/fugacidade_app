import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../GlobalConfig.dart';

class EndScreen extends StatefulWidget {
  const EndScreen({Key? key}) : super(key: key);

  @override
  _EndScreenState createState() => _EndScreenState();
}

class _EndScreenState extends State<EndScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [

      Image(
        image: AssetImage("assets/images/EndScreen/fundo.jpg"),
        fit: BoxFit.cover,
        height: double.infinity,
        width: double.infinity,
        alignment: FractionalOffset(0.45,0),
      ),
      Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Spacer(
                flex: 2,
              ),
              Row(
                children: [
                  Spacer(flex: 10,),
                  SvgPicture.asset("assets/images/EndScreen/texto.svg", width: MediaQuery.of(context).size.width * 0.7,),
                  Spacer(flex: 4,),
                ],
              ),
              Spacer(
                flex: 3,
              ),
              Container(
                alignment: Alignment.topRight,
                width: MediaQuery.of(context).size.width,
                child: Center(child: Text("Fuga'cidade \u00a9 2022", style: TextStyle(fontFamily: "Raleway", fontStyle: FontStyle.italic, color: Colors.white, fontWeight: FontWeight.w300, fontSize: 18 * appScale, height: 1.1, decoration: TextDecoration.none),),),
              ),
              Spacer(
                flex: 1,
              ),
            ],
          ))
    ],);
  }
}
