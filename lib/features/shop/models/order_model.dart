import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:munch_yum/features/shop/models/cart_item_model.dart';
import 'package:munch_yum/utils/enums/enums.dart';
import 'package:munch_yum/utils/helpers/helper_function.dart';

class OrderModel {
  String id;
  String orderId;
  String userId;
  String? recipientName;
  String? recipientPhoneNo;
  PaymentStatus paymentStatus;
  String? specialNote;
  DateTime? scheduledDateTime;
  DateTime orderDate;
  OrderMode orderMode;
  OrderingFor orderingFor;
  String packagingType;
  String deliveryAddress;
  String? couponCode;
  double subtotal;
  double packagingFee;
  double deliveryFee;
  double serviceCharge;
  double discount;
  double total;
  List<CartItemModel> items;
  
  OrderModel({
    required this.id,
    required this.orderId,
    required this.userId,
    this.recipientName,
    this.recipientPhoneNo,
    required this.paymentStatus,
    this.specialNote,
    this.scheduledDateTime,
    required this.orderDate,
    required this.orderMode,
    required this.orderingFor,
    required this.packagingType,
    required this.deliveryAddress,
    this.couponCode,
    required this.subtotal,
    required this.packagingFee,
    required this.deliveryFee,
    required this.serviceCharge,
    required this.discount,
    required this.total,
    required this.items,
  });

  String get formattedDate => MHelperFunctions.getFormattedDate(orderDate);
  String get formattedDeliveryDate => scheduledDateTime != null? MHelperFunctions.getFormattedDate(scheduledDateTime!) : '';

  Map<String, dynamic> toJson() {
    return {
      'OrderId' : orderId,
      'UserId' : userId,
      'RecipientName' : recipientName,
      'RecipientPhoneNo' : recipientPhoneNo,
      'PaymentStatus' : paymentStatus.toString(),
      'SpecialNote' : specialNote,
      'ScheduledDateTime' : scheduledDateTime,
      'OrderDate' : orderDate,
      'OrderMode' : orderMode.toString(),
      'OrderingFor' : orderingFor.toString(),
      'PackagingType' : packagingType,
      'DeliveryAddress' : deliveryAddress,
      'CouponCode' : couponCode,
      'Subtotal' : subtotal,
      'PackagingFee' : packagingFee,
      'DeliveryFee' : deliveryFee,
      'ServiceCharge' : serviceCharge,
      'Discount' : discount,
      'Total' : total,
      'Items' : items.map((items) => items.toJson()).toList(),
    };
  }

  factory OrderModel.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;

    return OrderModel(
        id: snapshot.id,
        orderId: data['OrderId'] as String,
        userId: data['UserId'] as String,
        recipientName: data['RecipientName'] as String?,
        recipientPhoneNo: data['RecipientPhoneNo'] as String?,
        couponCode: data['CouponCode'] as String?,
        paymentStatus: PaymentStatus.values.firstWhere((e) => e.toString() == data['PaymentStatus']),
        specialNote: data['SpecialNote'] as String ?,
        scheduledDateTime: data['ScheduledDateTime'] == null ? null : (data['ScheduledDateTime'] as Timestamp).toDate(),
        orderDate: (data['OrderDate'] as Timestamp).toDate(),
        orderMode: OrderMode.values.firstWhere((e) => e.toString() == data['OrderMode']),
        orderingFor: OrderingFor.values.firstWhere((e) => e.toString() == data['OrderingFor']),
        packagingType: data['PackagingType'] as String,
        deliveryAddress: data['DeliveryAddress'] as String,
        subtotal: data['Subtotal'] as double,
        packagingFee: data['PackagingFee'] as double,
        deliveryFee: data['DeliveryFee'] as double,
        serviceCharge: data['ServiceCharge'] as double,
        discount: data['Discount'] as double,
        total: data['Total'] as double,
        items: (data['Items'] as List<dynamic>).map((itemData) => CartItemModel.fromJson(itemData as Map<String, dynamic>)).toList(),
    );
  }
}