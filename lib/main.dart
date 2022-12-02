import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_flutter/homepage.dart';
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
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Test',
        routes: {
          '/': (context) => const HomePage(),
          '/test-api': (context) => const TestApiPage(),
          '/upload': (context) => const UploadPage(),
        },
      ),
    );
  }
}
