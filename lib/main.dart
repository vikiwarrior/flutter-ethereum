import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:web3dart/web3dart.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String rpcUrl = "http://127.0.0.1:7545";
  String wsUrl = "ws://127.0.0.1:7545";
  void sendEther()
  {
    Web3Client(rpcUrl, Client(),socketConnector: (){
      
    })
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        body: Text("flutterchain"),
      ),
    );
  }
}
