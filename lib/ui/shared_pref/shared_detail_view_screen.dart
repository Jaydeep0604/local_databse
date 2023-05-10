import 'package:flutter/material.dart';
import 'package:local_databases/config/shared_store.dart';
import 'package:local_databases/ui/shared_pref/shared_detail_screen.dart';
import 'package:local_databases/ui/shared_pref/shared_edit_detail_screen.dart';

class SharedDetailViewScreen extends StatefulWidget {
  const SharedDetailViewScreen({Key? key}) : super(key: key);

  @override
  State<SharedDetailViewScreen> createState() => _SharedDetailViewScreenState();
}

class _SharedDetailViewScreenState extends State<SharedDetailViewScreen> {
  String? _name;
  String? _email;
  String? _phone;
  String? _address;
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final pref = await sharedStore.getAllData();
    setState(() {
      _name = pref['name'];
      _email = pref['email'];
      _phone = pref['phone'];
      _address = pref['address'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          children: [
            SizedBox(
              height: 200,
            ),
            Text("Name is :: ${_name}"),
            Text("E-mail is :: ${_email}"),
            Text("Phone is :: ${_phone}"),
            Text("Address is :: ${_address}"),
            SizedBox(
              height: 100,
            ),
            SizedBox(
              width: 150,
              child: TextButton(
                  style:
                      TextButton.styleFrom(backgroundColor: Colors.blueAccent),
                  onPressed: () {
                    Navigator.push(
                        context,
                        (MaterialPageRoute(
                            builder: (context) => SharedEditDetailScreen())));
                  },
                  child: Text(
                    "Update",
                    style: TextStyle(color: Colors.white),
                  )),
            ),
            SizedBox(
              width: 150,
              child: TextButton(
                  style:
                      TextButton.styleFrom(backgroundColor: Colors.blue[500]),
                  onPressed: () {
                    sharedStore.logOut();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SharedDetailScreen()));
                  },
                  child: Text(
                    "Delete",
                    style: TextStyle(color: Colors.white),
                  )),
            ),
            
          ],
        ),
      )),
    );
  }
}
