import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_databases/bloc/databse/detail_bloc/detail_event.dart';
import 'package:local_databases/bloc/databse/detail_bloc/detail_state.dart';
import 'package:local_databases/config/hive_store.dart';
import 'package:local_databases/model/detail_model.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  DetailBloc() : super(DetailInitialState()) {
    on<DetailSubmitEvent>(_onDetailSubmit);
    on<InitialDetailEvent>(_onInitialDetail);
    on<UpdateDetailSubmitEvent>(_onUpdateDetailSubmit);
  }
  _onDetailSubmit(DetailSubmitEvent event, Emitter<DetailState> emit) async {
    emit(DetailLoadingState());
    try {
      dynamic data;
      data = await event.userDataModel;

      bool isSessinOpen = await hiveStore.openSession(DetailModel(
          name: data.name,
          email: data.email,
          phone: data.phone,
          address: data.address));

      if (isSessinOpen) {
        print("data Added");
        emit(DetailAddedSuccessState(
          msg: "success",
        ));
      } else {
        print("data not added in hive");
      }
    } catch (e) {
      emit(
        DetailErrorState(
          msg: e.toString(),
        ),
      );
    }
  }

  _onUpdateDetailSubmit(DetailEvent event, Emitter<DetailState> emit) async {
    emit(DetailLoadingState());
    

  }

  _onInitialDetail(DetailEvent event, Emitter<DetailState> emit) async {}
}
