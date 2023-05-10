import 'package:rxdart/subjects.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedStore {
  final PublishSubject<bool> _isSessionValid = PublishSubject();
  Stream<bool> get isSessionValid => _isSessionValid.stream;

  Future<void> openSession(
    String name,
    String email,
    String phone,
    String address,
  ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', name);
    await prefs.setString('email', email);
    await prefs.setString('phone', phone);
    await prefs.setString('address', address);
    // bool session = await isSession();
    // if (session) {
    //   _isSessionValid.sink.add(true);
    // }
  }

  Future<Map<String, dynamic>> getAllData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    Map<String, dynamic> data = {};
    data['name'] = pref.getString("name");
    data['email'] = pref.getString("email");
    data['phone'] = pref.getString("phone");
    data['address'] = pref.getString("address");
    return data;
  }

  // Future<bool> isSession() async {
  //   String? sessionKey = await getSessionKey();
  //   if (sessionKey != "" && sessionKey != null) {
  //     return true;
  //   }
  //   return false;
  // }

  void logOut() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.remove('name');
    await pref.remove('email');
    await pref.remove('phone');
    await pref.remove('address');
  }
}

SharedStore sharedStore = SharedStore();
