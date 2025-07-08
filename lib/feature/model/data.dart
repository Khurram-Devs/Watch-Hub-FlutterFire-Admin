class Data {
  final String num;
  final String title;
  final String icon;

  Data({required this.num, required this.title, required this.icon});
}


final List<Data> data = [
  Data(num: "345", title: "Total Menu", icon: "assets/icons/menu_dash.svg"),
  Data(num: "\$21,254", title: "Total Revenue", icon: "assets/icons/activity_dash.svg"),
  Data(num: "361", title: "Total Customer", icon: "assets/icons/customer_dash.svg"),
  Data(num: "361", title: "Total Orders", icon: "assets/icons/order_dash.svg"),
];