import 'package:clean_architecture_getx/data/mapper/user_mapper.dart';
import 'package:clean_architecture_getx/data/network/requests/user_request.dart';
import 'package:clean_architecture_getx/data/repositories/user_repository_impl.dart';
import 'package:clean_architecture_getx/domain/entities/user_model.dart';

import 'base_user_repository_remote_impl.dart';

class UserRepositoryRemoteImpl extends BaseUserRepositoryRemoteImpl implements UserRepositoryRemote {

  UserRequest  _userRequest = UserRequest();
  @override
  Future<UserModel> getUser(String userId) {
    throw UnimplementedError();
  }

  @override
  Future<List<UserModel>> getUserList() async => _userRequest.getUserList().then((response) {
      handleError(response);
      return UserMapper.map(response.body).userList;
    });
}