import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:munch_yum/data/models/user_model.dart';

import '../../utils/exceptions/firebase_auth_exceptions.dart';
import '../../utils/exceptions/firebase_exceptions.dart';
import '../../utils/exceptions/format_exceptions.dart';
import '../../utils/exceptions/platform_exceptions.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  /// Save user data to fire store
  Future<void> saveUserRecord(UserModel user) async {
    try{
      await _db.collection("Users").doc(user.id).set(user.toJson());
    }  on FirebaseAuthException catch (e){
      throw MFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw MFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const MFormatException().message;
    } on PlatformException catch (e) {
      throw MPlatformException(e.code).message;
    }
    catch (e) {
      throw 'Something went wrong, Try again';
    }
  }
}