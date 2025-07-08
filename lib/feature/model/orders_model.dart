import 'package:intl/intl.dart';

class OrderModel {
  final Order order;
  final DateTime date;
  final String customer;
  final String paymentStatus;
  final String orderStatus;
  final double price;

  OrderModel({
    required this.order,
    required this.date,
    required this.customer,
    required this.paymentStatus,
    required this.orderStatus,
    required this.price,
  });
}

class Order {
  final String id;
  final String product;
  Order({
    required this.id,
    required this.product,
  });
}

final DateFormat customFormat = DateFormat('dd-MM-yyyy');

List<OrderModel> demoOrders = [
  OrderModel(
  order: Order(id: 'ID001', product: 'product 1'),
    date: customFormat.parse("17-11-2024"),
    customer: "Jhon Andrew",
    orderStatus: "On Delivery",
    paymentStatus: "Paid",
    price: 45.55,
  ),
  OrderModel(
    order: Order(id: 'ID002', product: 'product 2'),
    date: customFormat.parse("17-11-2024"),
    customer: "Jhon Andrew",
    orderStatus: "Delivered",
    paymentStatus: "Unpaid",
    price: 38.15,
  ),
  OrderModel(
    order: Order(id: 'ID002', product: 'product 2'),
    date: customFormat.parse("17-11-2024"),
    customer: "Jhon Andrew",
    orderStatus: "Cancelled",
    paymentStatus: "Unpaid",
    price: 38.15,
  ),
    OrderModel(
    order: Order(id: 'ID002', product: 'product 2'),
    date: customFormat.parse("17-11-2024"),
    customer: "Jhon Andrew",
    orderStatus: "Cancelled",
    paymentStatus: "Unpaid",
    price: 38.15,
  ),
    OrderModel(
    order: Order(id: 'ID002', product: 'product 2'),
    date: customFormat.parse("17-11-2024"),
    customer: "Jhon Andrew",
    orderStatus: "Cancelled",
    paymentStatus: "Unpaid",
    price: 38.15,
  ),  OrderModel(
    order: Order(id: 'ID002', product: 'product 2'),
    date: customFormat.parse("17-11-2024"),
    customer: "Jhon Andrew",
    orderStatus: "Cancelled",
    paymentStatus: "Unpaid",
    price: 38.15,
  ),  OrderModel(
    order: Order(id: 'ID002', product: 'product 2'),
    date: customFormat.parse("17-11-2024"),
    customer: "Jhon Andrew",
    orderStatus: "Cancelled",
    paymentStatus: "Unpaid",
    price: 38.15,
  ),  OrderModel(
    order: Order(id: 'ID002', product: 'product 2'),
    date: customFormat.parse("17-11-2024"),
    customer: "Jhon Andrew",
    orderStatus: "Cancelled",
    paymentStatus: "Unpaid",
    price: 38.15,
  ),  OrderModel(
    order: Order(id: 'ID002', product: 'product 2'),
    date: customFormat.parse("17-11-2024"),
    customer: "Jhon Andrew",
    orderStatus: "Cancelled",
    paymentStatus: "Unpaid",
    price: 38.15,
  ),  OrderModel(
    order: Order(id: 'ID002', product: 'product 2'),
    date: customFormat.parse("17-11-2024"),
    customer: "Jhon Andrew",
    orderStatus: "Cancelled",
    paymentStatus: "Unpaid",
    price: 38.15,
  ),  OrderModel(
    order: Order(id: 'ID002', product: 'product 2'),
    date: customFormat.parse("17-11-2024"),
    customer: "Jhon Andrew",
    orderStatus: "Cancelled",
    paymentStatus: "Unpaid",
    price: 38.15,
  ),  OrderModel(
    order: Order(id: 'ID002', product: 'product 2'),
    date: customFormat.parse("17-11-2024"),
    customer: "Jhon Andrew",
    orderStatus: "Cancelled",
    paymentStatus: "Unpaid",
    price: 38.15,
  ),  OrderModel(
    order: Order(id: 'ID002', product: 'product 2'),
    date: customFormat.parse("17-11-2024"),
    customer: "Jhon Andrew",
    orderStatus: "Cancelled",
    paymentStatus: "Unpaid",
    price: 38.15,
  ),  OrderModel(
    order: Order(id: 'ID002', product: 'product 2'),
    date: customFormat.parse("17-11-2024"),
    customer: "Jhon Andrew",
    orderStatus: "Cancelled",
    paymentStatus: "Unpaid",
    price: 38.15,
  ),  OrderModel(
    order: Order(id: 'ID002', product: 'product 2'),
    date: customFormat.parse("17-11-2024"),
    customer: "Jhon Andrew",
    orderStatus: "Cancelled",
    paymentStatus: "Unpaid",
    price: 38.15,
  ),  OrderModel(
    order: Order(id: 'ID002', product: 'product 2'),
    date: customFormat.parse("17-11-2024"),
    customer: "Jhon Andrew",
    orderStatus: "Cancelled",
    paymentStatus: "Unpaid",
    price: 38.15,
  ),  OrderModel(
    order: Order(id: 'ID002', product: 'product 2'),
    date: customFormat.parse("17-11-2024"),
    customer: "Jhon Andrew",
    orderStatus: "Cancelled",
    paymentStatus: "Unpaid",
    price: 38.15,
  ),  OrderModel(
    order: Order(id: 'ID003', product: 'product 2'),
    date: customFormat.parse("17-11-2024"),
    customer: "Tate Andrew",
    orderStatus: "Cancelled",
    paymentStatus: "Unpaid",
    price: 38.15,
  ),
];
