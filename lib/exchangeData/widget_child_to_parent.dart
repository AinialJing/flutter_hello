import 'package:flutter/material.dart';

/**
 * 使用Notification
 */
class ShareDataFromChildToParent extends StatefulWidget {
  @override
  State<ShareDataFromChildToParent> createState() =>
      _ShareDataFromChildToParentState();
}

class _ShareDataFromChildToParentState
    extends State<ShareDataFromChildToParent> {
  String _msg = "";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: NotificationListener<CustomNotification>(
          child: Center(
            child: Column(
              children: [
                ShareDataChild(),
                Text(
                  '$_msg',
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
              ],
            ),
          ),
          onNotification: (notification) {
            setState(() {
              _msg = notification.msg;
              print(_msg);
            });
            return false;
          },
        ),
      ),
    );
  }
}

class CustomNotification extends Notification {
  final String msg;

  CustomNotification(this.msg);
}

class ShareDataChild extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Center(
      child: MaterialButton(
        onPressed: () => CustomNotification('Hi,I`am from child')
            .dispatch(context),
        child: Text('发送消息'),
      ),
    );
  }

}
