import 'dart:async';

import 'package:flutter/cupertino.dart';
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

  @override
  void onInit() {
    // load saved avatar when controller starts
    selectedAvatar.value = _storage.readData('selectedAvatar') ?? '';
    startBannerAutoScroll();
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
    _bannerTimer = Timer.periodic(const Duration(seconds: 3), (_) {
      if (currentBannerIndex.value < banners.length - 1) {
        currentBannerIndex.value++;
      } else {
        currentBannerIndex.value = 0; // ← loop back
      }
      bannerController.animateToPage(
        currentBannerIndex.value,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  void onBannerPageChanged(int index) {
    currentBannerIndex.value = index;
  }




}