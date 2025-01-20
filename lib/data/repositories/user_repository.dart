import 'package:myapp/data/http/http_client.dart';
import 'package:myapp/data/models/user_model.dart';

abstract class IUsersRepository {
  Future<List<UserModel>> getUsers();
}

class UserRepository implements IUsersRepository {
  final IHttpClient client;

  UserRepository({
    required this.client,
  });

  @override
  Future<List<UserModel>> getUsers() async {
    final response =
        await client.get(url: 'https://reqres.in/api/users?page=2');
    final body = response.data;
    if (body.statusCode == 200) {
        final<List<UserModel>> 
    }
    
  }
}
