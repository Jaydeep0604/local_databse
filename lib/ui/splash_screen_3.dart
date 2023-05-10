import 'dart:async';
import 'package:flutter/material.dart';
import 'package:local_databases/config/object_box_store.dart';
import 'package:local_databases/model/object_box_detail_model.dart';
import 'package:local_databases/ui/object_box/object_box_detail_screen.dart';
import 'package:local_databases/ui/object_box/object_box_detail_view_scree.dart';

class SplashScreen3 extends StatefulWidget {
  const SplashScreen3({Key? key}) : super(key: key);

  @override
  State<SplashScreen3> createState() => _SplashScreen3State();
}

class _SplashScreen3State extends State<SplashScreen3> {
  void initState() {
    super.initState();
    Timer(Duration(milliseconds: 1200), () async {
      // Box<ObjectBoxDetailModel> objectModel =
      //     (await objectBoxDetailStore.queryPerson(1));
      ObjectBoxDetailModel? data =
          (await objectBoxDetailStore.queryPerson(1));
      if (data?.email != "") {
        Navigator.push(
            context,
            (MaterialPageRoute(
                builder: (context) => ObjectBoxDetailViewScreen())));
      }
      if (data?.email == null)
        Navigator.pushReplacement(context,
            (MaterialPageRoute(builder: (context) => ObjectBoxDetailScreen())));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("ObjectBox Local Databases"),
      ),
    );
  }
}
