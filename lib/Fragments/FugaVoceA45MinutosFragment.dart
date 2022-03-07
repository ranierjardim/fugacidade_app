import 'package:flutter/material.dart';
import 'package:fugacidade/GlobalConfig.dart';

class FugaVoceA45MinutosFragment extends StatefulWidget {
  const FugaVoceA45MinutosFragment({Key? key}) : super(key: key);

  @override
  _FugaVoceA45MinutosFragmentState createState() =>
      _FugaVoceA45MinutosFragmentState();
}

class _FugaVoceA45MinutosFragmentState
    extends State<FugaVoceA45MinutosFragment> {
  final PrimaryTextStyle = TextStyle(
      height: 0.86,
      color: appPrimaryColor, fontSize: 70 * appScale, fontWeight: FontWeight.w900, fontFamily: 'Raleway');
  final SecondaryTextStyle = TextStyle(
      color: Colors.white, fontSize: 22 * appScale, fontWeight: FontWeight.w900, fontFamily: 'Raleway');

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Stack(
      children: [
        Image(
          image: AssetImage("assets/Voce45MinutosFundoHR.jpg"),
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,
          alignment: FractionalOffset(0.45,0),
        ),
        Center(
          child: Padding(
            padding: EdgeInsets.all(40 * appScale),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(flex: 1),
                Text("VOCÊ À", style: PrimaryTextStyle),
                Text("45 MIN", style: PrimaryTextStyle),
                Padding(padding: EdgeInsets.fromLTRB(0, 18 * appScale, 0, 0), child: Container(
                  child: Text("DO FUGA' MAIS PERTO", style: SecondaryTextStyle),
                  padding: EdgeInsets.fromLTRB(26 * appScale,8 * appScale,26 * appScale,8 * appScale),
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(color: Colors.white,width: 2 * appScale),
                      bottom: BorderSide(color: Colors.white,width: 2 * appScale),
                    ),
                  ),
                ),),

                Image(
                  image: AssetImage("assets/PinVoce45Minutos.png"),
                  fit: BoxFit.scaleDown,
                  height: 150 * appScale,
                  width: 100 * appScale,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.28,
                )
              ],
            ),
          ),
        )
      ],
    ));
  }
}
