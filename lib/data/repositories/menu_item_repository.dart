import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:munch_yum/features/shop/models/menu_item_model.dart';

import '../../utils/exceptions/firebase_exceptions.dart';
import '../../utils/exceptions/platform_exceptions.dart';

class MenuItemRepository extends GetxController {
  static MenuItemRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  /// Fetch all menu items from Firestore
  Future<List<MenuItemModel>> fetchMenuItems() async {
    try {
      final snapshot = await _db.collection("MenuItems").get();
      return snapshot.docs.map((doc) => MenuItemModel.fromSnapshot(doc)).toList();
    }  on FirebaseException catch (e) {
      throw MFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw MPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong, Try again';
    }
  }

  /// Fetch menu items by category from Firestore
  Future<List<MenuItemModel>> fetchMenuItemsByCategory(String categoryName) async {
    try {
      final menuQuery = await _db.collection("MenuItems").where("Category", isEqualTo: categoryName).get();

      // If no menu items found, return empty list
      if (menuQuery.docs.isEmpty) return [];

      return menuQuery.docs.map((doc) => MenuItemModel.fromSnapshot(doc)).toList();
    }  on FirebaseException catch (e) {
      throw MFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw MPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong, Try again';
    }
  }
  
  /// Update search count
  Future<void> updateSearchCount(String menuItemId) async {
    try{
      await _db.collection('MenuItems').doc(menuItemId).update({
        'SearchCount': FieldValue.increment(1),
      });
    } on FirebaseException catch (e) {
      throw MFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw MPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong, Try again';
    }
  }

  /// Fetch popular items from Firestore
  Future<List<MenuItemModel>> fetchPopularItems({int limit = 5}) async {
    try {
      final snapshot = await _db
          .collection('MenuItems')
          .orderBy('SearchCount', descending: true)
          .limit(limit)
          .get();
      return snapshot.docs.map((doc) => MenuItemModel.fromSnapshot(doc)).toList();
    } on FirebaseException catch (e) {
      throw MFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw MPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong, Try again';
    }
  }
}