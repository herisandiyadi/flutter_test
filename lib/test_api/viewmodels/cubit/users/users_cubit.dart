import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_flutter/test_api/models/users_response.dart';
import 'package:test_flutter/test_api/viewmodels/repositories/user_repository.dart';

part 'users_state.dart';

class UsersCubit extends Cubit<UsersState> {
  UserRepository userRepository;
  UsersCubit(this.userRepository) : super(UsersInitial());

  Future<void> getUser() async {
    emit(UsersLoading());
    try {
      final userResponse = await UserRepository().getUser();
      emit(UsersLoaded(userResponse));
    } catch (e) {
      emit(UsersFailed(e.toString()));
    }
  }
}
