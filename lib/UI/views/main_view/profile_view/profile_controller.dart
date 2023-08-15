import 'package:get/get.dart';
import 'package:quiz/UI/shared/custom_widgets/custom_toast.dart';
import 'package:quiz/core/data/models/apis/profile_model.dart';
import 'package:quiz/core/data/repositories/user_repository.dart';
import 'package:quiz/core/enums/message_type.dart';
import 'package:quiz/core/services/base_controller.dart';

class ProfileController extends BaseController {

  Rx<ProfileModel> profile = ProfileModel().obs;

  @override
  void onInit() {
    showProfile();
    super.onInit();
  }

  void showProfile() {

    runLoadingFutureFunction(
        function: UserRepository().showProfile().then((value) {
          value.fold((l) {
            CustomToast.showMessage(message: 'no internet connection' , messageType: MessageType.REJECTED);
          }, (r) {
            profile.value = r;
          });
        })
        );


  }

}