import 'package:equatable/equatable.dart';
import 'package:local_databases/model/user_data_model.dart';

abstract class ObjectBoxDetailEvent extends Equatable{}

class ObjectBoxDetailSubmitEvent extends ObjectBoxDetailEvent{
  UserDataModel? userDataModel;
  ObjectBoxDetailSubmitEvent({required this.userDataModel});
  @override
  List<Object?> get props => [userDataModel];
}
class UpdateObjectBoxDetailSubmitEvent extends ObjectBoxDetailEvent{
  UserDataModel? userDataModel;
  UpdateObjectBoxDetailSubmitEvent({required this.userDataModel});
  @override
  List<Object?> get props => [userDataModel];
}
class InitialObjectBoxDetailEvent extends ObjectBoxDetailEvent{
  String? msg;
  InitialObjectBoxDetailEvent({required this.msg});
  @override
  List<Object?> get props => [msg];
}