import 'package:myapp/data/http/http_client.dart';
import 'package:myapp/data/models/user_model.dart';

abstract class IUsersRepository {
  Future<List<UserModel>> getUsers();
}

class UserRepository implements IUsersRepository {
  final IHttpClient clint;
  final url = 'https://reqres.in/api/users?page=2';

  UserRepository({required this.clint});

  @override
  Future<List<UserModel>> getUsers() async {
    final response = await clint.get(url: url);
    return response.map((map) => UserModel.fromMap(map)).toList();
  }
}
