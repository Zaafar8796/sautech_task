import 'package:flutter/material.dart';

import './widget/row_headings.dart';

import './map_screen.dart';

class ListScreen extends StatefulWidget {
  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  List<dynamic> cityDistance = [
    {
      'origin': 'Lahore',
      'destination': 'Karachi',
      'distance': 1210,
      'origLat': 31.5497,
      'origLng': 74.3436,
      'destLat': 24.8600,
      'destLng': 67.0100,
    },
    {
      'origin': 'Lahore',
      'destination': 'Islamabad',
      'distance': 377,
      'origLat': 31.5497,
      'origLng': 74.3436,
      'destLat': 33.6989,
      'destLng': 73.0369,
    },
    {
      'origin': 'Islamabad',
      'destination': 'Peshawar',
      'distance': 186,
      'origLat': 33.6989,
      'origLng': 73.0369,
      'destLat': 34.0000,
      'destLng': 71.5000,
    },
    {
      'origin': 'Lahore',
      'destination': 'Faisalabad',
      'distance': 181,
      'origLat': 31.5497,
      'origLng': 74.3436,
      'destLat': 31.4180,
      'destLng': 73.0790,
    },
    {
      'origin': 'Islamabad',
      'destination': 'Faisalabad',
      'distance': 317,
      'origLat': 33.6989,
      'origLng': 73.0369,
      'destLat': 31.4180,
      'destLng': 73.0790,
    },
    {
      'origin': 'Multan',
      'destination': 'Islamabad',
      'distance': 539,
      'origLat': 30.1978,
      'origLng': 71.4711,
      'destLat': 33.6989,
      'destLng': 73.0369,
    },
    {
      'origin': 'Lahore',
      'destination': 'Gujranwala',
      'distance': 82.4,
      'origLat': 31.5497,
      'origLng': 74.3436,
      'destLat': 32.1500,
      'destLng': 74.1833,
    },
    {
      'origin': 'Multan',
      'destination': 'Karachi',
      'distance': 881,
      'origLat': 30.1978,
      'origLng': 71.4711,
      'destLat': 24.8600,
      'destLng': 67.0100,
    },
    {
      'origin': 'Karachi',
      'destination': 'Quetta',
      'distance': 689,
      'origLat': 24.8600,
      'origLng': 67.0100,
      'destLat': 30.1920,
      'destLng': 67.0070,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    final PreferredSizeWidget appBar = AppBar();

    return Scaffold(
      appBar: AppBar(
        title: Text('Cities'),
        actions: [
          IconButton(
            icon: Icon(Icons.sort),
            onPressed: () {
              setState(() {
                cityDistance = cityDistance.reversed.toList();
              });
            },
          )
        ],
      ),
      body: Container(
        height: (mediaQuery.size.height -
                appBar.preferredSize.height -
                mediaQuery.padding.top) *
            1,
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              'Listed Cities',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              // height: 300,
              child: Column(
                children: [
                  RowHeadings(),
                  Container(
                    height: mediaQuery.size.height * 0.7,
                    child: ListView.builder(
                      // shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  cityDistance[index]['origin'],
                                ),
                                Text(
                                  cityDistance[index]['destination'],
                                ),
                                Text(
                                  cityDistance[index]['distance'].toString() +
                                      ' km',
                                ),
                                IconButton(
                                  icon: Icon(Icons.map),
                                  onPressed: () {
                                    Navigator.of(context).pushNamed(
                                      MapScreen.routeName,
                                      arguments: {
                                        'origLat': cityDistance[index]
                                            ['origLat'],
                                        'origLng': cityDistance[index]
                                            ['origLng'],
                                        'destLat': cityDistance[index]
                                            ['destLat'],
                                        'destLng': cityDistance[index]
                                            ['destLng'],
                                      },
                                    );
                                  },
                                ),
                              ],
                            ),
                            Divider()
                          ],
                        );
                      },
                      itemCount: cityDistance.length,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
