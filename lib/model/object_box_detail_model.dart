import 'package:objectbox/objectbox.dart';

@Entity()
class ObjectBoxDetailModel {
  static late Store obStore;

  int? id;
  String? name;
  String? email;
  String? phone;
  String? address;
  ObjectBoxDetailModel(
      {this.id, this.name, this.email, this.phone, this.address});

  static getStore() {
    return obStore;
  }
}
