import 'package:bloc/bloc.dart';
import 'package:local_databases/bloc/databse/object_box_bloc/object_box_event.dart';
import 'package:local_databases/bloc/databse/object_box_bloc/object_box_state.dart';
import 'package:local_databases/config/object_box_store.dart';
import 'package:local_databases/model/detail_model.dart';
import 'package:local_databases/model/object_box_detail_model.dart';
import 'package:local_databases/model/user_data_model.dart';
import 'package:local_databases/objectbox.g.dart';

class ObjectBoxDetailBloc
    extends Bloc<ObjectBoxDetailEvent, ObjectBoxDetailState> {
  ObjectBoxDetailBloc() : super(ObjectBoxDetailInitialState()) {
    on<ObjectBoxDetailSubmitEvent>(_onObjectBoxDetailSubmit);
    on<InitialObjectBoxDetailEvent>(_onInitialObjectBoxDetail);
    on<UpdateObjectBoxDetailSubmitEvent>(_onUpdateObjectBoxDetailSubmit);
  }
  _onObjectBoxDetailSubmit(ObjectBoxDetailSubmitEvent event,
      Emitter<ObjectBoxDetailState> emit) async {
    emit(ObjectBoxDetailLoadingState());
    try {
      dynamic data;
      data = await event.userDataModel;

      bool isSessinOpen = (await objectBoxDetailStore.openSession(
          ObjectBoxDetailModel(
              name: data.name,
              email: data.email,
              phone: data.phone,
              address: data.address))) as bool;
      if (isSessinOpen) {
        print("data Added");
        emit(ObjectBoxDetailAddedSuccessState(
          msg: "success",
        ));
      } else {
        print("data not added in hive");
      }
    } catch (e) {
      emit(
        ObjectBoxDetailErrorState(
          msg: e.toString(),
        ),
      );
    }
  }

  _onUpdateObjectBoxDetailSubmit(
      ObjectBoxDetailEvent event, Emitter<ObjectBoxDetailState> emit) async {
    emit(ObjectBoxDetailLoadingState());
  }

  _onInitialObjectBoxDetail(
      ObjectBoxDetailEvent event, Emitter<ObjectBoxDetailState> emit) async {}
}
