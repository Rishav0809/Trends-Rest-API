import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

int index=0;
class ThirdPage extends StatefulWidget {

  var information;
  ThirdPage({this.information});

  @override
  _ThirdPageState createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  var counter=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: FlatButton(
          child: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
            Navigator.pop(context);
          },
        ),
        title: Text("In the News"),
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: Image.network(
                    widget.information['articles'][index]['urlToImage']),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              padding: EdgeInsets.all(20.0),
              child: Text(
                widget.information['articles'][index]['title'],
                style: TextStyle(fontSize: 25.0),
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Text(
              widget.information['articles'][index]['publishedAt'],
            ),
            SizedBox(
              height: 15.0,
            ),
            Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: new RichText(
                      text:TextSpan(
                        children: [
                          TextSpan(
                            text: widget.information['articles'][index]['content'],
                            style: TextStyle(
                              fontSize: 18.0,
                            ),
                          ),
                          TextSpan(
                            text: 'Read Full Article',
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.blue,
                              decoration: TextDecoration.underline,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap=() async {
                              print("Hello");
                              var url = widget.information['articles'][index]['url'];
                              if (await canLaunch(url)) {
                                await launch(url);
                              } else {
                                throw 'Could not launch $url';
                              }
                              },

                          ),
                        ],
                      ),
                  ),
                ),),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                TextButton(onPressed: (){
                  setState(() {
                    if (index>0){
                      index-=1;
                    }
                  });

                }, child: Icon(Icons.arrow_back),),
                SizedBox(width: 120.0,),
                TextButton(onPressed: (){
                  var min=19<widget.information['totalResults']-1?19:widget.information['totalResults']-1;
                  setState(() {

                      if (index<min){
                        index+=1;

                      }
                    print(widget.information['totalResults']+1);


                  });
                }, child: Icon(Icons.arrow_forward),),

              ],
            )
          ],
        ),
      ),
    );
  }
}
