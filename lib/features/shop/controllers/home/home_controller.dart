import 'package:get/get.dart';
import 'package:munch_yum/utils/constants/image_strings.dart';
import 'package:munch_yum/utils/local_storage/storage_utility.dart';

class HomeController extends GetxController {
  static HomeController get instance => Get.find();

  /// Variables
  final _storage = MLocalStorage.instance();
  final Rx<String> selectedAvatar = ''.obs;
  final List<String> avatars = [
    MImages.chickenAvatar,
    MImages.ava1,
    MImages.ava2,
    MImages.ava3,
    MImages.ava4,
    MImages.ava5,
    MImages.ava6,
    MImages.ava7,

  ];

  @override
  void onInit() {
    // load saved avatar when controller starts
    selectedAvatar.value = _storage.readData('selectedAvatar') ?? '';
    super.onInit();
  }

  // selected avatar
  void onAvatarSelected(String avatar) {
    selectedAvatar.value = avatar;
    _storage.writeData('selectedAvatar', avatar);
  }



}