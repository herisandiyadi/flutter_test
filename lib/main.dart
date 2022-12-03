import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_flutter/coffee/pages/home_coffee.dart';
import 'package:test_flutter/coffee/pages/list_order.dart';
import 'package:test_flutter/coffee/pages/list_status_pesanan.dart';
import 'package:test_flutter/coffee/viewmodels/cubit/order_cubit.dart';
import 'package:test_flutter/coffee/viewmodels/databases/db_order.dart';
import 'package:test_flutter/homepage.dart';
import 'package:test_flutter/maps_features/pages/map_page.dart';
import 'package:test_flutter/test_api/pages/test_api.dart';
import 'package:test_flutter/test_api/viewmodels/cubit/users/users_cubit.dart';
import 'package:test_flutter/test_api/viewmodels/repositories/user_repository.dart';
import 'package:test_flutter/upload_features/pages/upload_pages.dart';
import 'package:test_flutter/upload_features/viewmodels/cubit/upload_cubit.dart';
import 'package:test_flutter/upload_features/viewmodels/repositories/upload_repository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => UsersCubit(UserRepository())),
        BlocProvider(create: (context) => UploadCubit(UploadRepository())),
        BlocProvider(create: (context) => OrderCubit(DbOrder())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Test',
        routes: {
          '/': (context) => const HomePage(),
          '/test-api': (context) => const TestApiPage(),
          '/upload': (context) => const UploadPage(),
          '/map': (context) => const MapPage(),
          '/coffee': (context) => const HomeCoffee(),
          '/list-order': (context) => const ListOrder(),
          '/list-status': (context) => const ListStatusOrder(),
        },
      ),
    );
  }
}
