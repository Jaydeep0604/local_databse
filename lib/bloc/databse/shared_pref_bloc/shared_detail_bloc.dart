import 'package:bloc/bloc.dart';
import 'package:local_databases/bloc/databse/shared_pref_bloc/shared_detail_event.dart';
import 'package:local_databases/bloc/databse/shared_pref_bloc/shared_detail_state.dart';
import 'package:local_databases/config/shared_store.dart';

class SharedDetailBloc extends Bloc<SharedDetailEvent, SharedDetailState> {
  SharedDetailBloc() : super(SharedDetailInitialState()) {
    on<SharedDetailSubmitEvent>(_onSharedDetailSubmit);
    on<InitialSharedDetailEvent>(_onInitialSharedDetail);
    on<UpdateSharedDetailSubmitEvent>(_onUpdateSharedDetailSubmit);
  }
  _onSharedDetailSubmit(
      SharedDetailSubmitEvent event, Emitter<SharedDetailState> emit) async {
    emit(SharedDetailLoadingState());
    try {
      dynamic data;
      data = await event.userDataModel;

      await sharedStore.openSession(
          data.name, 
          data.email, 
          data.phone, 
          data.address);
      emit(SharedDetailAddedSuccessState(
        msg: "success",
      ));
    } catch (e) {
      emit(
        SharedDetailErrorState(
          msg: e.toString(),
        ),
      );
    }
  }

  _onUpdateSharedDetailSubmit(
      SharedDetailEvent event, Emitter<SharedDetailState> emit) async {
    emit(SharedDetailLoadingState());
  }

  _onInitialSharedDetail(
      SharedDetailEvent event, Emitter<SharedDetailState> emit) async {}
}
