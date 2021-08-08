import 'package:clean_architecture_getx/domain/entities/user_model.dart';

abstract class UserRepository{

  Future<List<UserModel>> getUserList();
  Future<bool> deleteUser(String userId);
  Future<UserModel> getUser(String userId);
}