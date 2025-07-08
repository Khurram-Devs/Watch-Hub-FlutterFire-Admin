import 'package:adminside/feature/model/orders_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:adminside/core/res/responsive.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class OrdersDataSource extends DataGridSource {
  List<DataGridRow> _dataGridRows = [];
  List<OrderModel> _orders;
  final BuildContext context;

  OrdersDataSource({required List<OrderModel> orders, required this.context})
      : _orders = orders {
    _updateDataGridRow();
  }

  @override
  List<DataGridRow> get rows => _dataGridRows;

  void _updateDataGridRow() {
    _dataGridRows = _orders.map<DataGridRow>((order) {
      return DataGridRow(cells: [
        DataGridCell(columnName: 'Orders', value: order.order),
        DataGridCell(columnName: 'Date', value: order.date),
        DataGridCell(columnName: 'Customer', value: order.customer),
        DataGridCell(columnName: 'Payment', value: order.paymentStatus),
        DataGridCell(columnName: 'Status', value: order.orderStatus),
        DataGridCell(columnName: 'Price', value: order.price),
      ]);
    }).toList();
  }

  void updateData(List<OrderModel> newData) {
    _orders = newData;
    _updateDataGridRow();
    notifyListeners();
  }

  @override
  @override
DataGridRowAdapter? buildRow(DataGridRow row) {
  final dateFormatter = DateFormat('d-M-yy');
  final isDesktop = Responsive.isDesktop(context);
  final baseTextStyle = GoogleFonts.inter(
    fontSize: isDesktop ? 14 : 11,
    fontWeight: FontWeight.w600,
    textStyle: TextStyle(overflow: TextOverflow.clip),
  );

  return DataGridRowAdapter(
    cells: row.getCells().map<Widget>((cell) {
      Widget cellWidget;

      if (cell.columnName == 'Orders') {
        final order = cell.value as Order;
        cellWidget = Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              order.product,
              style: baseTextStyle.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              overflow: TextOverflow.ellipsis,
              softWrap: false,
            ),
            const SizedBox(height: 4),
            Text(
              order.id,
              style: baseTextStyle.copyWith(
                fontWeight: FontWeight.w400,
                color: Colors.black45,
                fontSize: isDesktop ? 13 : 10,
              ),
              overflow: TextOverflow.clip,
              softWrap: false,
            ),
          ],
        );
      } else if (cell.columnName == 'Date') {
        cellWidget = Text(
          dateFormatter.format(cell.value),
          style: baseTextStyle.copyWith(color: Colors.black),
        );
      } else if (cell.columnName == 'Payment' || cell.columnName == 'Status') {
        String value = cell.value.toString();
        Color bgColor;
        Color textColor;

        switch (value) {
          case 'Paid':
            bgColor = const Color(0xFFE7F7EF);
            textColor = const Color(0xFF0CAF60);
            break;
          case 'Unpaid':
            bgColor = const Color(0xFFF4F0FF);
            textColor = const Color(0xFF8C62FF);
            break;
          case 'Cancelled':
          case 'Canceled':
            bgColor = const Color(0xFFFFF0F0);
            textColor = const Color(0xFFFD6A6A);
            break;
          case 'Delivered':
            bgColor = const Color(0xFFE7F7EF);
            textColor = const Color(0xFF0CAF60);
            break;
          case 'On Delivery':
            bgColor = const Color(0xFFFFF0E6);
            textColor = const Color(0xFFFE964A);
            break;
          default:
            bgColor = Colors.grey.shade200;
            textColor = Colors.black;
        }

        cellWidget = Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            value,
            style: baseTextStyle.copyWith(color: textColor),
            overflow: TextOverflow.clip,
            softWrap: false,
          ),
        );
      } else if (cell.columnName == 'Price') {
        cellWidget = Text(
          '\$${cell.value.toString()}',
          style: baseTextStyle.copyWith(color: Colors.black),
        );
      } else {
        cellWidget = Text(
          cell.value.toString(),
          style: baseTextStyle.copyWith(color: Colors.black),
        );
      }

      return Container(
        alignment: cell.columnName == 'Orders'
            ? Alignment.centerLeft
            : Alignment.center,
        padding: EdgeInsets.symmetric(
          horizontal: isDesktop ? 30 : 12,
          vertical: 14,
        ),
        child: cellWidget,
      );
    }).toList(),
  );
}

}
