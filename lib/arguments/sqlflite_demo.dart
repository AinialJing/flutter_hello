import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SQLHelper {

  static Future<Database> getDb() async {
    // Get a location using getDatabasesPath
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'hello.db');

    // open the database
    Database database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      // When creating the db, create the table
      await db.execute(
          'CREATE TABLE IF NOT EXISTS People (id INTEGER PRIMARY KEY, name TEXT, age INTEGER, num INTEGER)');
    });
    return database;
  }
}

///自定义people类
class People {
  String _name="";
  int _age=0;
  int _num=0;

  People();

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  int get age => _age;

  set age(int value) {
    _age = value;
  }

  int get num => _num;

  set num(int value) {
    _num = value;
  }

  People.fromJson(Map<String, dynamic> peopleJson) {
    _name = peopleJson['name'];
    _age = peopleJson['age'];
    _num = peopleJson['num'];
  }

  Map<String, dynamic> toJson() {
    return {"name": _name, "age": _age, "num": _num};
  }
}

///首页
class MySqfliteHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MySqfliteHomePage(),
    );
  }
}

class MySqfliteHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          child: Text('下一页'),
          onTap: () {
            People people = new People();
            people.name = 'Hello';
            people.age = 18;
            people.num = 2022;
            insertPeople(people);
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => MySqfliteSecondPage()));
          },
        ),
      ),
    );
  }

  void insertPeople(People people) async {
    final Database db = await SQLHelper.getDb();
    db.insert('People', people.toJson());
  }
}

///第二页页面
class MySqfliteSecondPage extends StatefulWidget {
  @override
  State<MySqfliteSecondPage> createState() => _MySqfliteSecondPageState();
}

class _MySqfliteSecondPageState extends State<MySqfliteSecondPage> {
  People people = People();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              Text('姓名：${people.name}'),
              Text('年龄：${people.age}'),
              Text('编号：${people.num}')
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      // getPeople().then((value) {
      //   people = value!;
      //   setState(() {});
      // });
      initData();
    });
  }

  void initData() async {
    people = (await getPeople())!;
    setState(() {});
  }

  Future<People?> getPeople() async {
    final Database db = await SQLHelper.getDb();
    List<Map<String, dynamic>> list =
        await db.query('People', columns: ['name', 'age', 'num']);
    if (list != null && list.length > 0) {
      return People.fromJson(list.first);
    }
    return null;
  }
}
