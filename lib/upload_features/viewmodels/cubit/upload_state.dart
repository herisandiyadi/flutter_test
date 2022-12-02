part of 'upload_cubit.dart';

abstract class UploadState extends Equatable {
  const UploadState();

  @override
  List<Object> get props => [];
}

class UploadInitial extends UploadState {}

class UploadLoading extends UploadState {}

class UploadLoaded extends UploadState {
  final UploadResponse uploadResponse;
  const UploadLoaded(this.uploadResponse);
  @override
  List<Object> get props => [uploadResponse];
}

class UploadFailed extends UploadState {
  final String messages;
  const UploadFailed(this.messages);
  @override
  List<Object> get props => [messages];
}
