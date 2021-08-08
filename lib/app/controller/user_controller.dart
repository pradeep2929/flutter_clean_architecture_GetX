import 'package:clean_architecture_getx/domain/entities/user_model.dart';
import 'package:clean_architecture_getx/domain/use_cases/user_use_case.dart';
import 'package:get/get.dart';

enum Status { NON, LOADING, SUCCESS, ERROR }

class UserController extends GetxController {
  late UserUseCase _userUseCase;
  List<UserModel> userList = [];
  Status status = Status.NON;

  UserController(){
    _userUseCase = Get.find();
  }

  getUserList() {
    status = Status.LOADING;
    update();
    try {
      _userUseCase.getUserList().then((userListRes) {
        userList = userListRes;
        status = Status.SUCCESS;
        update();
      });
    } catch (e) {
      status = Status.ERROR;
      update();
    }
  }
}
