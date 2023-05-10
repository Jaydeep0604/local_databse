import 'dart:io';
import 'package:local_databases/model/object_box_detail_model.dart';
import 'package:local_databases/objectbox.g.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rxdart/subjects.dart';

class ObjectBoxDetailStore {
  late final Store store;
  late final Box<ObjectBoxDetailModel> objectBox;

  final userDetailKey = "user";
  final userId = "userId";

  final PublishSubject<bool> _isSessionValid = PublishSubject<bool>();
  Stream<bool> get isSessionValid => _isSessionValid.stream;

  init() async {
    await Box<ObjectBoxDetailModel>(store);
    store;
    // await Box<ObjectBoxDetailModel>(objectBox);
  }

  static Future<Directory> create() async {
    final docsDir = await getApplicationDocumentsDirectory();
    return docsDir;
  }

  Future openSession(ObjectBoxDetailModel objectBoxDetailModel) async {
    var store = await ObjectBoxDetailModel.getStore();
    var box = await store.box<ObjectBoxDetailModel>(userDetailKey);
    box.put(objectBoxDetailModel);
    if (box.contains(objectBoxDetailModel.id!)) {
      _isSessionValid.add(true);
      return true;
    } else {
      return false;
    }
  }
  // Future<int> openSession(ObjectBoxDetailModel objectBoxDetailModel) async {
  //   var store = await openStore();
  //   var box = store.box<ObjectBoxDetailModel>();
  //   return box.put(objectBoxDetailModel);
  // }

  Future<bool> delete(int id) async {
    var store = await ObjectBoxDetailModel.getStore();
    var box = store.box<ObjectBoxDetailModel>(userDetailKey);
    return box.remove(id);
  }

  Future<ObjectBoxDetailModel?> queryPerson(int id) async {
    var store = await ObjectBoxDetailModel.getStore();
    var box = store.box<ObjectBoxDetailModel>(userDetailKey);
    return box.get(id);
  }

  // Future deleteSession() async {
  //   var store = await openStore();
  //   var box = await store.box<ObjectBoxDetailModel>();
  //   box.remove;
  // }

  // Future getSession() async {
  //   var store = await openStore();
  //   var box = await store.box<ObjectBoxDetailModel>();
  //   box.get;
  // }
  // Future<Box<ObjectBoxDetailModel>?> isExistDetailModel() async {
  //   try {
  //     bool isBoxOpend = await Box.boxExists(userDetailKey);
  //     if (isBoxOpend) {
  //       Box<DetailModel> detailBox = Hive.box(userDetailKey);
  //       return detailBox;
  //     }
  //     return null;
  //   } on HiveError {
  //     return null;
  //   }
  // }
}

ObjectBoxDetailStore objectBoxDetailStore = ObjectBoxDetailStore();
