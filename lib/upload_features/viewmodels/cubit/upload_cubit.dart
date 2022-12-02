import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_flutter/upload_features/models/upload_response.dart';
import 'package:test_flutter/upload_features/viewmodels/repositories/upload_repository.dart';

part 'upload_state.dart';

class UploadCubit extends Cubit<UploadState> {
  UploadRepository uploadRepository;
  UploadCubit(this.uploadRepository) : super(UploadInitial());

  Future<void> uploadFile(File file) async {
    emit(UploadLoading());
    try {
      final uploadResponse = await UploadRepository().uploadFile(file);
      emit(UploadLoaded(uploadResponse));
    } catch (e) {
      emit(UploadFailed(e.toString()));
    }
  }
}
