import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:iconsax/iconsax.dart';
import 'package:munch_yum/features/shop/controllers/checkout_controller.dart';
import 'package:munch_yum/features/shop/screens/checkout/widgets/payment_option.dart';
import 'package:munch_yum/utils/constants/image_strings.dart';
import 'package:munch_yum/utils/constants/sizes.dart';
import 'package:munch_yum/utils/helpers/navigation_helpers.dart';

class PaymentMethodScreen extends StatelessWidget {
  const PaymentMethodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CheckoutController.instance;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: MSizes.sm, right: MSizes.md, left: MSizes.md, bottom: MSizes.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
                width: 20,
                child: IconButton(
                  onPressed: () => mBack(),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  icon: const Icon(Icons.arrow_back_ios_new, size: 24, color: Colors.black),
                ),
              ),
              const SizedBox(height: 5),
              Text('Payment method', style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 5),
              Text('Select a payment method to complete your checkout', style: Theme.of(context).textTheme.bodySmall),
              const SizedBox(height: MSizes.spaceBtwSections),

              Obx(
                    () => Column(
                  children: [
                    PaymentOption(
                      logoAsset: MImages.paystack,
                      title: 'PayStack',
                      isSelected: controller.selectedPaymentMethod.value == 'paystack',
                      onTap: () => controller.selectMethod('paystack'),
                    ),
                    const SizedBox(height: MSizes.spaceBtwItems),
                    PaymentOption(
                      logoAsset: MImages.monnify,
                      title: 'Monnify',
                      isSelected: controller.selectedPaymentMethod.value == 'monnify',
                      onTap: () => controller.selectMethod('monnify'),
                    ),
                    const SizedBox(height: MSizes.spaceBtwItems),
                    PaymentOption(
                      isTransfer: true,
                      icon: Iconsax.bank,
                      title: 'Bank Transfer',
                      isSelected: controller.selectedPaymentMethod.value == 'transfer',
                      onTap: () => controller.selectMethod('transfer'),
                    ),
                  ],
                ),
              ),

              const Spacer(),

              Obx(
                    () => SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: controller.selectedPaymentMethod.value.isEmpty
                        ? null
                        : () {
                      // TODO: branch by controller.selectedPaymentMethod.value — Paystack flow goes here first
                    },
                    child: const Text('Continue'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
