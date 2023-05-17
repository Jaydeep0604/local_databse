import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_databases/bloc/databse/detail_bloc/detail_bloc.dart';
import 'package:local_databases/bloc/databse/object_box_bloc/object_box_bloc.dart';
import 'package:local_databases/bloc/databse/shared_pref_bloc/shared_detail_bloc.dart';
import 'package:local_databases/config/hive_store.dart';
import 'package:local_databases/model/detail_model.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:local_databases/ui/home_screen.dart';
// import 'model/object_box_detail_model.dart';

// late ObjectBoxDetailModel objectBoxDetailModel;

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(DetailModelAdapter());
  await hiveStore.init();

  WidgetsFlutterBinding.ensureInitialized();
  //objectBoxDetailModel = (await objectBoxDetailStore.init());
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => DetailBloc(),
        ),
        BlocProvider(create: (context) => SharedDetailBloc()),
        BlocProvider(create: (context) => ObjectBoxDetailBloc())
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}
