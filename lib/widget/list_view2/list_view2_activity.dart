import 'package:explore_widget/widget/list_view2/item_list.dart';
import 'package:explore_widget/widget/list_view/user_model.dart';
import 'package:flutter/material.dart';

class ListView2Activity extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ListView2ActivityState();
}

class ListView2ActivityState extends State<ListView2Activity> {
  List<UserModel> data = [
    UserModel(1, "IK", "Ikhwan Koto", "Sistem Informasi"),
    UserModel(2, "PA", "Pake Arrayid", "Fisika"),
    UserModel(3, "RK", "Ryan Kimo", "Olah Raga"),
    UserModel(4, "AM", "Arif Mahran", "Biologi"),
    UserModel(5, "NH", "Nurrahman Hado", "Sistem Komputer"),
    UserModel(6, "AN", "Ade Nuri", "Psikologi"),
    UserModel(7, "FC", "Fitriani Chairi", "Ilmu Komputer"),
    UserModel(8, "EA", "Elsa Aprilio", "Teknik Mesin"),
    UserModel(9, "PC", "Putri Coti", "Teknik Industri"),
    UserModel(10, "SE", "Saputra Enriko", "Geografi"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Text(
          "ListView.Builder2",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: ListView.builder(
            padding: EdgeInsets.only(bottom: 24),
            itemCount: data.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                child: ItemUser(index, data[index]),
                onTap: (){onListClick(data[index]);},
              );
            }),
      ),
    );
  }

  onListClick(UserModel dataUser) {
    print("Data: " + dataUser.name);
  }
}
