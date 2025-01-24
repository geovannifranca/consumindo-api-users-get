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
        backgroundColor: Theme.of(context).primaryColorLight,
        title: Text(widget.title),
      ),
      body: AnimatedBuilder(
        animation: Listenable.merge([
          store.state,
          store.isLoading,
          store.erro,
        ]),
        builder: (context, widget) {
          if (store.isLoading.value) {
            return const CircularProgressIndicator();
          } else {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              child: ListView.separated(
                itemCount: store.state.value.length,
                separatorBuilder: (context, index) => const SizedBox(
                  height: 24,
                ),
                itemBuilder: (context, index) {
                  final item = store.state.value[index];
                  return Card(
                    color: Theme.of(context).primaryColorLight,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 40.0,
                                backgroundImage: NetworkImage(item.avatar),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${item.firstName} ${item.lastName}",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge
                                              ?.copyWith(
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                        Text(
                                          item.email,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall,
                                        )
                                      ],
                                    ),
                                    const Icon(Icons.verified_user_rounded),
                                    const SizedBox(
                                      width: 16,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}
