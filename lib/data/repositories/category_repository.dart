import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:munch_yum/features/shop/models/category_model.dart';
import 'package:munch_yum/utils/exceptions/firebase_exceptions.dart';
import 'package:munch_yum/utils/exceptions/platform_exceptions.dart';

class CategoryRepository extends GetxController {
  static CategoryRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<List<CategoryModel>> fetchCategories() async {
    try{
      final snapshot = await _db.collection("Categories").get();
      return snapshot.docs.map((doc) => CategoryModel.fromSnapshot(doc)).toList();
    } on FirebaseException catch (e) {
      throw MFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw MPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong, Try again';
    }
  }
}