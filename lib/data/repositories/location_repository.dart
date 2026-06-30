import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:munch_yum/data/models/location_model.dart';

import '../../utils/exceptions/firebase_auth_exceptions.dart';
import '../../utils/exceptions/firebase_exceptions.dart';
import '../../utils/exceptions/format_exceptions.dart';
import '../../utils/exceptions/platform_exceptions.dart';

class LocationRepository extends GetxController {
  static LocationRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<List<StateModel>> getStates() async {
    try {
      final snapshot = await _db.collection("Locations").get();
      return snapshot.docs.map((doc) => StateModel.fromSnapshot(doc)).toList();
    } on FirebaseAuthException catch (e) {
      throw MFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw MFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const MFormatException().message;
    } on PlatformException catch (e) {
      throw MPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong, Try again';
    }
  }

  Future<List<CityModel>> getCities(String stateId) async {
    try{
      final snapshot = await _db.collection("Locations").doc(stateId).collection("Cities").get();
      return snapshot.docs.map((doc) => CityModel.fromSnapshot(doc)).toList();
    }on FirebaseAuthException catch (e) {
      throw MFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw MFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const MFormatException().message;
    } on PlatformException catch (e) {
      throw MPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong, Try again';
    }
  }
}