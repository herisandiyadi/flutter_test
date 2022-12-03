import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_flutter/coffee/models/order_model.dart';
import 'package:test_flutter/coffee/viewmodels/cubit/order_cubit.dart';
import 'package:test_flutter/constants/styles.dart';
import 'package:test_flutter/widgets/alert.dart';

class HomeCoffee extends StatefulWidget {
  const HomeCoffee({super.key});

  @override
  State<HomeCoffee> createState() => _HomeCoffeeState();
}

class _HomeCoffeeState extends State<HomeCoffee> {
  String? _selectedBean;
  String? _selectedLevel;
  String? _selectedServe;
  String? _selectedSugar;
  TextEditingController nameController = TextEditingController();
  AlertWidget alertWidget = AlertWidget();

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  void modalBottomSheet(BuildContext context) {
    showModalBottomSheet(
        backgroundColor: softBrownColor,
        clipBehavior: Clip.hardEdge,
        context: context,
        builder: (context) {
          return SizedBox(
            height: 700,
            child: Padding(
              padding: const EdgeInsets.only(top: 20, left: 30, right: 30),
              child: ListView(
                children: [
                  Text(
                    'Isi Pesanan',
                    style:
                        darkTextStyle.copyWith(fontSize: 18, fontWeight: bold),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    controller: nameController,
                    autovalidateMode: AutovalidateMode.always,
                    decoration: InputDecoration(
                      labelText: 'Nama Pemesan',
                      labelStyle: darkTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Takaran Kopi',
                    style:
                        darkTextStyle.copyWith(fontSize: 14, fontWeight: bold),
                  ),
                  DropdownButtonFormField(
                    autovalidateMode: AutovalidateMode.always,
                    value: _selectedBean,
                    isExpanded: true,
                    onChanged: (value) {
                      setState(() {
                        _selectedBean = value;
                      });
                    },
                    onSaved: (value) {
                      setState(() {
                        _selectedBean = value;
                      });
                    },
                    items: const [
                      DropdownMenuItem(
                        value: '1 Sendok',
                        child: Text('1 Sendok'),
                      ),
                      DropdownMenuItem(
                        value: '2 Sendok',
                        child: Text('2 Sendok'),
                      ),
                      DropdownMenuItem(
                        value: '3 Sendok',
                        child: Text('3 Sendok'),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Tingkat Tekstur Kopi',
                    style:
                        darkTextStyle.copyWith(fontSize: 14, fontWeight: bold),
                  ),
                  DropdownButtonFormField(
                    autovalidateMode: AutovalidateMode.always,
                    value: _selectedLevel,
                    isExpanded: true,
                    onChanged: (value) {
                      setState(() {
                        _selectedLevel = value;
                      });
                    },
                    onSaved: (value) {
                      setState(() {
                        _selectedLevel = value;
                      });
                    },
                    items: const [
                      DropdownMenuItem(
                        value: 'Halus',
                        child: Text('Halus'),
                      ),
                      DropdownMenuItem(
                        value: 'Medium',
                        child: Text('Medium'),
                      ),
                      DropdownMenuItem(
                        value: 'Kasar',
                        child: Text('Kasar'),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Takaran Gula',
                    style:
                        darkTextStyle.copyWith(fontSize: 14, fontWeight: bold),
                  ),
                  DropdownButtonFormField(
                    autovalidateMode: AutovalidateMode.always,
                    value: _selectedSugar,
                    isExpanded: true,
                    onChanged: (value) {
                      setState(() {
                        _selectedSugar = value;
                      });
                    },
                    onSaved: (value) {
                      setState(() {
                        _selectedSugar = value;
                      });
                    },
                    items: const [
                      DropdownMenuItem(
                        value: 'No Sugar',
                        child: Text('No Sugar'),
                      ),
                      DropdownMenuItem(
                        value: 'Less Sugar',
                        child: Text('Less Sugar'),
                      ),
                      DropdownMenuItem(
                        value: 'Medium Sugar',
                        child: Text('Medium Sugar'),
                      ),
                      DropdownMenuItem(
                        value: 'More Sugar',
                        child: Text('More Sugar'),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Penyajian Pesanan',
                    style:
                        darkTextStyle.copyWith(fontSize: 14, fontWeight: bold),
                  ),
                  DropdownButtonFormField(
                    autovalidateMode: AutovalidateMode.always,
                    value: _selectedServe,
                    isExpanded: true,
                    onChanged: (value) {
                      setState(() {
                        _selectedServe = value;
                      });
                    },
                    onSaved: (value) {
                      setState(() {
                        _selectedServe = value;
                      });
                    },
                    items: const [
                      DropdownMenuItem(
                        value: 'Take Away',
                        child: Text('Take Away'),
                      ),
                      DropdownMenuItem(
                        value: 'Dine in',
                        child: Text('Dine in'),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    height: 45,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          brownColor,
                        ),
                      ),
                      onPressed: () {
                        final saveOrder = context.read<OrderCubit>();
                        saveOrder.saveOrder(OrderModels(
                            name: nameController.text,
                            amountBean: _selectedBean!,
                            levelGrind: _selectedLevel!,
                            levelSugar: _selectedSugar!,
                            amount: 1,
                            status: 'On Progress',
                            serve: _selectedServe!));

                        Navigator.pop(context);
                      },
                      child: Text(
                        'Save',
                        style: whiteTextStyle.copyWith(
                          fontSize: 14,
                          fontWeight: bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  )
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: brownColor,
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
        child: Column(
          children: [
            Text(
              'The Beans and Cardboard Cup',
              textAlign: TextAlign.center,
              style:
                  whiteTextStyle.copyWith(fontSize: 20, fontWeight: semiBold),
            ),
            const SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {
                modalBottomSheet(context);
              },
              child: Container(
                height: 150,
                width: 150,
                decoration: const BoxDecoration(
                    color: softBrownColor,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.local_cafe_outlined,
                      color: brownColor,
                      size: 50,
                    ),
                    Text(
                      'Order Latte',
                      textAlign: TextAlign.center,
                      style: brownTextSytle.copyWith(
                          fontSize: 24, fontWeight: semiBold),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/list-status');
              },
              child: Container(
                height: 55,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: softBrownColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Check Status Pesanan',
                    textAlign: TextAlign.center,
                    style: brownTextSytle.copyWith(
                        fontSize: 20, fontWeight: semiBold),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            const Divider(
              color: softBrownColor,
              thickness: 5,
            ),
            const SizedBox(
              height: 50,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed('/list-order');
              },
              child: Container(
                height: 150,
                width: 150,
                decoration: const BoxDecoration(
                    color: softBrownColor,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.assignment,
                      color: brownColor,
                      size: 50,
                    ),
                    Text(
                      'List Order',
                      textAlign: TextAlign.center,
                      style: brownTextSytle.copyWith(
                          fontSize: 24, fontWeight: semiBold),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
