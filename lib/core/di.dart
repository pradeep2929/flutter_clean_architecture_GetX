import 'package:clean_architecture_getx/app/controller/user_controller.dart';
import 'package:clean_architecture_getx/data/repositories/repo_cache/user_repository_cache_impl.dart';
import 'package:clean_architecture_getx/data/repositories/repo_remote/user_repository_remote_impl.dart';
import 'package:clean_architecture_getx/data/repositories/user_repository_impl.dart';
import 'package:clean_architecture_getx/domain/repositories/user_repository.dart';
import 'package:clean_architecture_getx/domain/use_cases/user_use_case.dart';
import 'package:get/get.dart';

class DI {

  static init() {
    Get.put<UserRepositoryRemote>(UserRepositoryRemoteImpl());
    Get.put<UserRepositoryCache>(UserRepositoryCacheImpl());
    Get.put<UserRepository>(UserRepositoryImpl(Get.find(), Get.find()));
    Get.put(UserUseCase(Get.find()));
    Get.put(UserController(), permanent: true);
  }
}