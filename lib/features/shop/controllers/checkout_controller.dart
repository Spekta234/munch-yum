import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_paystack_max/flutter_paystack_max.dart';
import 'package:get/get.dart';
import 'package:munch_yum/features/shop/controllers/cart_controller.dart';
import 'package:munch_yum/features/shop/controllers/home_controller.dart';
import 'package:munch_yum/features/shop/controllers/order_controller.dart';
import 'package:munch_yum/features/shop/models/cart_item_model.dart';
import 'package:munch_yum/features/shop/screens/checkout/payment_successful.dart';
import 'package:munch_yum/utils/enums/enums.dart';

import '../../../data/repositories/authentication_repository.dart';
import '../../../data/repositories/order_repository.dart';
import '../../../utils/helpers/helper_function.dart';
import '../../../utils/snackbar/snack_bar.dart';
import '../models/order_model.dart';
import '../screens/checkout/payment_method.dart';

class CheckoutController extends GetxController {
  static CheckoutController get instance => Get.find();

  /// Variables
  RxBool isProcessingPayment = false.obs;
  RxBool isLoading = false.obs;
  final RxString orderingFor = 'Myself'.obs;
  final RxString packagingType = 'Branded nylon'.obs;
  final RxString orderMode = ''.obs;
  final RxString deliveryTime = 'Instant delivery'.obs;
  final RxString selectedTime = ''.obs;
  final RxString selectedDate = ''.obs;
  final RxString selectedPaymentMethod = ''.obs;
  double get packagingPrice {
    switch (packagingType.value) {
      case 'Branded nylon' :
        return 0;
      case 'Paper bag' :
        return 500;
      case 'Love box (ideal for gift)' :
        return 500;
      default:
        return 0;
    }
  }
  double get orderModePrice {
    switch (orderMode.value) {
      case 'Delivery':
        return 2000;
      case 'Pick up' :
        return 0;
      default:
        return 0;
    }
  }

  double get serviceCharge => 222;

  double get discount => 0;

  double get subtotal {
    return CartController.instance.cartItem.fold(0 , (total, item) => total + (item.price * item.quantity));
  }

  double get total => packagingPrice + orderModePrice + serviceCharge + subtotal - discount;

  final recipientName = TextEditingController();
  final recipientPhoneNo = TextEditingController();
  final specialNote = TextEditingController();
  final couponCode = TextEditingController();
  GlobalKey<FormState> checkoutFormKey = GlobalKey<FormState>();



  void selectMethod(String method) => selectedPaymentMethod.value = method;

  // Reset checkout
  void resetCheckout() {
    orderingFor.value = 'Myself';
    packagingType.value = 'Branded nylon';
    orderMode.value = '';
    deliveryTime.value = 'Instant delivery';
    selectedTime.value = '';
    selectedDate.value = '';
    selectedPaymentMethod.value = '';
    recipientName.clear();
    recipientPhoneNo.clear();
    specialNote.clear();
    couponCode.clear();
  }



  Future<OrderModel?> placeOrder(String deliveryAddress) async {
    try {
      isLoading.value = true;
      final userId = AuthenticationRepository.instance.authUser?.uid ?? '';
      final orderId = MHelperFunctions.generateOrderId();



      final order = OrderModel(
          id: '',
          orderId: orderId,
          userId: userId,
          recipientName: orderingFor.value == 'Someone else' ? recipientName.text.trim() : null,
          recipientPhoneNo: orderingFor.value == 'Someone else' ? recipientPhoneNo.text.trim() : null,
          paymentStatus: PaymentStatus.pending,
          specialNote: specialNote.text.trim().isEmpty ? null : specialNote.text.trim(),
          scheduledDateTime: deliveryTime.value == 'Later' && selectedDate.value.isNotEmpty
              ? MHelperFunctions.parseScheduledDateTime(selectedDate.value, selectedTime.value)
              : null,
          orderDate: DateTime.now(),
          orderMode: MHelperFunctions.mapOrderMode(orderMode.value),
          orderingFor: MHelperFunctions.mapOrderingFor(orderingFor.value),
          packagingType: packagingType.value,
          deliveryAddress: deliveryAddress,
          couponCode: null,
          subtotal: subtotal,
          packagingFee: packagingPrice,
          deliveryFee: orderModePrice,
          serviceCharge: serviceCharge,
          discount: discount,
          total: total,
          items: CartController.instance.cartItem
      );

      final newOrderId =  await OrderRepository.instance.createOrder(order);
      order.id = newOrderId;
      MSnackBar.customToast(message: 'Order Placed');

      CartController.instance.clearCart();
      resetCheckout();

      return order;
    } catch (e) {
      MSnackBar.errorSnackBar(title: 'Error placing order', message: e.toString());
      return null;
    } finally {
      isLoading.value = false;
    }
  }


  /// Paystack transaction request
  PaystackTransactionRequest createPaystackRequest(OrderModel order) {
    return  PaystackTransactionRequest(
      reference: order.orderId,
      secretKey: dotenv.env['PAYSTACK_SECRET_KEY']!,
      email: HomeController.instance.user.value.email,
      amount: (order.total * 100).roundToDouble(),
      currency: PaystackCurrency.ngn,
      channel: [
        PaystackPaymentChannel.card,
        PaystackPaymentChannel.bankTransfer,
      ],
    );
  }

  /// Process Payment
  Future<void> processPayment(OrderModel order, BuildContext context) async {
    try{
      isProcessingPayment.value = true;
      
      final request = createPaystackRequest(order);
      
      final initializedTransaction = await PaymentService.initializeTransaction(request);
      if (!initializedTransaction.status) {
        MSnackBar.errorSnackBar(title: 'Payment failed to start', message: initializedTransaction.message);
        return;
      }

      final response = await PaymentService.showPaymentModal(
        context,
        callbackUrl: 'https://standard.paystack.co/close',
        transaction: initializedTransaction,
      ).then((_) async {
        return await PaymentService.verifyTransaction(
          initializedTransaction.data?.reference ?? request.reference,
          paystackSecretKey: dotenv.env['PAYSTACK_SECRET_KEY']!,
        );
      });

      if (response.status) {
        await OrderController.instance.updateOrderPaymentStatus(order.id, PaymentStatus.successful);
        MSnackBar.successSnackBar(title: 'Payment successful', message: 'Your order has been paid for');
        Get.to(() => PaymentSuccessScreen(order: order));

      } else {
        MSnackBar.errorSnackBar(title: 'Payment failed', message: response.message);
      }
      
    } catch (e) {
      MSnackBar.errorSnackBar(title: 'Payment error', message: e.toString());
    } finally {
      isProcessingPayment.value = false;
    }
  }


}