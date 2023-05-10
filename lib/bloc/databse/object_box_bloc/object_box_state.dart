abstract class ObjectBoxDetailState {}

// class NoObjectBoxDetailState extends ObjectBoxDetailState {}

class ObjectBoxDetailLoadingState extends ObjectBoxDetailState {
  @override
  List<Object?> get props => [];
}

class ObjectBoxDetailLoadedState extends ObjectBoxDetailState {
  @override
  List<Object?> get props => [];
}

class ObjectBoxDetailErrorState extends ObjectBoxDetailState {
  String msg;
  ObjectBoxDetailErrorState({required this.msg});
  @override
  List<Object?> get props => [msg];
  @override
  String toString() {
    return msg;
  }
}

class ObjectBoxDetailAddedSuccessState extends ObjectBoxDetailState {
  String msg;
  ObjectBoxDetailAddedSuccessState({required this.msg});
  @override
  List<Object?> get props => [msg];
}
class UpdateObjectBoxDetailSuccessState extends ObjectBoxDetailState {
  String msg;
  UpdateObjectBoxDetailSuccessState({required this.msg});
  @override
  List<Object?> get props => [msg];
}
class ObjectBoxDetailNotUpdatedState extends ObjectBoxDetailState {
  String msg;
  ObjectBoxDetailNotUpdatedState({required this.msg});
  @override
  List<Object?> get props => [msg];
}
class ObjectBoxDetailInitialState extends ObjectBoxDetailState {
  @override
  List<Object?> get props => [];
}
