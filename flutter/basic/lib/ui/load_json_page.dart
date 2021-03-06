import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'dart:io';

class LoadJsonPage extends StatefulWidget {
  LoadJsonPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoadJsonPageState createState() => _LoadJsonPageState();
}

class _LoadJsonPageState extends State<LoadJsonPage> {

  @override
  void initState() {
    super.initState();
    // ローカルJSONをロード
    this.loadLocalJson();
  }

  List _jsonData; //データ

  // ローカルJSONをロード
  Future loadLocalJson() async {
    String jsonString = await rootBundle.loadString('assets/json/data.json');
    setState(() {
      final jsonResponse = json.decode(jsonString);
      print("-----jsondata:" + jsonResponse.toString());
      _jsonData = jsonResponse['sword_data'];
      print("--------------------");
    });
  }

  /*
  ----jsondata:{count: 3, address: sword, main: null, sword_data: [{id: 1, name: エクスカリバー, point: 150}, {id: 2, name: グングニル, point: 120}, {id: 3, name: グラム, point: 100}]}
I/flutter ( 7074): --------------------
   */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("JSON_TEST"),
      ),
      // ListviewでJSONデータを表示
      body: ListView.builder(
          itemCount: _jsonData == null ? 0 : _jsonData.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              child: Center(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Card(
                    child: Container(
                      child: Row(
                        children: <Widget>[
                          Container(
                              child: Text(
                                  "ID:" + _jsonData[index]['id'].toString(),
                                  style: TextStyle(
                                      fontSize: 20.0
                                  )
                              ),
                              width: 50,
                              //height: 50
                          ),
                          Container(
                              child: Text(
                                  "名前:" + _jsonData[index]['name'],
                                  style: TextStyle(fontSize: 20.0
                                  )
                              ),
                              //width: 250,
                              //height: 50
                          ),
                        ],
                      ),

                      // added padding
                      padding: const EdgeInsets.all(15.0),
                    ),
                  )
                ],
              )),
            );
          }),
    );
  }
}
