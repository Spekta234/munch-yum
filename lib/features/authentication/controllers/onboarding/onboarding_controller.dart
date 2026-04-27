import 'dart:async';
import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:munch_yum/features/authentication/screens/login/login.dart';

class OnboardingController extends GetxController {
  static OnboardingController get instance => Get.find();

  /// Variables
  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;
  final int totalPages = 4; // change to match your pages
  Timer? _autoScrollTimer;
  final RxBool _userTookControl = false.obs;

  @override
  void onInit() {
    super.onInit();
    _startAutoScroll();
  }

  @override
  void onClose() {
    _autoScrollTimer?.cancel();
    pageController.dispose();
    super.onClose();
  }

  /// Auto scroll
  void _startAutoScroll() {
    _autoScrollTimer = Timer.periodic(const Duration(seconds: 3), (_) {
      if (_userTookControl.value) return; // user swiped — do nothing

      if (currentPageIndex.value < totalPages - 1) {
        pageController.nextPage(
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      } else {
        // Loop back to first page — remove these 4 lines to just stop instead
        pageController.animateToPage(
          0,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  /// Call this from GestureDetector onPanDown in your PageView
  void onUserSwiped() {
    _userTookControl.value = true;
    _autoScrollTimer?.cancel();
  }

  // ── Getters ────────────────────────────────────────────────
  bool get isLastPage => currentPageIndex.value == totalPages - 1;

  /// Update current index when page scroll
  void updatePageIndicator(index) => currentPageIndex.value = index;

  /// Jump to the specific dot selected page
  void dotNavigationClick(index) {
    onUserSwiped();
    currentPageIndex.value = index;
    pageController.jumpToPage(index);
  }

  /// Update current index & jump to next page
  void nextPage() {
    if (isLastPage) {
      Get.to(() => const LoginScreen());
    } else {
      onUserSwiped();
      pageController.jumpToPage(currentPageIndex.value + 1);
    }
  }

  void skipPage() {
    Get.to(() => const LoginScreen());
  }

}