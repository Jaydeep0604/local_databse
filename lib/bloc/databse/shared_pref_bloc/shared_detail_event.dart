import 'package:equatable/equatable.dart';
import 'package:local_databases/model/user_data_model.dart';

abstract class SharedDetailEvent extends Equatable{}

class SharedDetailSubmitEvent extends SharedDetailEvent{
  UserDataModel? userDataModel;
  SharedDetailSubmitEvent({required this.userDataModel});
  @override
  List<Object?> get props => [userDataModel];
}
class UpdateSharedDetailSubmitEvent extends SharedDetailEvent{
  UserDataModel? userDataModel;
  UpdateSharedDetailSubmitEvent({required this.userDataModel});
  @override
  List<Object?> get props => [userDataModel];
}
class InitialSharedDetailEvent extends SharedDetailEvent{
  String? msg;
  InitialSharedDetailEvent({required this.msg});
  @override
  List<Object?> get props => [msg];
}