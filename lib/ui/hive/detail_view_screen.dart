import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:local_databases/config/hive_store.dart';
import 'package:local_databases/model/detail_model.dart';
import 'package:local_databases/ui/hive/detail_screen.dart';
import 'package:local_databases/ui/hive/edit_detail_screen.dart';

class DetailViewScreen extends StatefulWidget {
  const DetailViewScreen({Key? key}) : super(key: key);

  @override
  State<DetailViewScreen> createState() => _DetailViewScreenState();
}

class _DetailViewScreenState extends State<DetailViewScreen> {
  // void initState() async {
  //   super.initState();
  //   Box<DetailModel>? detail = await hiveStore.isExistDetailModel();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ValueListenableBuilder(
              valueListenable:
                  Hive.box<DetailModel>(hiveStore.userDetailKey).listenable(),
              builder: (BuildContext context, dynamic box, Widget? child) {
                DetailModel? detail = box.get(hiveStore.userId);
                return Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 200,
                      ),
                      Text("Name is ::  ${detail?.name ?? '--'}"),
                      Text("E-mail is ::  ${detail?.email ?? '--'}"),
                      Text("Phone is :: ${detail?.phone ?? '--'}"),
                      Text("Address is ::  ${detail?.address ?? '--'}"),
                      SizedBox(
                        height: 100,
                      ),
                      SizedBox(
                        width: 150,
                        child: TextButton(
                            style: TextButton.styleFrom(
                                backgroundColor: Colors.blueAccent),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  (MaterialPageRoute(
                                      builder: (context) =>
                                          EditDetailScreen())));
                            },
                            child: Text(
                              "Update",
                              style: TextStyle(color: Colors.white),
                            )),
                      ),
                      SizedBox(
                        width: 150,
                        child: TextButton(
                            style: TextButton.styleFrom(
                                backgroundColor: Colors.blue[500]),
                            onPressed: () {
                              hiveStore.logOut();
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DetailScreen()));
                            },
                            child: Text(
                              "Delete",
                              style: TextStyle(color: Colors.white),
                            )),
                      ),
                    ],
                  ),
                );
              }
              //   child: Center(
              // child: Column(
              //   children: [
              //     Text("Name is ::  ${detail?.name ?? '--'}"),
              //     Text("E-mail is ::  ${detail?.email ?? '--'}"),
              //     Text("Phone is :: ${detail?.phone ?? '--'}"),
              //     Text("Address is ::  ${detail?.address ?? '--'}")
              //   ],
              // ),
              )),
    );
  }
}
