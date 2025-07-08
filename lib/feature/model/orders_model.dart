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
    required this.product
  });
}

List<OrderModel> demoOrders = [
  OrderModel(
    order: Order(id: 'ID001', product: 'product 1'),
    date: DateTime.parse("2025-7-7"),
    customer: "customerName",
    orderStatus: "Paid",
    paymentStatus: "On Delivery",
    price: 45.55,
  ),
  OrderModel(
    order: Order(id: 'ID002', product: 'product 2'),
    date: DateTime.parse("2025-6-17"),
    customer: "customerName",
    orderStatus: "Paid",
    paymentStatus: "Delivered",
    price: 38.15,
  ),
];