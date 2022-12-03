import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_flutter/coffee/models/order_model.dart';
import 'package:test_flutter/coffee/viewmodels/cubit/order_cubit.dart';
import 'package:test_flutter/constants/styles.dart';
import 'package:test_flutter/upload_features/pages/widgets/loading.dart';
import 'package:test_flutter/widgets/alert.dart';

class ListOrder extends StatefulWidget {
  const ListOrder({super.key});

  @override
  State<ListOrder> createState() => _ListOrderState();
}

class _ListOrderState extends State<ListOrder> {
  LoadingWidget loadingWidget = LoadingWidget();
  AlertWidget alertWidget = AlertWidget();
  @override
  void initState() {
    context.read<OrderCubit>().fetchOrder();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: brownColor,
        title: const Text('List Order'),
        centerTitle: true,
      ),
      backgroundColor: softBrownColor,
      body: BlocConsumer<OrderCubit, OrderState>(
        listener: (context, state) {
          if (state is OrderUpdated) {
            loadingWidget.loading(false, context);
            alertWidget.success(context, 'Order has been Done');
          }
        },
        builder: (context, state) {
          if (state is OrderInitial) {
            return const Center(
              child: Text('No Order'),
            );
          } else if (state is OrderLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is OrderLoaded) {
            return ListView.builder(
              itemCount: state.orderModels.length,
              itemBuilder: (context, index) {
                final data = state.orderModels[index];

                if (data.status == 'Menunggu') {
                  return Card(
                    child: ListTile(
                      title: Text('Nama Pemesan : ${data.name}'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('ID : ${data.id}'),
                          Text('Takar Kopi : ${data.amountBean}'),
                          Text('Takar Gula : ${data.levelSugar}'),
                          Text('Tingkat Giling : ${data.levelGrind}'),
                          Text('Penyajian : ${data.serve}'),
                          Text(
                            'Status : ${data.status}',
                            style: redTextSytle.copyWith(fontWeight: semiBold),
                          ),
                        ],
                      ),
                      trailing: SizedBox(
                        width: 100,
                        height: 100,
                        child: ElevatedButton(
                          onPressed: () {
                            context.read<OrderCubit>().processOrder(OrderModels(
                                id: data.id,
                                name: data.name,
                                amountBean: data.amountBean,
                                levelGrind: data.levelGrind,
                                levelSugar: data.levelSugar,
                                amount: data.amount,
                                total: data.total,
                                status: 'Done',
                                serve: data.serve));
                          },
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(brownColor)),
                          child: const Text('Process'),
                        ),
                      ),
                    ),
                  );
                } else {
                  return const SizedBox();
                }
              },
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
