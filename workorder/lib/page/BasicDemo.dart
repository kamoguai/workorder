import 'package:flutter/material.dart';


final List<IconButton> colorList = [
  IconButton(icon: Icon(Icons.ac_unit), onPressed: (){ print('ac_unit');},),
  IconButton(icon: Icon(Icons.access_alarm), onPressed: (){ print('access_alarm');},),
  IconButton(icon: Icon(Icons.accessibility), onPressed: (){ print('accessibility');},),
  IconButton(icon: Icon(Icons.accessible), onPressed: (){ print('accessible');},),
  IconButton(icon: Icon(Icons.account_balance), onPressed: (){ print('account_balance');},),
  IconButton(icon: Icon(Icons.add_a_photo), onPressed: (){ print('add_a_photo');},),
  IconButton(icon: Icon(Icons.add_photo_alternate), onPressed: (){ print('add_photo_alternate');},),
  IconButton(icon: Icon(Icons.airline_seat_flat), onPressed: (){ print('airline_seat_flat');},),
  IconButton(icon: Icon(Icons.airplay), onPressed: (){ print('airplay');},),
  
];


class BasicDemo extends StatelessWidget {

  final String title;

  BasicDemo(this.title);

  Widget renderTitle(String title) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 16),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
  


  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        this.renderTitle('SliverGrid'),
        SliverGrid.count(
          crossAxisCount: 3,
          children: colorList.map((color) => Container(child: color,)).toList(),
        ),
        this.renderTitle('SliverGridView'),
        SliverGrid.count(
          crossAxisCount: 2,
          childAspectRatio: 1.0,
          mainAxisSpacing: 2.0,
          crossAxisSpacing: 2.0,
          children: colorList.map((color) => Container(child: color)).toList(),
        ),
        this.renderTitle('SliverList'),
        // SliverFixedExtentList(
        //   delegate: SliverChildBuilderDelegate(
        //     (context, index) => Container(child: colorList[index], child: Text('$index', style: TextStyle(fontSize: 16, color: Colors.white),textAlign: TextAlign.center,),),
        //     childCount: colorList.length,
        //   ),
        //   itemExtent: 100,
        // ),
      ],
    );
  }
}