import 'package:flutter/material.dart';
import 'package:local_databases/ui/splash_screen.dart';
import 'package:local_databases/ui/splash_screen_2.dart';
import 'package:local_databases/ui/splash_screen_3.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 200,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 55, right: 55),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.greenAccent),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SplashScreen()));
                    },
                    child: Text(
                      "Hive",
                      style: TextStyle(color: Colors.black),
                    )),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 55, right: 55),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.greenAccent),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SplashScreen2()));
                    },
                    child: Text(
                      "Shared Preferences",
                      style: TextStyle(color: Colors.black),
                    )),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 55, right: 55),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.greenAccent),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SplashScreen3()));
                    },
                    child: Text(
                      "Object Box",
                      style: TextStyle(color: Colors.black),
                    )),
              ),
            )
          ],
        ),
      )),
    );
  }
}
