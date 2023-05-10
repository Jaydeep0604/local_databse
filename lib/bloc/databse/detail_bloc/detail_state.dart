abstract class DetailState {}

// class NoDetailState extends DetailState {}

class DetailLoadingState extends DetailState {
  @override
  List<Object?> get props => [];
}

class DetailLoadedState extends DetailState {
  @override
  List<Object?> get props => [];
}

class DetailErrorState extends DetailState {
  String msg;
  DetailErrorState({required this.msg});
  @override
  List<Object?> get props => [msg];
  @override
  String toString() {
    return msg;
  }
}

class DetailAddedSuccessState extends DetailState {
  String msg;
  DetailAddedSuccessState({required this.msg});
  @override
  List<Object?> get props => [msg];
}
class UpdateDetailSuccessState extends DetailState {
  String msg;
  UpdateDetailSuccessState({required this.msg});
  @override
  List<Object?> get props => [msg];
}
class DetailNotUpdatedState extends DetailState {
  String msg;
  DetailNotUpdatedState({required this.msg});
  @override
  List<Object?> get props => [msg];
}
class DetailInitialState extends DetailState {
  @override
  List<Object?> get props => [];
}
