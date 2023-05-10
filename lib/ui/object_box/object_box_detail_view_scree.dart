import 'dart:math';

import 'package:flutter/material.dart';
import 'package:local_databases/config/object_box_store.dart';
import 'package:local_databases/ui/object_box/object_box_update_detail_screen.dart';

class ObjectBoxDetailViewScreen extends StatefulWidget {
  const ObjectBoxDetailViewScreen({Key? key}) : super(key: key);

  @override
  State<ObjectBoxDetailViewScreen> createState() =>
      _ObjectBoxDetailViewScreenState();
}

class _ObjectBoxDetailViewScreenState extends State<ObjectBoxDetailViewScreen> {
  String? name;
  String? email;
  String? phone;
  String? address;
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() async {
    var data = await objectBoxDetailStore.queryPerson(1);
    setState(() {
      name = data!.name;
      email = data.email;
      phone = data.phone;
      address = data.address;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        children: [
          SizedBox(
            height: 200,
          ),
          Text("Name is :: $name"),
          Text("E-mail is :: $email"),
          Text("Phone is :: $phone"),
          Text("Address is ::  $address"),
          SizedBox(
            height: 100,
          ),
          SizedBox(
            width: 150,
            child: TextButton(
                style: TextButton.styleFrom(backgroundColor: Colors.blueAccent),
                onPressed: () {
                  Navigator.push(
                      context,
                      (MaterialPageRoute(
                          builder: (context) => ObjectBoxEditDetailScreen())));
                },
                child: Text(
                  "Update",
                  style: TextStyle(color: Colors.white),
                )),
          ),
          SizedBox(
            width: 150,
            child: TextButton(
                style: TextButton.styleFrom(backgroundColor: Colors.blue[500]),
                onPressed: () {
                  // hiveStore.logOut();
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => DetailScreen()));
                },
                child: Text(
                  "Delete",
                  style: TextStyle(color: Colors.white),
                )),
          ),
        ],
      ),
    ));
  }
}
