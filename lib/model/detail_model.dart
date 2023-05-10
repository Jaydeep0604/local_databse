import 'package:hive/hive.dart';

part 'detail_model.g.dart';

@HiveType(typeId: 1)
class DetailModel {
  @HiveField(0)
  String? name;
  @HiveField(1)
  String? email;
  @HiveField(2)
  String? phone;
  @HiveField(3)
  String? address;
  DetailModel({this.name, this.email, this.phone, this.address});
}
