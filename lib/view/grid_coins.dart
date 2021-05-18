import 'package:auto_size_text/auto_size_text.dart';
import 'package:dolaNow/controller/get_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class GridCoin extends StatefulWidget {
  @override
  _GridCoinState createState() => _GridCoinState();
}

class _GridCoinState extends State<GridCoin> {
  Color bgColor01 = Color(0xff141923);
  Color bgColor02 = Color(0xff262C35);
  Color bgGreen = Color(0xff21C17C);

  Controller controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    controller.setAllCoins();

    return Scaffold(
      backgroundColor: bgColor01,
      appBar: AppBar(
        backgroundColor: bgColor02,
        title: Text(
          'Moedas',
          style: TextStyle(fontFamily: 'RobotoBold'),
        ),
      ),
      body: Obx(
        () => controller.euroValue.value.isEmpty
            ? Center(
                child:
                    Lottie.asset('assets/load.json', width: 100, height: 100),
              )
            : Container(
                margin: EdgeInsets.symmetric(vertical: 7, horizontal: 2),
                child: GridView.count(
                  crossAxisCount: 2,
                  children: [
                    buildCard('Euro', 'Comercial',
                        'R\$ ${double.parse(controller.euroValue.value).toStringAsFixed(2)}'),
                    buildCard('Dolar', 'Turismo',
                        'R\$ ${double.parse(controller.dolarTValue.value).toStringAsFixed(2)}'),
                    buildCard('Dolar', 'Canadense',
                        'R\$ ${double.parse(controller.dolarCadValue.value).toStringAsFixed(2)}'),
                    buildCard('Dolar', 'Australiano',
                        'R\$ ${double.parse(controller.dolarAusValue.value).toStringAsFixed(2)}'),
                    buildCard('Bitcoin', 'Criptomoeda',
                        'R\$ ${double.parse(controller.bitValue.value).toStringAsFixed(2)}'),
                    buildCard('Libra', 'Esterlina',
                        'R\$ ${double.parse(controller.libraValue.value).toStringAsFixed(2)}'),
                    buildCard('Peso', 'Argentino',
                        'R\$ ${double.parse(controller.pesoValue.value).toStringAsFixed(2)}'),
                    buildCard('Iene', 'Japonês',
                        'R\$ ${double.parse(controller.ieneValue.value).toStringAsFixed(2)}'),
                    buildCard('Franco', 'Suíço',
                        'R\$ ${double.parse(controller.francoValue.value).toStringAsFixed(2)}'),
                    buildCard('Yuan', 'Chinês',
                        'R\$ ${double.parse(controller.yuanValue.value).toStringAsFixed(2)}'),
                    buildCard('Litecoin', 'Criptomoeda',
                        'R\$ ${double.parse(controller.liteValue.value).toStringAsFixed(2)}'),
                    buildCard('Ethereum', 'Criptomoeda',
                        'R\$ ${double.parse(controller.ethereumValue.value).toStringAsFixed(2)}'),
                    buildCard('Ripple', 'Criptomoeda',
                        'R\$ ${double.parse(controller.rippleValue.value).toStringAsFixed(2)}'),
                  ],
                ),
              ),
      ),
    );
  }
}

Widget buildCard(String title, String subTitle, String coin) {
  return Container(
    width: double.infinity,
    height: double.infinity,
    child: LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Card(
          color: Color(0xff262C35),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(
                  top: constraints.maxHeight * 0.05,
                ),
                height: constraints.maxHeight * 0.25,
                width: constraints.maxWidth,
                child: FittedBox(
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 30,
                        fontFamily: 'RobotoBold',
                        color: Colors.white),
                  ),
                ),
              ),
              Container(
                height: constraints.maxHeight * 0.1,
                width: constraints.maxWidth,
                child: FittedBox(
                  child: Text(
                    subTitle,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        color: Color(0xffe76f51),
                        fontSize: 15),
                  ),
                ),
              ),
              SizedBox(
                height: constraints.maxHeight * 0.15,
              ),
              Container(
                height: constraints.maxHeight * 0.25,
                width: constraints.maxWidth * 0.8,
                child: FittedBox(
                  child: AutoSizeText(
                    coin,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 40,
                        fontFamily: 'RobotoBold',
                        color: Color(0xff21C17C)),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    ),
  );
}
