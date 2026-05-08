import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:munch_yum/features/shop/screens/home/home_screen.dart';
import 'package:munch_yum/features/shop/screens/offers/offers_screen.dart';
import 'package:munch_yum/utils/constants/colors.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());


    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBarTheme(
          data: NavigationBarThemeData(
            backgroundColor: MColors.white,
            indicatorColor: Colors.transparent,

            /// icon theme
            iconTheme: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.selected)) {
                return IconThemeData(color: MColors.primary);
              }
              return IconThemeData(color: Colors.grey);
            }),

            /// label
            labelTextStyle: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.selected)) {
                return TextStyle(color: MColors.primary, fontWeight: FontWeight.w600);
              }
              return TextStyle(color: Colors.grey);
            }),
          ),
          child: NavigationBar(
            height: 80,
            elevation: 0,
            selectedIndex: controller.selectedIndex.value,
            onDestinationSelected: (index) => controller.selectedIndex.value = index,

            destinations:  [
              NavigationDestination(icon: Icon(Iconsax.home), selectedIcon: Icon(Iconsax.home_25), label: 'Home',),
              NavigationDestination(icon: Icon(Iconsax.percentage_circle), selectedIcon: Icon(Iconsax.percentage_circle5),label: 'Offers'),
              NavigationDestination(icon: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: MColors.primary,
                  shape: BoxShape.circle,
                ),
                child: Icon(Iconsax.shopping_cart, color: Colors.white),
              ),
                selectedIcon: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: MColors.primary,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Iconsax.shopping_cart, color: Colors.white),
                ),
                label: '',),
              NavigationDestination(icon: Icon(Iconsax.discount_shape), selectedIcon: Icon(Iconsax.discount_shape5), label: 'Loyalty'),
              NavigationDestination(icon: Icon(Iconsax.messages), selectedIcon: Icon(Iconsax.messages5), label: 'Support'),
            ],

          ),
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController{
  final Rx<int> selectedIndex = 0.obs;

  final screens = [const HomeScreen(), const OffersScreen(), Container(color: Colors.blue), Container(color: Colors.green), Container(color: Colors.purple)];
}
