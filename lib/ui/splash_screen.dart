import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:local_databases/config/hive_store.dart';
import 'package:local_databases/model/detail_model.dart';
import 'package:local_databases/ui/hive/detail_screen.dart';
import 'package:local_databases/ui/hive/detail_view_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
    Timer(Duration(milliseconds: 1200), () async {
      Box<DetailModel>? detailModel = await hiveStore.isExistDetailModel();
      if (detailModel!.values.isNotEmpty) {
        Navigator.push(context,
            (MaterialPageRoute(builder: (context) => DetailViewScreen())));
      }
      if (detailModel.values.isEmpty)
        Navigator.pushReplacement(
            context, (MaterialPageRoute(builder: (context) => DetailScreen())));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Hive Local Databases"),
      ),
    );
  }
}
