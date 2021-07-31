import 'dart:convert';

import 'package:flutter/material.dart';
import 'second.dart';
import 'package:http/http.dart' as http;

var list;
class FirstPage extends StatefulWidget {
  var result;
  FirstPage({this.result});
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {




  List<Widget> dataFetch(){

    List<Widget> l=[];
    for(int i=0;i<3;i++)
      {
        l.add(Flexible(
          child: Center(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(widget.result['default']['trendingSearchesDays'][1]['trendingSearches'][i]['title']['query'],style: TextStyle(
                    color: Colors.black
                ),),
              ),
              margin: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5.0),


              ),
            ),
          ),
        ));
      }
    return l;
  }

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("First page loaded");
    print(widget.result['default']['trendingSearchesDays'][0]['trendingSearches'].length);
  }

  var topicname;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height:50.0,),
            Container(
              padding: EdgeInsets.all(20.0),
              child: TextField(
                onChanged: (value) {
                  topicname = value;
                  print(topicname);
                },
                style: TextStyle(
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  icon: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  hintText: 'Search for a keyword',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                if (topicname != '') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SecondPage(
                        topic: topicname,
                      ),
                    ),
                  );
                }
              },
              child: Text(
                "Search",
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.white),
                  ),
                ),
                padding: MaterialStateProperty.all(
                  EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                ),
              ),
            ),
            SizedBox(height: 20.0,),
            Text("CURRENTLY ON TRENDING",style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.w700),),
            Container(

              child: Row(

                mainAxisAlignment: MainAxisAlignment.center,

                children: dataFetch(),
              ),
              
              
              
              
            ),
          ],
        ),
      ),
    );
  }
}
