import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_flutter/coffee/models/order_model.dart';
import 'package:test_flutter/coffee/viewmodels/databases/db_order.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  final DbOrder dbOrder;
  OrderCubit(this.dbOrder) : super(OrderInitial());

  Future<void> saveOrder(OrderModels orderModels) async {
    try {
      emit(OrderLoading());
      final total = orderModels.amount * 35000;
      final saveOrder = await dbOrder.addItem(OrderModels(
          id: orderModels.id,
          name: orderModels.name,
          amountBean: orderModels.amountBean,
          levelGrind: orderModels.levelGrind,
          levelSugar: orderModels.levelSugar,
          amount: orderModels.amount,
          total: total,
          status: 'Menunggu',
          serve: orderModels.serve));
      emit(SaveOrderLoaded(saveOrder: saveOrder));
    } catch (e) {
      emit(OrderFailed(e.toString()));
    }
  }

  Future<void> fetchOrder() async {
    try {
      emit(OrderLoading());
      final fetchOrder = await dbOrder.fetchData();
      emit(OrderLoaded(orderModels: fetchOrder));
    } catch (e) {
      emit(OrderFailed(e.toString()));
    }
  }

  Future<void> processOrder(OrderModels orderModels) async {
    try {
      emit(OrderLoading());
      final processOrder = await dbOrder.update(orderModels);
      emit(OrderUpdated(processOrder));
    } catch (e) {
      emit(OrderFailed(e.toString()));
    }
  }

  Future<void> deleteOrder(int id) async {
    try {
      emit(OrderLoading());
      final deleteOrder = await dbOrder.delete(id);
      emit(DeleteOrderLoaded(deleteOrder: deleteOrder));
    } catch (e) {
      emit(OrderFailed(e.toString()));
    }
  }
}
