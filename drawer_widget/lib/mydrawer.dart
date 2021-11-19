import 'package:flutter/material.dart';
import 'drawertitle.dart';
import 'mydivider.dart';
import 'mylisttile.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer();

  @override
  Widget build(BuildContext context) {
    return  ListView(
      children: [
        /*DrawerHeader(margin:const EdgeInsets.all( 0),padding : const EdgeInsets.fromLTRB(0,0,0,0),
            child: Column(
              children: [Icon(Icons.person), Text("mymailid@gmail.com")],
            )),*/
         Container(
            padding: const EdgeInsets.fromLTRB(0, 25, 0, 25),
            child:  Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [const Icon(Icons.person), const Text("mymailid@gmail.com")])),
        const DrawerTitle(text: "App Management"),
        const MyListTile(icon_name: Icon(Icons.settings), title: "Setting"),
        const MyListTile(icon_name: Icon(Icons.camera), title: "Camera"),
        const MyListTile(icon_name: Icon(Icons.wifi), title: "Network"),
        const MyDivider(),
        const DrawerTitle(text: "User Management"),
        const MyListTile(icon_name: Icon(Icons.password), title: "Password"),
        const MyListTile(icon_name: Icon(Icons.phone_rounded), title: "Phone"),
        const MyListTile(
            icon_name: Icon(Icons.picture_in_picture), title: "Picture"),
        const MyDivider(),
        const DrawerTitle(text: "About us"),
        const MyListTile(icon_name: const Icon(Icons.store), title: "Store"),
      ],
    );
  }
}
