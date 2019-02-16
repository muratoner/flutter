import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Assets Kullanımı',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Örnek Assets Kullanımı'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Row(
          children: <Widget>[
            Expanded(
              // assets/trafiklogo.png olarak da kullanılabilir.
              child: Image.asset('trafiklogo.png')
            ),
            Expanded(
              /*  assets klasörü altındaki icons klasörü içerisinde yer alan bir görsel kullandığımız için 
                  assets/ öneki ve ilgili klasör adı yazılmak zorundadır. */
              child: Image.asset('assets/icons/kaskologo.png'),
              flex: 2
            ),
            Expanded(
              /*  assets klasörü altındaki icons klasörü içerisinde yer alan bir görsel kullandığımız için 
                  assets/ öneki ve ilgili klasör adı yazılmak zorundadır. */
              child: Image.asset('assets/icons/sagliklogo.png')
            )
          ],
        ),
      ),
    );
  }
}