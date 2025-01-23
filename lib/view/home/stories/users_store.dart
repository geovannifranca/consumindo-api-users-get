import 'package:flutter/material.dart';
import 'package:myapp/data/models/user_model.dart';
import 'package:myapp/data/repositories/user_repository.dart';

class UsersStore {
  final IUsersRepository repository;

  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);

  final ValueNotifier<List<UserModel>> state =
      ValueNotifier<List<UserModel>>([]);
  final ValueNotifier<String> erro = ValueNotifier<String>('');

  UsersStore({required this.repository});

  Future getUsers() async {
    isLoading.value = true;
    try {
      final result = await repository.getUsers();
      state.value = result;
    } catch (e) {
      erro.value = e.toString();
    }
    isLoading.value = false;
  }
}
