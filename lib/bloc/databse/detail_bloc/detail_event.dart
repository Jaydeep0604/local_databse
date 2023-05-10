import 'package:equatable/equatable.dart';
import 'package:local_databases/model/user_data_model.dart';

abstract class DetailEvent extends Equatable{}

class DetailSubmitEvent extends DetailEvent{
  UserDataModel? userDataModel;
  DetailSubmitEvent({required this.userDataModel});
  @override
  List<Object?> get props => [userDataModel];
}
class UpdateDetailSubmitEvent extends DetailEvent{
  UserDataModel? userDataModel;
  UpdateDetailSubmitEvent({required this.userDataModel});
  @override
  List<Object?> get props => [userDataModel];
}
class InitialDetailEvent extends DetailEvent{
  String? msg;
  InitialDetailEvent({required this.msg});
  @override
  List<Object?> get props => [msg];
}