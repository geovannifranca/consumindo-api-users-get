import 'package:flutter/material.dart';
import 'package:myapp/data/http/http_client.dart';
import 'package:myapp/data/repositories/user_repository.dart';
import 'package:myapp/view/home/stories/users_store.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final store = UsersStore(repository: UserRepository(clint: DioClient()));
  @override
  void initState() {
    store.getUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: AnimatedBuilder(
        animation: Listenable.merge([
          store.state,
          store.isLoading,
          store.erro,
        ]),
        builder: (context, widget) {
          return ListView.separated(
            itemCount: store.state.value.length,
            separatorBuilder: (context, index) => const SizedBox(
              height: 8.0,
            ),
            itemBuilder: (context, index) {
              final item = store.state.value[index];
              return Center(child: Text(item.firstName));
            },
          );
        },
      ),
    );
  }
}
