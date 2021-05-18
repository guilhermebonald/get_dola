import 'package:dolaNow/controller/get_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';
import '../home.dart';
import 'real.dart';

class Dolar extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<Dolar> {
  Controller controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    controller.setOneCoin();

    var barHeigh = MediaQuery.of(context).padding.top;
    var widgetHeight = MediaQuery.of(context).size.height - barHeigh;
    var widgetWidth = MediaQuery.of(context).size.width;

    Color bgColor = Color(0xff141923);
    Color bgColor02 = Color(0xff262C35);
    Color bgGreen = Color(0xff21C17C);

    return Scaffold(
      backgroundColor: bgColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            //Agrupa todos widgets após o Container Background.
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                height: widgetHeight * 0.07,
                width: widgetWidth,
                margin: EdgeInsets.only(left: 8, top: 5),
                child: FittedBox(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    icon: ImageIcon(
                      AssetImage('assets/home.png'),
                      color: Colors.white,
                    ),
                    iconSize: widgetHeight * 0.035,
                    alignment: Alignment.centerLeft,
                    onPressed: () {
                      Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.bottomToTop,
                            child: HomePage()),
                      );
                    },
                  ),
                ),
              ),
              Center(
                child: Container(
                  //Logo Image
                  height: widgetHeight * 0.12,
                  margin: EdgeInsets.only(top: 10, bottom: 60),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage('assets/Title.png'),
                  )),
                ),
              ),
              Container(
                height: widgetHeight * 0.6,
                width: widgetWidth,
                margin: EdgeInsets.only(left: 10, right: 10),
                decoration: BoxDecoration(
                  color: bgColor02,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: constraints.maxHeight * 0.12,
                          width: constraints.maxWidth,
                          margin: EdgeInsets.only(top: 15),
                          child: FittedBox(
                            child: Text(
                              '🇺🇸   ➞   🇧🇷',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: 'Roboto', color: Colors.white),
                            ),
                          ),
                        ),
                        Container(
                          height: constraints.maxHeight * 0.12,
                          margin: EdgeInsets.only(top: 15),
                          child: FittedBox(
                            child: IconButton(
                              icon: Icon(Icons.autorenew_rounded),
                              color: Colors.white,
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  PageTransition(
                                      child: Real(),
                                      type: PageTransitionType.fade),
                                );
                              },
                              iconSize: 40,
                            ),
                          ),
                        ),
                        Container(
                          height: constraints.maxHeight * 0.20,
                          width: constraints.maxWidth,
                          margin: EdgeInsets.only(top: 20, left: 10, right: 10),
                          decoration: BoxDecoration(
                              color: bgColor,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.2),
                                    blurRadius: 4)
                              ]),
                          child: Center(
                            child: TextField(
                              onChanged: controller.convertDolar,
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                hintText: 'US\$',
                                hintStyle: TextStyle(
                                    color: Colors.white, fontFamily: 'Roboto'),
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                              ),
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  color: Color(0xffeeeeee),
                                  fontSize: constraints.maxWidth * 0.11),
                            ),
                          ),
                        ),
                        Obx(
                          () => Container(
                            height: constraints.maxHeight * 0.15,
                            width: constraints.maxWidth,
                            margin: EdgeInsets.only(bottom: 10, top: 40),
                            child: FittedBox(
                              child: Text(
                                'R\$ ${controller.valueConvert.value.toStringAsFixed(2)}',
                                style: TextStyle(
                                    fontFamily: 'Montserrat-Regular',
                                    color: bgGreen),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
