import 'package:clean_architecture_getx/domain/entities/user_model.dart';
import 'package:clean_architecture_getx/domain/repositories/user_repository.dart';

class UserRepositoryImpl extends UserRepository{

  UserRepositoryRemote _userRepositoryRemote;
  UserRepositoryCache _userRepositoryCache;

  UserRepositoryImpl(this._userRepositoryRemote, this._userRepositoryCache);

  @override
  Future<bool> deleteUser(String userId) {
    return _userRepositoryCache.deleteUser(userId);
  }

  @override
  Future<UserModel> getUser(String userId) {
    return _userRepositoryRemote.getUser(userId);
  }

  @override
  Future<List<UserModel>> getUserList() {
    return _userRepositoryRemote.getUserList();
  }
}

abstract class UserRepositoryRemote {
  Future<UserModel> getUser(String userId);
  Future<List<UserModel>> getUserList();
}
abstract class UserRepositoryCache {
  Future<bool> deleteUser(String userId);
}