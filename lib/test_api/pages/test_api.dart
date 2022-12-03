import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_flutter/constants/styles.dart';
import 'package:test_flutter/test_api/viewmodels/cubit/users/users_cubit.dart';

class TestApiPage extends StatefulWidget {
  const TestApiPage({super.key});

  @override
  State<TestApiPage> createState() => _TestApiPageState();
}

class _TestApiPageState extends State<TestApiPage> {
  void getData() async {
    final getUser = context.read<UsersCubit>();
    await getUser.getUser();
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: Container(
        margin: const EdgeInsets.all(20),
        child: BlocBuilder<UsersCubit, UsersState>(
          builder: (context, state) {
            if (state is UsersLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is UsersLoaded) {
              return ListView.builder(
                  itemCount: state.userResponse.data.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        leading: Image.network(
                            state.userResponse.data[index].avatar),
                        title: Text(
                            '${state.userResponse.data[index].firstName} ${state.userResponse.data[index].lastName}'),
                        subtitle: Text(state.userResponse.data[index].email),
                      ),
                    );
                  });
            } else if (state is UsersFailed) {
              return Center(
                child: Text(state.message),
              );
            } else {
              return const Center(
                child: Text('No Data'),
              );
            }
          },
        ),
      ),
    );
  }
}
