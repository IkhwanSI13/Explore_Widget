import 'package:explore_widget/page_route.dart';
import 'package:flutter/material.dart';

var tagHero = "pp";

class HeroActivity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Hero",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(linkHeroDetail);
            },
            child: Hero(
              tag: tagHero,
              child: ClipOval(
                  child: Container(
                width: 72,
                height: 72,
                child: Image.network("https://ikhwankoto.com/img/pp.jpg"),
              )),
            ),
          )
        ],
      ),
    );
  }
}

class HeroDetailActivity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Hero Detail",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: Hero(
                  tag: tagHero,
                  child: ClipOval(
                      child: Container(
                        width: 172,
                        height: 172,
                        child: Image.network("https://ikhwankoto.com/img/pp.jpg"),
                      ))),
            ),
          )
        ],
      ),
    );
  }
}
