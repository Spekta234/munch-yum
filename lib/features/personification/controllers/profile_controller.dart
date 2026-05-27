import 'package:get/get.dart';

import '../../../utils/constants/image_strings.dart';
import '../../../utils/local_storage/storage_utility.dart';

class ProfileController extends GetxController {
  static ProfileController get instance => Get.find();

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
  final RxString selectedMonth = ''.obs;
  final RxString selectedDay = ''.obs;
  final RxString dob = ''.obs;
  final RxBool isEditing = false.obs;

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

  void updateDOB(){
    dob.value = '${selectedDay.value} ${selectedMonth.value}';
  }

  /// Returns max days for selected month
  int get maxDays {
    const monthDays = {
      'January': 31, 'February': 28, 'March': 31,
      'April': 30, 'May': 31, 'June': 30,
      'July': 31, 'August': 31, 'September': 30,
      'October': 31, 'November': 30, 'December': 31,
    };
    return monthDays[selectedMonth.value] ?? 31;
  }

  /// Clear day if it exceeds max days
  void onMonthChanged(String month) {
    selectedMonth.value = month;
    // clear day if it no longer exists in new month
    if (selectedDay.value.isNotEmpty) {
      final day = int.parse(selectedDay.value.replaceAll(RegExp(r'[^0-9]'), ''));
      if (day > maxDays) selectedDay.value = '';
    }
  }

  ///
  void toggleEdit() => isEditing.value = !isEditing.value;
}