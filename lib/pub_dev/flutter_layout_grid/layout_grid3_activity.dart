import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

class LayoutGrid3Activity extends StatelessWidget {
  LayoutGrid3Activity({Key? key}) : super(key: key);

  final List<_ItemCardData> _items = [
    _ItemCardData(
        title: "title",
        desc:
            "lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor"),
    _ItemCardData(title: "title", desc: "lorem ipsum dolor lorem ipsum"),
    _ItemCardData(
        title: "title", desc: "lorem ipsum dolor lorem ipsum dolor lorem"),
    _ItemCardData(title: "title", desc: "lorem ipsum dolor lorem ipsum"),
    _ItemCardData(
        title: "title", desc: "lorem ipsum dolor lorem ipsum dolor lorem"),
    _ItemCardData(title: "title", desc: "lorem ipsum dolor lorem ipsum"),
    _ItemCardData(title: "title", desc: "lorem ipsum dolor lorem"),
    _ItemCardData(title: "title", desc: "lorem ipsum dolor lorem"),
    _ItemCardData(
        title: "title", desc: "lorem ipsum dolor lorem ipsum dolor lorem"),
    _ItemCardData(title: "title", desc: "lorem ipsum dolor lorem ipsum"),
    _ItemCardData(
        title: "title", desc: "lorem ipsum dolor lorem ipsum dolor lorem"),
    _ItemCardData(title: "title", desc: "lorem ipsum dolor lorem ipsum"),
    _ItemCardData(
        title: "title",
        desc:
            "lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor"),
    _ItemCardData(title: "title", desc: "lorem ipsum dolor lorem ipsum"),
    _ItemCardData(
        title: "title", desc: "lorem ipsum dolor lorem ipsum dolor lorem"),
    _ItemCardData(title: "title", desc: "lorem ipsum dolor lorem ipsum"),
    _ItemCardData(
        title: "title", desc: "lorem ipsum dolor lorem ipsum dolor lorem"),
    _ItemCardData(title: "title", desc: "lorem ipsum dolor lorem ipsum"),
    _ItemCardData(
        title: "title", desc: "lorem ipsum dolor lorem ipsum dolor lorem"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("flutter_layout_grid"),
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: _ItemCardLayoutGrid(
          items: _items,
        ),
      ),
    );
  }
}

class _ItemCardData {
  _ItemCardData({
    required this.title,
    required this.desc,
  });

  String title;
  String desc;
}

class _ItemCardLayoutGrid extends StatelessWidget {
  const _ItemCardLayoutGrid({
    Key? key,
    required this.items,
  }) : super(key: key);
  final List<_ItemCardData> items;

  @override
  Widget build(BuildContext context) {
    return LayoutGrid(
      // set some flexible track sizes based on the crossAxisCount
      columnSizes: [1.fr, 1.fr],
      // set all the row sizes to auto (self-sizing height)
      rowSizes: List<TrackSize>.generate(items.length, (i) => auto),
      // equivalent to mainAxisSpacing
      rowGap: 12,
      // equivalent to crossAxisSpacing
      // note: there's no childAspectRatio
      columnGap: 24,
      children: [
        // render all the cards with *automatic child placement*
        for (var i = 0; i < items.length; i++)
          GridPlacement(
            child: _ItemCard(
              item: items[i],
            ),
          ),
      ],
    );
  }
}

class _ItemCard extends StatelessWidget {
  const _ItemCard({
    Key? key,
    required this.item,
  }) : super(key: key);
  final _ItemCardData item;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            item.title,
            style: TextStyle(
                color: Colors.green, fontSize: 24, fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 4),
          Text(
            item.desc,
            style: TextStyle(color: Colors.blue, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
