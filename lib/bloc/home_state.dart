part of 'home_bloc.dart';

enum HomeStatus { initial, loading, success, error }

class HomeState extends Equatable {
  final HomeStatus status;
  final dynamic data;

  const HomeState({
    this.status = HomeStatus.initial,
    this.data,
  });

  HomeState copyWith({
    HomeStatus? status,
    dynamic data,
  }) {
    return HomeState(
      status: status ?? this.status,
      data: data ?? this.data,
    );
  }

  @override
  List<Object?> get props => [status, data];
}