// Copyright 2017 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'entrance_fader.dart';

class LakesExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: EntranceFader(
                    delay: Duration(milliseconds: 200),
                    child: Text(
                      'Oeschinen Lake Campground',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                EntranceFader(
                  delay: Duration(milliseconds: 250),
                  child: Text(
                    'Kandersteg, Switzerland',
                    style: TextStyle(
                      color: Colors.grey[500],
                    ),
                  ),
                ),
              ],
            ),
          ),
          EntranceFader(
            delay: Duration(milliseconds: 300),
            child: Icon(
              Icons.star,
              color: Colors.red[500],
            ),
          ),
          EntranceFader(
              delay: Duration(milliseconds: 300),
              child: Text('41')),
        ],
      ),
    );

    Column buildButtonColumn(IconData icon, String label) {
      Color color = Theme.of(context).primaryColor;

      return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color),
          Container(
            margin: const EdgeInsets.only(top: 8.0),
            child: Text(
              label,
              style: TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w400,
                color: color,
              ),
            ),
          ),
        ],
      );
    }

    Widget buttonSection = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          EntranceFader(
              delay: Duration(milliseconds: 400),
              child: buildButtonColumn(Icons.call, 'CALL')),
          EntranceFader(
              delay: Duration(milliseconds: 450),
              child: buildButtonColumn(Icons.near_me, 'ROUTE')),
          EntranceFader(
              delay: Duration(milliseconds: 500),
              child: buildButtonColumn(Icons.share, 'SHARE')),
        ],
      ),
    );

    Widget textSection = Container(
      padding: const EdgeInsets.all(32.0),
      child: Text(
        '''
Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run.
        ''',
        softWrap: true,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Top Lakes'),
      ),
      body: ListView(
        children: [
          EntranceFader(
            child: Image.asset(
              'images/lake.jpg',
              width: 600.0,
              height: 240.0,
              fit: BoxFit.cover,
            ),
          ),
          titleSection,
          buttonSection,
          EntranceFader(
            child: textSection,
            delay: Duration(milliseconds: 650),
          ),
        ],
      ),
    );
  }
}