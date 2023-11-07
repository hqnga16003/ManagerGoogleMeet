import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'login_auth_event.dart';
part 'login_auth_state.dart';

class LoginAuthBloc extends Bloc<LoginAuthEvent, LoginAuthState> {
  final FirebaseAuth _firebaseAuth;

  LoginAuthBloc({
    required FirebaseAuth firebaseAuth,
  })  : _firebaseAuth = firebaseAuth,
        super(const LoginAuthState());

  on<LoginAuthStarted>(_onLoginAuthStarted);
  on<LoginAuthEmailChanged>(_onLoginAuthEmailChanged);
  on<LoginAuthPasswordChanged>(_onLoginAuthPasswordChanged);
  on<LoginAuthSubmitted>(_onLoginAuthSubmitted);

  Future<void> _onLoginAuthStarted(
    LoginAuthStarted event,
    Emitter<LoginAuthState> emit,
  ) async {
    emit(state.copyWith(status: 'initial'));
  }

  Future<void> _onLoginAuthEmailChanged(
    LoginAuthEmailChanged event,
    Emitter<LoginAuthState> emit,
  ) async {
    emit(state.copyWith(email: event.email));
  }

  Future<void> _onLoginAuthPasswordChanged(
    LoginAuthPasswordChanged event,
    Emitter<LoginAuthState> emit,
  ) async {
    emit(state.copyWith(password: event.password));
  }

  Future<void> _onLoginAuthSubmitted(
    LoginAuthSubmitted event,
    Emitter<LoginAuthState> emit,
  ) async {
    emit(state.copyWith(status: 'loading'));
    try {
      await _firebaseAuth.signInWithEmailAndPassword(email: state.email, password: state.password);
      emit(state.copyWith(status: 'success'));
    } catch (e) {
      emit(state.copyWith(status: 'failure', errorMessage: e.toString()));
    }
  }

  @override
  Future<void> close() {
    return super.close();
  }
}