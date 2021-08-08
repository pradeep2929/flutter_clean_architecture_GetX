import 'package:get/get.dart';

class UserRequest extends GetConnect {

  Future<Response> getUserList() => get('https://reqres.in/api/users');

}