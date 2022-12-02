part of 'users_cubit.dart';

abstract class UsersState extends Equatable {
  const UsersState();

  @override
  List<Object> get props => [];
}

class UsersInitial extends UsersState {}

class UsersLoading extends UsersState {}

class UsersLoaded extends UsersState {
  final UserResponse userResponse;
  const UsersLoaded(this.userResponse);
  @override
  List<Object> get props => [userResponse];
}

class UsersFailed extends UsersState {
  final String message;

  const UsersFailed(this.message);
  @override
  List<Object> get props => [message];
}
