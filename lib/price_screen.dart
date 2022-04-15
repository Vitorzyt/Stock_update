import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'widget/line_chart_widget.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String apikey = 'c';
  String stock = 'DIS';
  String stockValueInUSD = '0.0';
  String stockValueInUSD2 = '0.0';
  String stockValueInUSD3 = '0.0';
  String stockValueInUSD4 = '0.0';
  String stockValueInUSD5 = '0.0';
  double firstPoint = 0;
  double secondPoint = 0;
  double thirdPoint = 0;
  double fourthPoint = 0;
  double fifthPoint = 0;
  int day = DateTime.now().day;
  Future getcoinData(String stock) async {
    Response response = await get(Uri.parse(
        'https://www.alphavantage.co/query?function=TIME_SERIES_INTRADAY&symbol=$stock&interval=5min&apikey=QZJT115CQ568Q2RF'));

    if (response.statusCode == 200) {
      String data = response.body;

      var decodedData = jsonDecode(data);

      String rate =
          decodedData['Time Series (5min)']['2022-04-14 20:00:00']['1. open'];

      print('$rate open');
      print('$day');
      return rate;
    } else {
      print(response.statusCode);
      print('erro');
    }
  }

  Future getcoinData2(String stock) async {
    Response response = await get(Uri.parse(
        'https://www.alphavantage.co/query?function=TIME_SERIES_INTRADAY&symbol=$stock&interval=5min&apikey=QZJT115CQ568Q2RF'));

    if (response.statusCode == 200) {
      String data = response.body;

      var decodedData = jsonDecode(data);

      String rate2 =
          decodedData['Time Series (5min)']['2022-04-14 19:00:00']['1. open'];

      print('$rate2 open2');

      return rate2;
    } else {
      print(response.statusCode);
      print('erro');
    }
  }

  Future getcoinData3(String stock) async {
    Response response = await get(Uri.parse(
        'https://www.alphavantage.co/query?function=TIME_SERIES_INTRADAY&symbol=$stock&interval=5min&apikey=QZJT115CQ568Q2RF'));

    if (response.statusCode == 200) {
      String data = response.body;

      var decodedData = jsonDecode(data);

      String rate3 =
          decodedData['Time Series (5min)']['2022-04-14 18:10:00']['1. open'];

      print('$rate3 open3');

      return rate3;
    } else {
      print(response.statusCode);
      print('erro');
    }
  }

  Future getcoinData4(String stock) async {
    Response response = await get(Uri.parse(
        'https://www.alphavantage.co/query?function=TIME_SERIES_INTRADAY&symbol=$stock&interval=5min&apikey=QZJT115CQ568Q2RF'));

    if (response.statusCode == 200) {
      try {
        String data = response.body;

        var decodedData = jsonDecode(data);

        String rate4 =
            decodedData['Time Series (5min)']['2022-04-14 17:00:00']['1. open'];

        print('$rate4 open4');

        return rate4;
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            elevation: 300,
            backgroundColor: Color.fromARGB(255, 141, 22, 22),
            content: const Text(
              'Requests limited to 1 a minute',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            duration: const Duration(seconds: 3),
          ),
        );
      }
    } else {
      print(response.statusCode);
      print('erro');
    }
  }

  Future getcoinData5(String stock) async {
    Response response = await get(Uri.parse(
        'https://www.alphavantage.co/query?function=TIME_SERIES_INTRADAY&symbol=$stock&interval=5min&apikey=QZJT115CQ568Q2RF'));

    if (response.statusCode == 200) {
      String data = response.body;

      var decodedData = jsonDecode(data);

      String rate5 =
          decodedData['Time Series (5min)']['2022-04-14 16:00:00']['1. open'];

      print('$rate5 open5');

      return rate5;
    } else {
      print(response.statusCode);
      print('erro');
    }
  }

  void getData() async {
    try {
      var data = await getcoinData(stock);

      setState(() {
        // stockValueInUSD = firstPoint;
        stockValueInUSD = data;
        firstPoint = double.parse(data);
        print('$stockValueInUSD value');
      });
    } catch (e) {
      print(e);
    }
  }

  void getData2() async {
    try {
      var data2 = await getcoinData2(stock);

      setState(() {
        stockValueInUSD2 = data2;
        secondPoint = double.parse(data2);
        print('$stockValueInUSD2 value2');
      });
    } catch (e) {
      print(e);
    }
  }

  void getData3() async {
    try {
      var data3 = await getcoinData3(stock);

      setState(() {
        // stockValueInUSD = firstPoint;
        stockValueInUSD3 = data3;
        thirdPoint = double.parse(data3);
        print('$stockValueInUSD3 value3');
      });
    } catch (e) {
      print(e);
    }
  }

  void getData4() async {
    try {
      var data4 = await getcoinData4(stock);

      setState(() {
        // stockValueInUSD = firstPoint;
        stockValueInUSD4 = data4;
        fourthPoint = double.parse(data4);
        print('$stockValueInUSD4 value4');
      });
    } catch (e) {
      print(e);
    }
  }

  void getData5() async {
    try {
      var data5 = await getcoinData5(stock);

      setState(() {
        // stockValueInUSD = firstPoint;
        stockValueInUSD5 = data5;
        fifthPoint = double.parse(data5);
        print('$stockValueInUSD5 value5');
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
    getData2();
    getData3();
    getData4();
    getData5();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 30, 7, 86),
        title: Center(
          child: Text(
            'Last Update Stock Chart',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Color.fromARGB(255, 63, 3, 244),
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 $stock =  $stockValueInUSD USD',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 18),
            child: SizedBox(
              height: 200,
              child: LineChartWidget(
                  firstPoint, secondPoint, thirdPoint, fourthPoint, fifthPoint),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Color.fromARGB(255, 63, 3, 244),
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: TextField(
                  controller: TextEditingController(),
                  autofocus: true,
                  onChanged: (newText) {
                    stock = newText;
                  },
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          getData();
                          getData2();
                          getData3();
                          getData4();
                          getData5();
                          TextEditingController().clear();
                        });
                      },
                      color: Colors.white,
                      icon: Icon(Icons.send),
                    ),
                    hintText: 'Enter Stock',
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
