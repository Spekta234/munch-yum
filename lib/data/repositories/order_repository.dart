import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:munch_yum/data/repositories/authentication_repository.dart';
import 'package:munch_yum/utils/enums/enums.dart';

import '../../features/shop/models/order_model.dart';

class OrderRepository extends GetxController{
  static OrderRepository get instance => Get.find();

 /// Variables
 final _db = FirebaseFirestore.instance;

 /// Create Order
 Future<String> createOrder(OrderModel order) async {
   try{
     final userId = AuthenticationRepository.instance.authUser?.uid;
     if (userId == null || userId.isEmpty) {
       throw 'Unable to find user information. Try again in few minutes';
     }
     final orderRef = await _db.collection('Users').doc(userId).collection('Orders').add(order.toJson());
     return orderRef.id;
   } catch (e) {
     throw 'Something went wrong while trying to create order, please try again later';
   }
 }
 
 /// Fetch Orders
 Future<List<OrderModel>> fetchOrders() async {
   try{
     final userId = AuthenticationRepository.instance.authUser?.uid;
     if (userId == null || userId.isEmpty) {
       throw 'Unable to find user information. Try again in few minutes';
     }
     final result = await _db.collection('Users').doc(userId).collection('Orders').get();
     return result.docs.map((documentSnapshot) => OrderModel.fromSnapshot(documentSnapshot)).toList();
   } catch (e) {
     throw 'Something went wrong while trying to fetch orders, please try again later';
   }

 }


 /// Fetch Single Order
 Future<OrderModel> fetchOrderById(String orderId) async {
   try{
     final userId = AuthenticationRepository.instance.authUser?.uid;
     if (userId == null || userId.isEmpty) {
       throw 'Unable to find user information. Try again in few minutes';
     }
     final result = await _db.collection('Users').doc(userId).collection('Orders').doc(orderId).get();
     return OrderModel.fromSnapshot(result);
   } catch (e) {
     throw 'An error occurred while trying to fetch this order, please try again later';
   }
 }

 /// Update Order Payment Status
 Future<void> updateOrderPaymentStatus(String orderId, PaymentStatus newStatus) async {
   try{
     final userId = AuthenticationRepository.instance.authUser?.uid;
     if (userId == null || userId.isEmpty) {
       throw 'Unable to find user information. Try again in few minutes';
     }
     await _db.collection('Users').doc(userId).collection('Orders').doc(orderId).update({'PaymentStatus': newStatus.toString()});
   } catch (e) {
     throw 'An error occurred while trying to update payment status, please try again later';
   }
 }
}