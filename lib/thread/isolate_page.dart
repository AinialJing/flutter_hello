import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// const filename = 'assets/json_01.json';
const filename = 'assets/test.txt';
class IsolatePage extends StatefulWidget {
  @override
  State<IsolatePage> createState() => _IsolatePageState();
}

class _IsolatePageState extends State<IsolatePage> {
  String msg = "";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment:CrossAxisAlignment.stretch ,
          children: [
            MaterialButton(
                onPressed: () {
                  getData();
                },
                child: Text('新的Isolate读取数据')),
            Text('${msg}')
          ],
        ),
      ),
    );
  }

  void getData() async {
    final jsonData = await _spawnAndReceive(filename);
    msg = jsonData.toString();
    setState(() {});
    print('Received JSON with ${jsonData.length} keys');
  }

// Spawns an isolate and sends a [filename] as the first message.
// Waits to receive a message from the the spawned isolate containing the
// parsed JSON.
  Future<Map<String, dynamic>> _spawnAndReceive(String fileName) async {
    final p = ReceivePort();
    await Isolate.spawn(_readAndParseJson, [p.sendPort, fileName]);
    return (await p.first) as Map<String, dynamic>;
  }

// The entrypoint that runs on the spawned isolate. Reads the contents of
// fileName, decodes the JSON, and sends the result back to the main
// isolate.
  static void _readAndParseJson(List<dynamic> args) async {
    SendPort responsePort = args[0] as SendPort;
    String fileName = args[1] as String;
    final file=File(fileName);
    final fileData = await file.readAsString();
    final result = jsonDecode(fileData);
    Isolate.exit(responsePort, result);
  }
}
