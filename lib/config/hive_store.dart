import 'package:hive/hive.dart';
import 'package:local_databases/model/detail_model.dart';
import 'package:rxdart/rxdart.dart';

class HiveStore {
  final userDetailKey = "user";
  final userId = "userId";
  DetailModel? detailModel;
  final PublishSubject<bool> _isSessionValid = PublishSubject<bool>();
  Stream<bool> get isSessionValid => _isSessionValid.stream;

  init() async {
    await Hive.openBox<DetailModel>(userDetailKey);
    await Hive.openBox<DetailModel>(userId);
  }

  Future logOut() async {
    try {
      await Hive.deleteBoxFromDisk(hiveStore.userDetailKey);
    } catch (e) {}
    try {
      await Hive.deleteBoxFromDisk(hiveStore.userId);
    } catch (e) {}
  }

  Future<bool> openSession(DetailModel userDetail) async {
    Box<DetailModel> userBox = Hive.box<DetailModel>(userDetailKey);
    userBox.put(userId, userDetail);
    // DownloadService.instance.changeScheduledTask(userData.accessToken);
    // downloadStore.updateDownloadTaskWithAccessToken(userData.accessToken);

    if (userBox.containsKey(userId)) {
      _isSessionValid.add(true);
      return true;
    } else {
      return false;
    }
  }

  Future<Box<DetailModel>?> isExistDetailModel() async {
    try {
      bool isBoxOpend = await Hive.boxExists(userDetailKey);
      if (isBoxOpend) {
        Box<DetailModel> detailBox = Hive.box(userDetailKey);
        return detailBox;
      }
      return null;
    } on HiveError {
      return null;
    }
  }

  DetailModel? getDetails() {
    Box<DetailModel> userDetailBox = Hive.box<DetailModel>(userDetailKey);
    DetailModel? data = userDetailBox.get(userId);
  }

  updateUserData(DetailModel detailModel) {
    Box<DetailModel> userDataBox = Hive.box<DetailModel>(userDetailKey);
    userDataBox.put(userId, detailModel);
  }

  removeUserData() async {
    Box<DetailModel>? userDataBox = await isExistDetailModel();
    userDataBox?.close();
  }
}

HiveStore hiveStore = HiveStore();
