import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:munch_yum/data/repositories/user_repository.dart';
import 'package:munch_yum/utils/constants/image_strings.dart';
import 'package:munch_yum/utils/local_storage/storage_utility.dart';
import 'package:munch_yum/utils/snackbar/snack_bar.dart';

import '../../../data/models/user_model.dart';

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
  final bannerController = PageController();
  final currentBannerIndex = 0.obs;
  Timer? _bannerTimer;
  final List<String> banners = [
    MImages.banner1,
    MImages.banner2,
    MImages.banner3,
    MImages.banner4,
    MImages.banner5,
    MImages.banner6,
    MImages.banner7,
  ];
  final Rx<UserModel> user = UserModel.empty().obs;

  @override
  void onInit() {
    // load saved avatar when controller starts
    selectedAvatar.value = _storage.readData('selectedAvatar') ?? '';
    startBannerAutoScroll();
    fetchUserData();
    super.onInit();
  }


  @override
  void onClose() {
    // banner auto scroll doesn't run in the background
    _bannerTimer?.cancel();
    bannerController.dispose();
    super.onClose();
  }


  // selected avatar
  void onAvatarSelected(String avatar) {
    selectedAvatar.value = avatar;
    _storage.writeData('selectedAvatar', avatar);
  }

  // auto scroll
  void startBannerAutoScroll() {
    Future.delayed(const Duration(seconds: 1), () {
      _bannerTimer = Timer.periodic(const Duration(seconds: 3), (_) {
        if (!bannerController.hasClients) return;
        if (currentBannerIndex.value < banners.length - 1) {
          currentBannerIndex.value++;
        } else {
          currentBannerIndex.value = 0;
        }
        bannerController.animateToPage(
          currentBannerIndex.value,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      });
    });
  }

  void onBannerPageChanged(int index) {
    currentBannerIndex.value = index;
  }



  Future<void> fetchUserData() async {
    try {
      final userData = await UserRepository.instance.fetchUserRecord();
      user.value = userData;
    } catch (e) {
      MSnackBar.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }

}