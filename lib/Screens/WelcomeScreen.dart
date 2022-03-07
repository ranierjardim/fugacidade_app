import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fugacidade/Fragments/FugaMapaFragment.dart';
import 'package:fugacidade/Fragments/FugaTelaInicialFragment.dart';
import 'package:fugacidade/Fragments/FugaVoceA45MinutosFragment.dart';

import '../GlobalConfig.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  Widget _indicator(bool isActive) {
    return Container(
      height: 20,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 150),
        margin: EdgeInsets.symmetric(horizontal: 4),
        height: isActive ? 10 : 10,
        width: isActive ? 10 : 10,
        decoration: BoxDecoration(
          boxShadow: [
            isActive
                ? BoxShadow(
                    color: Color(0XFFCCCCCC).withOpacity(0.52),
                    blurRadius: 2.0,
                    spreadRadius: 1.0,
                    offset: Offset(
                      0.0,
                      0.0,
                    ),
                  )
                : BoxShadow(
                    color: Colors.transparent,
                  )
          ],
          shape: BoxShape.circle,
          color: isActive ? Color(0XFFFFFFFF) : Color(0XFFEAEAEA),
        ),
      ),
    );
  }

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < 2; i++) {
      list.add(i == selectedindex ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  int selectedindex = 0;
  ScrollPhysics CurrentScrollPhysic = RangeMaintainingScrollPhysics();
  bool showScrollIndicator = true;
  PageController _controller = PageController(initialPage: 0, keepPage: false);
  bool showInicialScreen = true;
  Timer changeInitialScreenTimer = Timer(Duration(seconds: 3), () {});

  @override
  initState() {
    changeInitialScreenTimer =Timer(Duration(seconds: 3), () {
      setState(() {
        showInicialScreen = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {

    return Stack(
      children: [
        PageView(
          controller: _controller,
          physics: CurrentScrollPhysic,
          
          onPageChanged: (int page) {
            setState(() {
              selectedindex = page;
            });
            if (page == 0) {
              setState(() {
                changeInitialScreenTimer.cancel();


                CurrentScrollPhysic = RangeMaintainingScrollPhysics();
                showScrollIndicator = true;
                showInicialScreen = true;

                changeInitialScreenTimer = Timer(Duration(seconds: 3), () {
                  setState(() {
                    showInicialScreen = false;
                  });
                });
              });
            }else if (page > 0) {
              setState(() {
                CurrentScrollPhysic = NeverScrollableScrollPhysics();
                showScrollIndicator = false;
                showInicialScreen = true;
                changeInitialScreenTimer.cancel();
              });
            } else {
              setState(() {
                CurrentScrollPhysic = RangeMaintainingScrollPhysics();
                showScrollIndicator = true;
              });
            }
          },
          scrollDirection: Axis.horizontal,
          children: [
            AnimatedSwitcher(
                duration: const Duration(milliseconds: 1000),
                child: showInicialScreen
                    ? FugaTelaInicialFragment()
                    : FugaVoceA45MinutosFragment()),
            FugaMapaFragment()
          ],
        ),
        Positioned(
          bottom: 20,
          left: 0,
          right: 0,
          child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: showScrollIndicator
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: _buildPageIndicator(),
                    )
                  : Container()),
        ),
        Positioned(
          top: 10,
          left: 10,
          child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: showScrollIndicator
                  ? Container()
                  : FloatingActionButton(
                      onPressed: () {
                        _controller.animateToPage(0,
                            duration: Duration(milliseconds: 1000),
                            curve: Curves.ease);
                      },
                      tooltip: 'Voltar',
                      child: const Icon(Icons.arrow_back, color: appSecondaryColor1,),
                      backgroundColor: appPrimaryColor)),
        )
      ],
    );
  }
}
