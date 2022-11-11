import 'package:flutter/material.dart';

/// This class provides APIs for showing drawers and bottom sheets.
class ScaffoldWidget extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: const Text('Scaffold详解'),
          centerTitle: true,
        ),
        body: _body(),

        ///抽屉的宽度
        drawerEdgeDragWidth: 300,

        ///打开时，遮盖的颜色
        drawerScrimColor: Colors.yellow,

        ///左边抽屉
        drawer: _leftDrawer(),

        ///左边抽屉变化的监听
        onDrawerChanged: (bool) {
          print("左抽屉是否打开：${bool ? "是" : "否"}");
        },

        ///右边抽屉
        endDrawer: _rightDrawer(),

        ///右边抽屉变化的监听
        onEndDrawerChanged: (bool) {
          print("右抽屉是否打开：${bool ? "是" : "否"}");
        },
        bottomSheet: BottomSheet(
          onClosing: () {},
          builder: (BuildContext context) {
            return Container(
              height: 100,
              color: Colors.pink,
              alignment: Alignment.center,
              child: const Text("我是底部区域"),
            );
          },
        ),
        bottomNavigationBar: _bottomAppBar(context),
        persistentFooterButtons: [
          MaterialButton(
            onPressed: () {},
            child: Text('按钮1'),
          ),
          MaterialButton(
            onPressed: () {},
            child: Text('按钮2'),
          ),
          MaterialButton(
            onPressed: () {},
            child: Text('按钮3'),
          )
        ],
        floatingActionButton: FloatingActionButton(onPressed: () {
          // Scaffold.of(context).openDrawer();
          _scaffoldKey.currentState?.openDrawer();
        },child: const Text('抽屉'),),
        backgroundColor: Colors.green,
        extendBody: false,
        extendBodyBehindAppBar: true,
      ),
    );
  }

  _body() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.deepOrange,
      alignment: Alignment.center,
      child: const Text('我是主体内容'),
    );
  }

  _rightDrawer() {
    return Container(
      width: 300,
      height: double.infinity,
      color: Colors.blue,
      alignment: Alignment.center,
      child: const Text('我是右边抽屉栏'),
    );
  }

  _leftDrawer() {
    return Container(
      width: 300,
      height: double.infinity,
      color: Colors.blue,
      alignment: Alignment.center,
      child: const Text('我是左边抽屉栏'),
    );
  }

  _bottomNavigationBar(){
    return BottomNavigationBar(
      ///解决item多余三个的时候不显示的问题
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_outlined), label: '主页'),
        BottomNavigationBarItem(
            icon: Icon(Icons.add_a_photo_rounded), label: '留念'),
        BottomNavigationBarItem(icon: Icon(Icons.add_chart), label: '记录'),
        BottomNavigationBarItem(icon: Icon(Icons.account_box), label: '我的')
      ],
    );
  }

  _bottomAppBar(BuildContext context){
    return BottomAppBar(
      color: Colors.white,
      elevation: 10,
      // shape: CustomNotchedShape(context),
      child: Container(
        height: 60,
        child: Row(children: [
          const Expanded(
              child: Text(
                '首页',
                textAlign: TextAlign.center,
              )),
          const Expanded(
              child: Text(
                '资讯',
                textAlign: TextAlign.center,
              )),
          Expanded(child: SizedBox(child: Transform.scale(
            scale: 1.2,
            alignment: Alignment.bottomCenter,
            child: FloatingActionButton(
              backgroundColor: const Color(0xfff55685),
              elevation: 0,
              onPressed: () {},
              child: const Icon(Icons.add_rounded, color: Colors.black87),
            ),
          ))),
          const Expanded(
              child: Text(
                '消息',
                textAlign: TextAlign.center,
              )),
          const Expanded(
              child: Text(
                '个人',
                textAlign: TextAlign.center,
              )),
        ]),
      ),
    );
  }
}

class CustomNotchedShape extends NotchedShape {
  final BuildContext context;
  const CustomNotchedShape(this.context);

  @override
  Path getOuterPath(Rect host, Rect? guest) {
    const radius = 40.0;
    const lx = 20.0;
    const ly = 8;
    const bx = 10.0;
    const by = 20.0;
    var x = (MediaQuery.of(context).size.width - radius) / 2 - lx;
    return Path()
      ..moveTo(host.left, host.top)
      ..lineTo(x, host.top)
    // ..lineTo(x += lx, host.top - ly)
      ..quadraticBezierTo(x + bx, host.top, x += lx, host.top - ly)
    // ..lineTo(x += radius, host.top - ly)
      ..quadraticBezierTo(
          x + radius / 2, host.top - by, x += radius, host.top - ly)
    // ..lineTo(x += lx, host.top)
      ..quadraticBezierTo((x += lx) - bx, host.top, x, host.top)
      ..lineTo(host.right, host.top)
      ..lineTo(host.right, host.bottom)
      ..lineTo(host.left, host.bottom);
  }
}