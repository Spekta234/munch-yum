import 'package:get/get.dart';
import 'package:munch_yum/data/models/location_model.dart';
import 'package:munch_yum/data/repositories/location_repository.dart';
import 'package:munch_yum/data/repositories/user_repository.dart';
import 'package:munch_yum/utils/snackbar/snack_bar.dart';
import 'package:flutter/material.dart';

import '../../../../data/repositories/authentication_repository.dart';
import '../../../../navigation_menu.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../screens/location/location_loader.dart';
import '../../screens/login/widgets/logo_avatar.dart';

class LocationController extends GetxController {
  static LocationController get instance => Get.find();

  /// Variables
  RxBool isLoading = false.obs;
  final RxList<StateModel> allStates = <StateModel>[].obs;
  final RxList<CityModel> allCities = <CityModel>[].obs;
  final RxList<OutletModel> allOutlets = <OutletModel>[].obs;
  Rx<StateModel?> selectedState = Rx<StateModel?>(null);
  Rx<CityModel?> selectedCity = Rx<CityModel?>(null);
  Rx<OutletModel?> selectedOutlet = Rx<OutletModel?>(null);
  final locationRepo = Get.put(LocationRepository());

  @override
  void onInit() {
    fetchStates();
    super.onInit();
  }

  /// Fetch all the states
  Future<void> fetchStates() async {
   try{
     final states = await locationRepo.getStates();
     allStates.assignAll(states);
   } catch (e) {
     MSnackBar.errorSnackBar(title: 'Oh Snap!', message: e.toString());
   }
  }

  /// Fetch Cities
  Future<void> fetchCities(String stateName) async {
    try{
      allCities.clear();
      allOutlets.clear();
      selectedCity.value = null;
      selectedOutlet.value = null;
      print('Fetching cities for: $stateName');
      final cities = await locationRepo.getCities(stateName);
      print('Cities found: ${cities.length}');
      for (var city in cities) {
        print('City: ${city.name}');
      }
      allCities.assignAll(cities);

      // Show popup if no cities found
      if (allCities.isEmpty) {
        Get.dialog(
          AlertDialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const MLogoAvatar(image: MImages.outlet, showBorder: false, size: 35),
                const SizedBox(height: 16),
                Text('Ouch... No outlet nearby',
                  style: TextStyle(color: MColors.primary, fontWeight: FontWeight.bold, fontSize: 18),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text('Sorry, we currently do not have an outlet in your location',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => Get.back(),
                    child: Text('Reset location'),
                  ),
                ),
              ],
            ),
          ),
        );
      }
    } catch (e) {
      MSnackBar.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  /// Fetch Outlets
  Future<void> fetchOutlets(String stateName, String cityName) async {
    try{
      allOutlets.clear();
      selectedOutlet.value = null;
      final outlets = await locationRepo.getOutlets(stateName, cityName);
      allOutlets.assignAll(outlets);
    } catch (e) {
      MSnackBar.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }


  Future<void> setLocation() async {
    try {
      // Validate all fields are selected
      if (selectedState.value == null ||
          selectedCity.value == null ||
          selectedOutlet.value == null) {
        MSnackBar.errorSnackBar(
            title: 'Oh Snap!',
            message: 'Please select your state, city and outlet'
        );
        return;
      }

      isLoading.value = true;

      // Navigate to loader screen
      Get.to(() => const LocationLoadingScreen());

      // Save location to Firestore
      final userRepo = UserRepository.instance;
      final userId = AuthenticationRepository.instance.authUser!.uid;
      await userRepo.saveLocation(userId, selectedOutlet.value!.name);

      // Navigate to home
      Get.offAll(() => const NavigationMenu());

    } catch (e) {
      MSnackBar.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}