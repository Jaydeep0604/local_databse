abstract class SharedDetailState {}

// class NoSharedDetailState extends SharedDetailState {}

class SharedDetailLoadingState extends SharedDetailState {
  @override
  List<Object?> get props => [];
}

class SharedDetailLoadedState extends SharedDetailState {
  @override
  List<Object?> get props => [];
}

class SharedDetailErrorState extends SharedDetailState {
  String msg;
  SharedDetailErrorState({required this.msg});
  @override
  List<Object?> get props => [msg];
  @override
  String toString() {
    return msg;
  }
}

class SharedDetailAddedSuccessState extends SharedDetailState {
  String msg;
  SharedDetailAddedSuccessState({required this.msg});
  @override
  List<Object?> get props => [msg];
}
class UpdateSharedDetailSuccessState extends SharedDetailState {
  String msg;
  UpdateSharedDetailSuccessState({required this.msg});
  @override
  List<Object?> get props => [msg];
}
class SharedDetailNotUpdatedState extends SharedDetailState {
  String msg;
  SharedDetailNotUpdatedState({required this.msg});
  @override
  List<Object?> get props => [msg];
}
class SharedDetailInitialState extends SharedDetailState {
  @override
  List<Object?> get props => [];
}
