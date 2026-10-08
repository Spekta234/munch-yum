import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:munch_yum/features/shop/controllers/order_controller.dart';
import 'package:munch_yum/features/shop/models/order_model.dart';
import 'package:munch_yum/features/shop/screens/checkout/widgets/payment_detail_row.dart';
import 'package:munch_yum/features/shop/screens/orders/order_details.dart';
import 'package:munch_yum/utils/constants/colors.dart';

import '../../../../navigation_menu.dart';


class PaymentSuccessScreen extends StatelessWidget {
  const PaymentSuccessScreen({
    super.key, required this.order,
  });


  final OrderModel order;

  String _formatDateTime(DateTime value) {
    final local = value.toLocal();
    final hour = local.hour % 12 == 0 ? 12 : local.hour % 12;
    final minute = local.minute.toString().padLeft(2, '0');
    final period = local.hour >= 12 ? 'PM' : 'AM';
    const months = <String>[
      'January', 'February', 'March', 'April', 'May', 'June',
      'July', 'August', 'September', 'October', 'November', 'December',
    ];
    return '${months[local.month - 1]} ${local.day}, ${local.year}  •  '
        '$hour:$minute $period';
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 28),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 480),
              child: Column(
                children: [
                  Container(
                    width: 88,
                    height: 88,
                    decoration: BoxDecoration(
                      color: MColors.success,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.check_rounded,
                      color: MColors.white,
                      size: 52,
                    ),
                  ),
                  const SizedBox(height: 22),
                  Text(
                    'Payment successful',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF17212B),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Your payment has been received.',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: const Color(0xFF718096),
                    ),
                  ),
                  const SizedBox(height: 28),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 22,
                      vertical: 24,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: const Color(0xFFE8EDF3)),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x0A17212B),
                          blurRadius: 24,
                          offset: Offset(0, 8),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Text(
                          'AMOUNT PAID',
                          style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            letterSpacing: 1.2,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xFF8995A3),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '₦${order.total.toStringAsFixed(2)}',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                            fontWeight: FontWeight.w800,
                            color: const Color(0xFF17212B),
                          ),
                        ),
                        const SizedBox(height: 12),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(Icons.schedule_rounded,
                                size: 16, color: Color(0xFF8995A3)),
                            const SizedBox(width: 6),
                            Flexible(
                              child: Text(
                                _formatDateTime(DateTime.now()),
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                  color: const Color(0xFF718096),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 22),
                          child: Divider(height: 1, color: Color(0xFFE8EDF3)),
                        ),
                        DetailRow(
                          label: 'Order / reference ID',
                          value: order.orderId,
                        ),
                        const SizedBox(height: 18),
                        DetailRow(
                          label: 'Payment method',
                          value: 'Debit card',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    height: 54,
                    child: FilledButton(
                      onPressed: () async {
                        final fetch = await OrderController.instance.fetchOrderById(order.id);
                        if (fetch != null) {
                          Get.to(() => OrderDetails(order: fetch));
                        }
                      },
                      style: FilledButton.styleFrom(
                        backgroundColor: MColors.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                        textStyle: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      child: const Text('View order details'),
                    ),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    height: 54,
                    child: OutlinedButton(
                      onPressed: () {
                        Get.offAll(() => const NavigationMenu());
                        NavigationController.instance.goToHome();
                      },
                      style: OutlinedButton.styleFrom(
                        foregroundColor: const Color(0xFF263442),
                        side: const BorderSide(color: Color(0xFFDCE3EB)),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                        textStyle: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      child: const Text('Back to home'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

