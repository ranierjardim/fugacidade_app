import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fugacidade/GlobalConfig.dart';

class FugaTelaInicialFragment extends StatefulWidget {
  const FugaTelaInicialFragment({Key? key}) : super(key: key);

  @override
  _FugaTelaInicialFragmentState createState() =>
      _FugaTelaInicialFragmentState();
}

class _FugaTelaInicialFragmentState extends State<FugaTelaInicialFragment> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: appPrimaryColor,
        child: Column(
          children: [
            Spacer(
              flex: 4,
            ),
            Row(
              children: [
                Spacer(flex: 10,),
                Container(
                  alignment: Alignment.topRight,
                  width: MediaQuery.of(context).size.width * 0.7,
                  height: 100,
                  child: Text("VAMOS\nFUGIR?", style: TextStyle(fontFamily: "Raleway", fontWeight: FontWeight.bold, fontSize: 32 * appScale, height: 0.86),),

                ),
                Spacer(flex: 8,),
              ],
            ),
            Spacer(flex: 1,),
            Row(
              children: [
                Spacer(flex: 10,),
                SvgPicture.asset("assets/aspas.svg", width: MediaQuery.of(context).size.width * 0.7,),
                Spacer(flex: 8,),
              ],
            ),
            Spacer(
              flex: 3,
            ),
          ],
        ));
  }
}
