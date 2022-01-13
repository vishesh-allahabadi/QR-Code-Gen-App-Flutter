import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share/share.dart';

String input = 'Hello';

class Generator extends StatefulWidget {
  @override
  _GeneratorState createState() => _GeneratorState();
}

class _GeneratorState extends State<Generator> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text('QR Code Generator')),
        drawer: Drawer(
          // Add a ListView to the drawer. This ensures the user can scroll
          // through the options in the drawer if there isn't enough vertical
          // space to fit everything.
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            // Important: Remove any padding from the ListView.
//            padding: EdgeInsets.zero,
            children: <Widget>[
              Column(
                children: <Widget>[
                  DrawerHeader(
                    child: Center(
                      child: Text(
                        'QR Code Generator',
                        style: TextStyle(fontSize: 30, color: Colors.white),
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      ListTile(
                        title: Row(
                          children: <Widget>[
                            Icon(Icons.info),
                            SizedBox(
                              width: 20.0,
                            ),
                            Text(
                              'About',
                              style: TextStyle(fontSize: 17.5),
                            ),
                          ],
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute<void>(
                              builder: (BuildContext context) {
                                return Scaffold(
                                  appBar: AppBar(
                                      title:
                                          Text('About QR Code Generator App')),
                                  body: Container(
                                    child: SingleChildScrollView(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Container(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(16.0),
                                              child: Text(
                                                'Simple QR Code Generator',
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(16.0),
                                              child: Text(
                                                'QR codes are amazing and so easy to use! This is a Free App to generate and share QR codes.',
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            child: Column(
                                              children: <Widget>[
                                                Container(
                                                  child: Text(
                                                    'Developed by WebToddler. ',
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 15.0,
                                          ),
                                          Container(
                                            child: Column(
                                              children: <Widget>[
                                                Padding(
                                                  padding: const EdgeInsets.all(16.0),
                                                  child: Container(
                                                    child: Text(
                                                      'Please share your valuable feedback with us at vishesh@webtoddler.com',
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          fontWeight:
                                                          FontWeight.w500),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  floatingActionButton: Padding(
                                    padding:
                                        const EdgeInsets.only(bottom: 80.0),
                                    child: FloatingActionButton(
                                      backgroundColor:
                                          Theme.of(context).primaryColor,
                                      child: Icon(Icons.arrow_back),
                                      onPressed: () => Navigator.pop(context),
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  ListTile(
                    title: Row(
                      children: <Widget>[
                        Icon(Icons.grid_on),
                        SizedBox(
                          width: 20.0,
                        ),
                        Text(
                          'More Apps',
                          style: TextStyle(fontSize: 17.5),
                        ),
                      ],
                    ),
                    onTap: () {
                      launchURL();
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      style: BorderStyle.solid,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  ),
                  child: Image.network(
                      'https://api.qrserver.com/v1/create-qr-code/?data=$input&amp;size=512x512'),
                  width: 400.0,
                  height: 400.0,
                ),
                SizedBox(height: 20.0),
                Container(
                  child: Text('QR Code for $input'),
                ),
                Container(
                  padding: EdgeInsets.all(20.0),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      hintText: 'Type Here!',
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                    onChanged: (value) {
                      setState(() {
                        input = value;
                      });
                    },
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  child: FlatButton(
                    onPressed: () {
                      Share.share(
                          'https://api.qrserver.com/v1/create-qr-code/?data=$input&amp;size=512x512 is the QR Code for $input ');
                    },
                    child: Text(
                      'Share QR Code',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

launchURL() async {
  const url =
      'https://play.google.com/store/apps/developer?id=WebToddler&hl=en';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
