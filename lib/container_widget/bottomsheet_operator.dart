import 'package:flutter/material.dart';
///使用showModalBottomSheet和showBottomSheet
class BottomSheetUse extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MSBottomSheetDemo3(),
    );
  }
}

class MSBottomSheetDemo4 extends StatelessWidget {
  const MSBottomSheetDemo4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("BottomSheetDemo")),
      body: Center(
        child: Text("Demo"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.pets),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (ctx) {
              return Container(
                height: 100,
                child: Column(
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("保存"),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("取消"),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class MSBottomSheetDemo3 extends StatelessWidget {
  MSBottomSheetDemo3({Key? key}) : super(key: key);

  var _isShow = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        appBar: AppBar(title: Text("BottomSheetDemo")),
        body: Center(
          child: Text("Hello World"),
        ),
        floatingActionButton: _buildFloatingActionButton(),
      ),
      onWillPop:() => _willPop(context),
    );
  }

  Widget _buildFloatingActionButton() {
    return Builder(
      builder: (context) {
        return FloatingActionButton(
          child: Icon(
            Icons.pets,
          ),
          onPressed: () {
            _floatingActionButtonEvent(context);
            _isShow = !_isShow;
          },
        );
      },
    );
  }

  _floatingActionButtonEvent(BuildContext context) {
    if (_isShow) {
      Navigator.of(context).pop();
    } else {
      _showSheet(context);
    }
  }

  void _showSheet(BuildContext context) {
    showBottomSheet(
      context: context,
      enableDrag: false,
      builder: (ctx) {
        return Container(
          width: double.infinity,
          height: 200,
          color: Colors.cyan,
          alignment: Alignment.center,
          child: Text("BottomSheet"),
        );
      },
    );
  }

  Future<bool> _willPop(BuildContext context) {
    Navigator.pop(context);
    _isShow = !_isShow;
    return Future.value(false);
  }
}
