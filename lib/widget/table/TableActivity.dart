import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TableActivity extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TableActivityState();
}

class TableActivityState extends State<TableActivity> {

  ///FractionColumnWidth(.2): 0.2 from their parent width
  ///FixedColumnWidth(20.0): Fixed width
  ///FlexColumnWidth: Like flex on flexible widget
  ///IntrinsicColumnWidth(): depend on their child's width

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Table"),
      ),
      body: Table(
        ///Specific width on column
        columnWidths: {
          0: FractionColumnWidth(.2),
          1: FixedColumnWidth(40.0),
          2: IntrinsicColumnWidth()
        },
        //defaultColumnWidth: FixedColumnWidth(20.0),
        //border: TableBorder.all(width: 8),
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        children: [
          TableRow(children: [
            Container(
              width: 120,
              height: 180,
              color: Colors.red,
            ),
            Container(
              width: 120,
              height: 50,
              color: Colors.yellow,
            ),
            Container(
              width: 120,
              height: 120,
              color: Colors.green,
            )
          ]),
          TableRow(children: [
            Container(
              width: 120,
              height: 120,
              color: Colors.purple,
            ),
            Container(
              width: 120,
              height: 120,
              color: Colors.pink,
            ),
            Container(
              width: 120,
              height: 120,
              color: Colors.blue,
            ),
          ])
        ],
      ),
    );
  }
}
