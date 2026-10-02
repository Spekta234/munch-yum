import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../data/repositories/order_repository.dart';
import '../../../utils/enums/enums.dart';
import '../../../utils/snackbar/snack_bar.dart';
import '../models/order_model.dart';

class OrderController extends GetxController {
  static OrderController get instance => Get.find();

  /// Variables
  final searchQuery = ''.obs;
  final searchController = TextEditingController();
  RxBool isFetching = false.obs;
  RxList<OrderModel> orders = <OrderModel>[].obs;
  Rx<OrderFilter> selectedFilter = OrderFilter.all.obs;

  Future<void> fetchOrders() async {
    try {
      isFetching.value = true;
      final order = await OrderRepository.instance.fetchOrders();
      orders.assignAll(order);
    } catch (e) {
      MSnackBar.errorSnackBar(title: 'Error fetching orders', message: e.toString());
    } finally {
      isFetching.value = false;
    }
  }

  Future<OrderModel?> fetchOrderById(String orderId) async {
    try {
      isFetching.value = true;
     return await OrderRepository.instance.fetchOrderById(orderId);
    } catch (e) {
      MSnackBar.errorSnackBar(title: 'Error fetching order', message: e.toString());
      return null;
    } finally {
      isFetching.value = false;
    }
  }

  Future<void> updateOrderPaymentStatus(String orderId, PaymentStatus newStatus) async {
    try {
      await OrderRepository.instance.updateOrderPaymentStatus(orderId, newStatus);
    } catch (e) {
      MSnackBar.errorSnackBar(title: 'Error updating order', message: e.toString());
    }
  }


  List<OrderModel> get filteredOrders {
    switch (selectedFilter.value) {
      case OrderFilter.ongoing:
        return orders.where((o) => o.paymentStatus == PaymentStatus.pending).toList();
      case OrderFilter.delivered:
        return orders.where((o) => o.paymentStatus == PaymentStatus.successful).toList();
      case OrderFilter.unsuccessful:
        return orders.where((o) => o.paymentStatus == PaymentStatus.failed).toList();
      default: OrderFilter.all;
        return orders;
    }
  }

  List<OrderModel> get displayedOrders {
    if (searchQuery.value.isNotEmpty) {
      return filteredOrders.where((order) => order.items.any((item) => item.title.toLowerCase().contains(searchQuery.value.toLowerCase()))).toList();
    } else {
      return filteredOrders;
    }
  }

}

