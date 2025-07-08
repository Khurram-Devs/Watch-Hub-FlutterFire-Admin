
import 'package:adminside/feature/model/orders_model.dart';
import 'package:flutter/material.dart';

class OrderProvider with ChangeNotifier {
  final List<OrderModel> _orders = demoOrders;
  List<OrderModel> get orders => _orders;

  List<OrderModel> getOrdersByStatus(String status) {
    return _orders.where((order) => order.orderStatus == status).toList();
  }
}