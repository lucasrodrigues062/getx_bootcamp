import 'package:get/get.dart';
import 'package:getx_bootcamp/user_model.dart';

class UserController extends GetxController {
  Rx<UserModel> user = UserModel().obs;
  void setUserName(String userName) {
    user.update((val) {
      val?.name = userName;
    });
  }

  void setUserAge(int userAge) {
    user.value.age = userAge;
    user.refresh();
  }
}
