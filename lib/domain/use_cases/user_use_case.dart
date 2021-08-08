
import 'package:clean_architecture_getx/domain/entities/user_model.dart';
import 'package:clean_architecture_getx/domain/repositories/user_repository.dart';

class UserUseCase {

  UserRepository _userRepository;
  UserUseCase(this._userRepository);

  Future<List<UserModel>> getUserList() {
    return _userRepository.getUserList();
  }
  Future<bool> deleteUser(String userId) {
    return _userRepository.deleteUser(userId);
  }
  Future<UserModel>  getUser(String userId) {
    return _userRepository.getUser(userId);
  }


}