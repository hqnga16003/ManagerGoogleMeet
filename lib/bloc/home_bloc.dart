import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_database/firebase_database.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final FirebaseDatabase _firebaseDatabase;

  HomeBloc({required FirebaseDatabase firebaseDatabase})
      : _firebaseDatabase = firebaseDatabase,
        super(HomeState.initial()) {
    on<HomeLoadData>(_onHomeLoadData);
  }

  Future<void> _onHomeLoadData(
    HomeLoadData event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(status: HomeStatus.loading));

    try {
      DataSnapshot snapshot = await _firebaseDatabase.reference().child('data').once();
      var data = snapshot.value;
      emit(state.copyWith(status: HomeStatus.success, data: data));
    } catch (err) {
      emit(state.copyWith(status: HomeStatus.error));
    }
  }

  @override
  Future<void> close() {
    // Any cleanup logic if needed
    return super.close();
  }
}
