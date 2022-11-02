import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MySharedPreference extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SharedPreferenceHome(),
    );
  }
}

class SharedPreferenceHome extends StatelessWidget {
  void setString(String key, String value) async {
    var sp = await SharedPreferences.getInstance();
    sp.setString(key, value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          child: Text('下一个页面'),
          onTap: () {
            setString('arguments', '我是SharedPreferences传值');
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SharedPreferenceSecond()));
          },
        ),
      ),
    );
  }
}

class SharedPreferenceSecond extends StatefulWidget {
  @override
  State<SharedPreferenceSecond> createState() => _SharedPreferenceSecondState();
}

class _SharedPreferenceSecondState extends State<SharedPreferenceSecond> {
  String arguments = "";

  void getString(String key, [String defaultValue = '']) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    arguments=sp.getString(key) ?? defaultValue;
    setState(() {

    });
  }

  @override
  void initState() {
    super.initState();
    getString('arguments');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('${arguments}'),
        ),
      ),
    );
  }
}
