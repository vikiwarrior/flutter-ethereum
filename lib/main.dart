import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:web3dart/web3dart.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String rpcUrl = "http://127.0.0.1:7545"; //gacache rcp server url
  String wsUrl = "ws://127.0.0.1:7545";

  void sendEther() async {
    Web3Client client = Web3Client(rpcUrl, Client(), socketConnector: () {
      return IOWebSocketChannel.connect(wsUrl).cast<String>();
    });

    String privateKey =
        "38af6824e43de41cd97b683f07d693181aa3b6584529ffca0511e30746b7b90e"; //private key of sender

    Credentials credentials =
        await client.credentialsFromPrivateKey(privateKey);

    EthereumAddress ownaddress = await credentials.extractAddress();
    print(ownaddress);

    EthereumAddress reciever = EthereumAddress.fromHex(
        "0xD05D59ef648F11aBe8Ed17c30A0f5C6D1bC7aCcB"); //address of reciever

    client.sendTransaction(
        credentials,
        Transaction(
            from: ownaddress,
            to: reciever,
            value: EtherAmount.fromUnitAndValue(EtherUnit.ether, 2)));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: Scaffold(
          body: Center(
            child: Text("Flutter-Blockchain "),
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: sendEther,
          )),
    );
  }
}
