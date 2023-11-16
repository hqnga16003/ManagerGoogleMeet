part of 'home_bloc.dart';

import 'package:equatable/equatable.dart';

class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class HomeLoadData extends HomeEvent {
  const HomeLoadData();
}
