// main.dart
import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:math';
import 'package:fl_chart/fl_chart.dart';
import 'api_call.dart';
import 'my-globals.dart';

void main() {
  runApp(const MyApp());
}

List<double>? getData() {
  Stream<List<double>> finalData = getDataFromWifi();
  finalData.listen((List<double> Data1) {
    datalist = Data1;
  });
  return datalist;
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Data from Device',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
        ),
        home: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  data(getData) {
    setState(() {
      getData();
    });

    super.initState();
    const oneSecond = Duration(seconds: 25);
    Timer.periodic(oneSecond, (Timer t) => data);
  }

  var spots = getData()!
      .asMap()
      .entries
      .map((it) => FlSpot(it.key.toDouble(), it.value.toDouble()))
      .toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(20),
          width: double.infinity,
          child: LineChart(
            LineChartData(
              borderData: FlBorderData(show: false),
              lineBarsData: [
                // The red line
                LineChartBarData(
                  spots: spots,
                  isCurved: true,
                  barWidth: 3,
                  colors: [
                    Colors.red,
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


