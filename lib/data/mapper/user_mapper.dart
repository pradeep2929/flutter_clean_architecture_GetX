import 'package:clean_architecture_getx/domain/entities/user_model.dart';

class UserMapper {
  List<UserModel> userList = [];

  UserMapper.map(dynamic data) {
    if (data != null) {
      var userData = (data['data'] as List);
      userList = List<UserModel>.from(
          userData.map((model) => UserModel.fromJson(model)));
    }
  }
}
