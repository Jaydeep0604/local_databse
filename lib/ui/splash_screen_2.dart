import 'dart:async';
import 'package:flutter/material.dart';
import 'package:local_databases/config/shared_store.dart';
import 'package:local_databases/ui/shared_pref/shared_detail_screen.dart';
import 'package:local_databases/ui/shared_pref/shared_detail_view_screen.dart';

class SplashScreen2 extends StatefulWidget {
  const SplashScreen2({Key? key}) : super(key: key);

  @override
  State<SplashScreen2> createState() => _SplashScreen2State();
}

class _SplashScreen2State extends State<SplashScreen2> {
  void initState() {
    super.initState();
    Timer(Duration(milliseconds: 1200), () async {
      // Box<DetailModel>? detailModel = await sharedStore.isExistDetailModel();
      Map<String, dynamic> data = await sharedStore.getAllData();
      if (data.values.first != null) {
        Navigator.push(
            context,
            (MaterialPageRoute(
                builder: (context) => SharedDetailViewScreen())));
      }
      if (data.values.first == null)
        Navigator.pushReplacement(context,
            (MaterialPageRoute(builder: (context) => SharedDetailScreen())));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Shared Preferance Local Databases"),
      ),
    );
  }
}
