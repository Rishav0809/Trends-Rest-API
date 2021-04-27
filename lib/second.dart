import 'dart:convert';

import 'package:flutter/material.dart';
import 'third.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'fourth.dart';

class SecondPage extends StatefulWidget {

  final topic;
  SecondPage({this.topic});

  @override 
  _SecondPageState createState() => _SecondPageState();
}



class _SecondPageState extends State<SecondPage> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getData();
  }

  void getData() async{
    var keyword=widget.topic;
    http.Response response = await http.get('https://newsapi.org/v2/everything?q=$keyword&apiKey=d7fc9ec743d648bc9016c0d17ce57d42');
    String data = response.body;
    var info=jsonDecode(data);
    if (response.statusCode == 200 && info['totalResults']!=0) {
      



      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ThirdPage(
          information: info,
        )),
      );
    } else {
      print(response.statusCode);
 Navigator.push(context, MaterialPageRoute(builder: (context)=>ForthPage()));
    }

  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        body: Center(
          child: SpinKitDoubleBounce(
            color: Colors.white,
            size: 100.0,
          ),
        ),

      ),
    );
  }
}
