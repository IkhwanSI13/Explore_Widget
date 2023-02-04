import 'package:explore_widget/widget/list_view/user_model.dart';
import 'package:flutter/material.dart';

class ItemUser extends StatelessWidget {
  final int index;
  final UserModel data;

  ItemUser(this.index, this.data);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 24, left: 16, right: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CircleAvatar(
            radius: 24,
            backgroundColor: Colors.lightBlue,
            child: Text(
              data.codeName,
              style: TextStyle(color: Colors.white),
            ),
          ),
          Expanded(
              child: Container(
            margin: EdgeInsets.only(left: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  data.name,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                Container(
                  margin: EdgeInsets.only(top: 2),
                  child: Text(data.major),
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }
}
