import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              stretch: true,
              expandedHeight: 300,
              stretchTriggerOffset: 150,
              onStretchTrigger: () {
                print('===>');
                return;
              },
              flexibleSpace: FlexibleSpaceBar(
                stretchModes: [
                  StretchMode.zoomBackground,
                  StretchMode.blurBackground,
                  StretchMode.fadeTitle
                ],
                title: Text('SliverAppBar'),
                background: Image.asset(
                  'images/money.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(_itemList(20)),
            )
          ],
        ),
      ),
    );
  }

  List _itemList(int count) {
    List<Widget> listItems = List();

    for (int i = 0; i < count; i++) {
      listItems.add(new Padding(
        padding: new EdgeInsets.all(20),
        child: Text(
          'Item ${i.toString()}',
          style: TextStyle(fontSize: 26),
        ),
      ));
    }
    return listItems;
  }
}
