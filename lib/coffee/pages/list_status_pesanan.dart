import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_flutter/coffee/models/order_model.dart';
import 'package:test_flutter/coffee/viewmodels/cubit/order_cubit.dart';
import 'package:test_flutter/constants/styles.dart';
import 'package:test_flutter/upload_features/pages/widgets/loading.dart';
import 'package:test_flutter/widgets/alert.dart';

class ListStatusOrder extends StatefulWidget {
  const ListStatusOrder({super.key});

  @override
  State<ListStatusOrder> createState() => _ListStatusOrderState();
}

class _ListStatusOrderState extends State<ListStatusOrder> {
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
        title: const Text('List Status Order'),
        centerTitle: true,
      ),
      backgroundColor: softBrownColor,
      body: BlocBuilder<OrderCubit, OrderState>(
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

                if (data.status == 'Done') {
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
                            style:
                                greenTextStyle.copyWith(fontWeight: semiBold),
                          ),
                        ],
                      ),
                      trailing: SizedBox(
                        width: 100,
                        height: 100,
                        child: ElevatedButton(
                          onPressed: () async {
                            if (data.serve == 'Take Away') {
                              alertWidget.customAlert(
                                  context,
                                  'Silahkan Ambil Pesanan Anda',
                                  'assets/images/cardcoffee.png');
                            } else {
                              alertWidget.customAlert(
                                  context,
                                  'Pesanan Anda Akan Segera Kami Antar',
                                  'assets/images/cupcoffee.png');
                            }
                            context.read<OrderCubit>().deleteOrder(data.id!);
                            await context.read<OrderCubit>().fetchOrder();
                          },
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(brownColor)),
                          child: const Text('Ambil'),
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
