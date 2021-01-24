import 'package:flutter/material.dart';
import 'entrance_fader.dart';

class CardsExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Column(
                    children: <Widget>[
                      buildExpandedCard(
                          Colors.yellow, 100, 3, Offset(-32.0, -32.0)),
                      buildExpandedCard(
                          Colors.blue, 500, 2, Offset(-32.0, 32.0)),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: <Widget>[
                      buildExpandedCard(
                          Colors.redAccent, 300, 1, Offset(32.0, -32.0)),
                      buildExpandedCard(
                          Colors.purpleAccent, 700, 3, Offset(32.0, 32.0)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          EntranceFader(
            delay: Duration(milliseconds: 900),
            child: Card(
              color: Colors.green,
              child: SizedBox(
                width: double.infinity,
                height: 200,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildExpandedCard(
      Color color, int delayMillis, int flex, Offset offset) {
    return Expanded(
      flex: flex,
      child: EntranceFader(
        child: MyCard(
          color: color,
        ),
        delay: Duration(milliseconds: delayMillis),
        offset: offset,
      ),
    );
  }
}

class MyCard extends StatelessWidget {
  final Widget child;
  final Color color;

  const MyCard({Key key, this.child, this.color = Colors.white12})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: this.color,
      child: SizedBox.expand(
        child: child,
      ),
    );
  }
}