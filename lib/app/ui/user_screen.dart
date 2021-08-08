import 'package:clean_architecture_getx/app/controller/user_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  initState() {
    super.initState();
    Get.find<UserController>().getUserList();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: Get.find<UserController>(),
        builder: (UserController controller) {
          WidgetsBinding.instance
              ?.addPostFrameCallback((timeStamp) => showLoader(controller));
          return Scaffold(
            backgroundColor: Colors.white,
            body: controller.userList.isEmpty ? Container() : loadList(controller),
          );
        });
  }

  Widget loadList(controller) {
    return Container(
        child: ListView.builder(
            itemCount: controller.userList.length,
            itemBuilder: (BuildContext context, int index) {
              var model = controller.userList[index];
              return Card(
                  child: ListTile(
                      title: Text(
                model.toString(),
                style: TextStyle(fontSize: 16),
              )));
            }));
  }

  void showLoader(controller) {
    switch (controller.status) {
      case Status.SUCCESS:
        hideProgress();
        break;
      case Status.LOADING:
        loadProgress();
        break;
      case Status.ERROR:
        Get.snackbar("Error", controller.error);
        break;
      default:
        break;
    }
  }

  loadProgress() {
    Get.dialog(Center(child: CircularProgressIndicator()),
        barrierDismissible: false);
  }

  hideProgress() {
    Get.back(); // dismiss dialog
  }
}
