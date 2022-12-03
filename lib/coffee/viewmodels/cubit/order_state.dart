part of 'order_cubit.dart';

abstract class OrderState extends Equatable {
  const OrderState();

  @override
  List<Object> get props => [];
}

class OrderInitial extends OrderState {}

class OrderLoading extends OrderState {}

class OrderLoaded extends OrderState {
  final List<OrderModels> orderModels;

  const OrderLoaded({required this.orderModels});

  @override
  List<Object> get props => [orderModels];
}

class OrderFailed extends OrderState {
  final String message;
  const OrderFailed(this.message);
  @override
  List<Object> get props => [message];
}

class OrderUpdated extends OrderState {
  final int id;
  const OrderUpdated(this.id);
  @override
  List<Object> get props => [id];
}

class SaveOrderLoaded extends OrderState {
  final int saveOrder;

  const SaveOrderLoaded({required this.saveOrder});

  @override
  List<Object> get props => [saveOrder];
}

class DeleteOrderLoaded extends OrderState {
  final int deleteOrder;

  const DeleteOrderLoaded({required this.deleteOrder});

  @override
  List<Object> get props => [deleteOrder];
}
