import 'package:get_storage/get_storage.dart';
import 'package:twigconnect/features/auth/data/models/users_model.dart';

abstract class GetUsersLocalDataSource {
  Future<UserModel> getCachedUsers();

  Future<void> cacheUsers(UserModel cacheUser);
}

class GetUsersLocalDataSourceImpl implements GetUsersLocalDataSource {
  GetUsersLocalDataSourceImpl({required this.localStorage});

  final GetStorage localStorage;

  @override
  Future<void> cacheUsers(UserModel cacheUser) {
    return localStorage.write("users", cacheUser.toJson());
  }

  @override
  Future<UserModel> getCachedUsers() {
    final jsonUsers = localStorage.read("users");
    if (jsonUsers != null) {
      return Future.value(UserModel.fromRawJson(jsonUsers));
    } else {
      throw " Cache Error ";
    }
  }
}
