import 'dart:math';
import 'package:dolaNow/controller/get_controller.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:get/get.dart';

class Dchart extends StatefulWidget {
  @override
  _DchartState createState() => _DchartState();
}

class _DchartState extends State<Dchart> {
  Controller controller = Get.put(Controller());

  List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];

  bool showAvg = false;
  bool isCurved = true;
  bool isDot = true;

  @override
  Widget build(BuildContext context) {
    var appBarSize = AppBar().preferredSize.height;
    var notBar = MediaQuery.of(context).padding.top;
    var allBar = notBar + appBarSize;

    Color bgColor01 = Color(0xff141923);
    Color bgColor02 = Color(0xff262C35);
    Color bgGreen = Color(0xff21C17C);

    controller.setListChart();

    return Scaffold(
      backgroundColor: bgColor01,
      appBar: AppBar(
        title: Text(
          'Gráfico',
          style: TextStyle(fontFamily: 'RobotoBold'),
        ),
        backgroundColor: bgColor02,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Obx(
            () => Center(
              child: Container(
                height: (MediaQuery.of(context).size.height - allBar) * 0.55,
                width: MediaQuery.of(context).size.width * 0.95,
                decoration: BoxDecoration(
                  color: bgColor02,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Container(
                  margin: EdgeInsets.only(right: 10, top: 15),
                  child: LineChart(
                    sampleData1(isCurved, isDot),
                  ),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 25),
            width: MediaQuery.of(context).size.width * 0.9,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.25,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(
                        () {
                          if (isDot == true) {
                            isDot = false;
                          } else {
                            isDot = true;
                          }
                        },
                      );
                    },
                    child: Text(
                      'Point',
                      style: TextStyle(fontSize: 18, fontFamily: 'RobotoBold'),
                    ),
                  ),
                ),
                SizedBox(
                  width: 50,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.25,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(
                        () {
                          if (isCurved == true) {
                            isCurved = false;
                          } else {
                            isCurved = true;
                          }
                        },
                      );
                    },
                    child: Text(
                      'Curve',
                      style: TextStyle(fontSize: 18, fontFamily: 'RobotoBold'),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  LineChartData sampleData1(bool value, bool value2) {
    List<double> graphXY = [
      double.parse(controller.listValue[9].bid),
      double.parse(controller.listValue[8].bid),
      double.parse(controller.listValue[7].bid),
      double.parse(controller.listValue[6].bid),
      double.parse(controller.listValue[5].bid),
      double.parse(controller.listValue[4].bid),
      double.parse(controller.listValue[3].bid),
      double.parse(controller.listValue[2].bid),
      double.parse(controller.listValue[1].bid),
      double.parse(controller.listValue[0].bid),
    ];
    double minY = graphXY.reduce(min) - 0.02;
    double maxY = graphXY.reduce(max) + 0.01;
    return LineChartData(
      lineTouchData: LineTouchData(
        touchTooltipData: LineTouchTooltipData(
          tooltipBgColor: Colors.blueGrey.withOpacity(0.8),
        ),
        touchCallback: (LineTouchResponse touchResponse) {},
        handleBuiltInTouches: true,
      ),
      gridData: FlGridData(
        show: false,
      ),
      titlesData: FlTitlesData(
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 25,
          getTextStyles: (value) => const TextStyle(
            color: Color(0xff72719b),
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
          margin: 10,
          getTitles: (value) {
            switch (value.toInt()) {
              case 2:
                return '8 Dias';
              case 5:
                return '5 Dias';
              case 8:
                return '2 Dias';
            }
            return '';
          },
        ),
        leftTitles: SideTitles(
          showTitles: true,
          getTextStyles: (value) => const TextStyle(
            color: Color(0xff75729e),
            fontWeight: FontWeight.bold,
            fontSize: 17,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 5:
                return '5';
            }
            return '';
          },
          margin: 8,
          reservedSize: 20,
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: const Border(
          bottom: BorderSide(
            color: Color(0xff4e4965),
            width: 4,
          ),
          left: BorderSide(
            color: Colors.transparent,
          ),
          right: BorderSide(
            color: Colors.transparent,
          ),
          top: BorderSide(
            color: Colors.transparent,
          ),
        ),
      ),
      // minX: 0,
      // maxX: 9,
      maxY: maxY,
      minY: minY,
      lineBarsData: linesBarData1(value, value2),
    );
  }

  List<LineChartBarData> linesBarData1(bool value, bool value2) {
    final LineChartBarData lineChartBarData1 = LineChartBarData(
      spots: [
        FlSpot(0, double.parse(controller.listValue[9].bid)),
        FlSpot(1, double.parse(controller.listValue[8].bid)),
        FlSpot(2, double.parse(controller.listValue[7].bid)),
        FlSpot(3, double.parse(controller.listValue[6].bid)),
        FlSpot(4, double.parse(controller.listValue[5].bid)),
        FlSpot(5, double.parse(controller.listValue[4].bid)),
        FlSpot(6, double.parse(controller.listValue[3].bid)),
        FlSpot(7, double.parse(controller.listValue[2].bid)),
        FlSpot(8, double.parse(controller.listValue[1].bid)),
        FlSpot(9, double.parse(controller.listValue[0].bid)),
      ],
      isCurved: value,
      colors: [
        const Color(0xff4af699),
      ],
      barWidth: 3,
      isStrokeCapRound: true,
      dotData: FlDotData(
        show: value2,
      ),
      belowBarData: BarAreaData(
        show: true,
      ),
    );
    return [
      lineChartBarData1,
    ];
  }
}

// FlSpot(0, double.parse(store.postsListFuture.value[9].bid)),
// FlSpot(1, double.parse(store.postsListFuture.value[8].bid)),
// FlSpot(2, double.parse(store.postsListFuture.value[7].bid)),
// FlSpot(3, double.parse(store.postsListFuture.value[6].bid)),
// FlSpot(4, double.parse(store.postsListFuture.value[5].bid)),
// FlSpot(5, double.parse(store.postsListFuture.value[4].bid)),
// FlSpot(6, double.parse(store.postsListFuture.value[3].bid)),
// FlSpot(7, double.parse(store.postsListFuture.value[2].bid)),
// FlSpot(8, double.parse(store.postsListFuture.value[1].bid)),
// FlSpot(9, double.parse(store.postsListFuture.value[0].bid)),
