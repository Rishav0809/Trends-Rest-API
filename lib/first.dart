import 'package:flutter/material.dart';
import 'second.dart';

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  var topicname;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
          ],
        ),
      ),

    );
  }
}
