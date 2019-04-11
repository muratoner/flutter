import 'dart:async';

import 'package:flutter/material.dart';

class LoadingButton extends StatefulWidget {
  @override
  _LoadingButtonState createState() => _LoadingButtonState();
}

class _LoadingButtonState extends State<LoadingButton> with TickerProviderStateMixin {
  bool _isPressed = false;
  int _state = 0;
  double width = double.infinity;
  Animation _animation;
  GlobalKey globalKey = GlobalKey();
  AnimationController controller2;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      height: 48.0,
      key: globalKey,
      width: width,
      child: RaisedButton(
        padding: EdgeInsets.all(0.0),
        elevation: _isPressed ? 6.0 : 4.0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0)
        ),
        color: _state == 2 ? Colors.green : Colors.blue,
        child: buildChildItem(),
        onPressed: () {
          var snackbar = SnackBar(
            content: Row(
              children: <Widget>[
                Icon(Icons.info_outline),
                Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text("123456")
                )
              ],
            ),
            action: SnackBarAction(
                label: "Okay",
                onPressed: () {

                }),
          );
          Scaffold.of(context).showSnackBar(snackbar);
        },
        onHighlightChanged: (isPressed) {
          setState(() {
            _isPressed = isPressed;
            if (_state == 0) {
              animateButton();
            }
          });
        },
      ),
    );
  }

  void animateButton() {
    AnimationController controller =  AnimationController(duration: Duration(milliseconds: 300), vsync: this);

    double initialWidth = globalKey.currentContext.size.width;
    
    _animation = Tween(begin: 0.0, end: 1.0)
      .animate(controller)
      ..addListener(() {
        setState(() {
          width = (initialWidth - (initialWidth - 48.0) * _animation.value);
        });
      });

    controller.forward();

    setState(() {
      _state = 1;
    });

    Future.delayed(Duration(milliseconds: 3300), () {
      controller2 =  AnimationController(duration: Duration(milliseconds: 1500), vsync: this);

      setState(() {
        _state = 2;
      });
      Future.delayed(Duration(milliseconds: 500), () {
        controller2.forward();

        Future.delayed(Duration(milliseconds: 5000), () {
          setState(() {
            _state = 0;
            width = double.infinity - 50;
          });
        });
      });
    });
  }

  buildChildItem() {
    switch(_state){
      case 0:
        return Text("Save Changes", style: TextStyle(color: Colors.white));
      case 1:
        return CircularProgressIndicator(
          value: null,
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        );
      default:
        return AnimatedIcon(icon: AnimatedIcons.event_add, progress: controller2);
    }
  }
}
